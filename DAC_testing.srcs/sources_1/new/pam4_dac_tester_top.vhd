library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- ==============================================================================
-- Module Name: pam4_dac_tester_top
-- Description: Top-Level module connecting LFSR and Driver.
--              Exposes a 32-bit AXI4-Stream interface for Zmod DAC IP.
-- ==============================================================================

entity pam4_dac_tester_top is
    Port (
        m_axis_aclk    : in  STD_LOGIC;  
        m_axis_aresetn : in  STD_LOGIC;  
        btn_ctrl_i     : in  STD_LOGIC;  

        -- Upgraded to 32-bit AXI4-Stream Master Interface
        m_axis_tdata   : out STD_LOGIC_VECTOR(31 downto 0);
        m_axis_tvalid  : out STD_LOGIC;
        m_axis_tready  : in  STD_LOGIC
    );
end pam4_dac_tester_top;

architecture Structural of pam4_dac_tester_top is

    component lfsr_prbs15_pam4
        Port (
            clk_i    : in  STD_LOGIC;
            rst_ni   : in  STD_LOGIC;
            en_i     : in  STD_LOGIC;
            data_o   : out STD_LOGIC_VECTOR (1 downto 0)
        );
    end component;

    component driver_model_pam4
        Generic ( OVERSAMPLE_RATE : integer := 4 );
        Port (
            clk_i         : in  STD_LOGIC;
            rst_ni        : in  STD_LOGIC;
            pam4_sym_i    : in  STD_LOGIC_VECTOR(1 downto 0);
            lfsr_en_o     : out STD_LOGIC;
            
            -- Must match the 32-bit output in the Entity
            m_axis_tdata  : out STD_LOGIC_VECTOR(31 downto 0);
            m_axis_tvalid : out STD_LOGIC;
            m_axis_tready : in  STD_LOGIC
        );
    end component;

    signal w_pam4_sym       : STD_LOGIC_VECTOR(1 downto 0); 
    signal w_lfsr_en_driver : STD_LOGIC;                    
    signal w_lfsr_en_actual : STD_LOGIC;
    
    signal btn_sync_0, btn_sync_1 : std_logic := '0';
    signal debounce_cnt : unsigned(19 downto 0) := (others => '0'); 
    signal btn_state : std_logic := '0';
    signal run_state : std_logic := '0'; 

begin

    process(m_axis_aclk, m_axis_aresetn)
    begin
        if m_axis_aresetn = '0' then
            btn_sync_0   <= '0';
            btn_sync_1   <= '0';
            debounce_cnt <= (others => '0');
            btn_state    <= '0';
            run_state    <= '0'; 
            
        elsif rising_edge(m_axis_aclk) then
            btn_sync_0 <= btn_ctrl_i;
            btn_sync_1 <= btn_sync_0;
            
            if btn_sync_1 = '1' then
                if debounce_cnt(19) = '0' then
                    debounce_cnt <= debounce_cnt + 1;
                elsif btn_state = '0' then
                    btn_state <= '1';
                    run_state <= not run_state; 
                end if;
            else
                debounce_cnt <= (others => '0');
                btn_state <= '0';
            end if;
        end if;
    end process;

    w_lfsr_en_actual <= w_lfsr_en_driver and run_state;

    inst_lfsr: lfsr_prbs15_pam4
        port map (
            clk_i    => m_axis_aclk,
            rst_ni   => m_axis_aresetn,
            en_i     => w_lfsr_en_actual, 
            data_o   => w_pam4_sym
        );

    inst_driver: driver_model_pam4
        generic map (
            OVERSAMPLE_RATE => 4  
        )
        port map (
            clk_i         => m_axis_aclk,
            rst_ni        => m_axis_aresetn,
            pam4_sym_i    => w_pam4_sym,
            lfsr_en_o     => w_lfsr_en_driver,
            m_axis_tdata  => m_axis_tdata,
            m_axis_tvalid => m_axis_tvalid,
            m_axis_tready => m_axis_tready
        );

end Structural;