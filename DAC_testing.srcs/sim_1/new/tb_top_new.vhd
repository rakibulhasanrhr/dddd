library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_top_new is
-- Testbench has no ports
end tb_top_new;

architecture Behavioral of tb_top_new is

    component pam2_dac_tester_top
        Port (
            m_axis_aclk    : in  STD_LOGIC;
            m_axis_aresetn : in  STD_LOGIC;
            btn_ctrl_i     : in  STD_LOGIC;
            m_axis_tdata   : out STD_LOGIC_VECTOR(31 downto 0);
            m_axis_tvalid  : out STD_LOGIC;
            m_axis_tready  : in  STD_LOGIC
            
        );
    end component;

    -- Signals
    signal clk_tb    : std_logic := '0';
    signal rstn_tb   : std_logic := '0';
    signal btn_tb    : std_logic := '0';
    signal tdata_tb  : std_logic_vector(31 downto 0);
    signal tvalid_tb : std_logic;
    signal tready_tb : std_logic := '1'; -- DAC is always ready in this test

    -- 40 MHz clock -> Period is 25 ns
    constant CLK_PERIOD : time := 25 ns;

begin

    uut: pam2_dac_tester_top port map (
        m_axis_aclk    => clk_tb,
        m_axis_aresetn => rstn_tb,
        btn_ctrl_i     => btn_tb,
        m_axis_tdata   => tdata_tb,
        m_axis_tvalid  => tvalid_tb,
        m_axis_tready  => tready_tb
    );

    -- Clock process
    clk_process : process
    begin
        clk_tb <= '0'; wait for CLK_PERIOD / 2;
        clk_tb <= '1'; wait for CLK_PERIOD / 2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- 1. System Reset
        rstn_tb <= '0';
        btn_tb  <= '0';
        wait for 100 ns;
        
        -- Release reset
        rstn_tb <= '1';
        wait for 1 us; -- Wait a bit. Output should be strictly 0 here.

        -- 2. Simulate a human pressing the button
        -- We MUST hold it for > 13.1 ms to pass the debounce counter!
        btn_tb <= '1';
        wait for 15 ms; 
        
        -- Release the button
        btn_tb <= '0';

        -- 3. Let the system run and generate PAM-4 data
        -- Observe the waveforms in this time window
        wait for 5 ms; 

        -- End simulation
        wait;
    end process;

end Behavioral;