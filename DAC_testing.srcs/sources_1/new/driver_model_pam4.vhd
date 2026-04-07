library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- ==============================================================================
-- Module Name: driver_model_pam4
-- Description: Maps 2-bit PAM-4 symbols to 14-bit physical DAC values.
--              Implements oversampling (N times per symbol).
--              Outputs 32-bit AXI-Stream data to drive BOTH CH1 and CH2 
--              of the Zmod DAC simultaneously.
-- ==============================================================================

entity driver_model_pam4 is
    Generic (
        OVERSAMPLE_RATE : integer := 4 
    );
    Port (
        clk_i         : in  STD_LOGIC;
        rst_ni        : in  STD_LOGIC;
        pam4_sym_i    : in  STD_LOGIC_VECTOR(1 downto 0);
        lfsr_en_o     : out STD_LOGIC;
        
        -- Upgraded to 32-bit for Dual-Channel DAC
        m_axis_tdata  : out STD_LOGIC_VECTOR(31 downto 0); 
        m_axis_tvalid : out STD_LOGIC;
        m_axis_tready : in  STD_LOGIC
    );
end driver_model_pam4;

architecture Behavioral of driver_model_pam4 is

    signal sample_cnt : integer range 0 to OVERSAMPLE_RATE - 1;
    signal mapped_val : signed(13 downto 0);
    
    -- Internal 16-bit wire for a single channel
    signal ch_data    : std_logic_vector(15 downto 0);

begin

    -- 1. Combinational Mapping
    process(pam4_sym_i)
    begin
        case pam4_sym_i is
            when "00" => mapped_val <= to_signed(-6000, 14); -- Level 0
            when "01" => mapped_val <= to_signed(-2000, 14); -- Level 1
            when "11" => mapped_val <= to_signed( 2000, 14); -- Level 2
            when "10" => mapped_val <= to_signed( 6000, 14); -- Level 3
            when others => mapped_val <= (others => '0');
        end case;
    end process;

    -- 2. Format 16-bit channel data (Sign extension)
    ch_data(13 downto 0) <= std_logic_vector(mapped_val);
    ch_data(15 downto 14) <= (others => mapped_val(13));

    -- 3. AXI-Stream Output & Oversampling
    process(clk_i, rst_ni)
    begin
        if rst_ni = '0' then
            sample_cnt    <= 0;
            m_axis_tvalid <= '0';
            m_axis_tdata  <= (others => '0');
            lfsr_en_o     <= '0';
            
        elsif rising_edge(clk_i) then
            
            m_axis_tvalid <= '1';
            lfsr_en_o     <= '0'; 

            -- Pack the same data into both Channel 1 (lower) and Channel 2 (upper)
            m_axis_tdata(15 downto 0)  <= ch_data;
            m_axis_tdata(31 downto 16) <= ch_data;

            if m_axis_tready = '1' then 
                if sample_cnt = OVERSAMPLE_RATE - 1 then
                    sample_cnt <= 0;
                    lfsr_en_o  <= '1'; 
                else
                    sample_cnt <= sample_cnt + 1;
                end if;
            end if;
            
        end if;
    end process;

end Behavioral;