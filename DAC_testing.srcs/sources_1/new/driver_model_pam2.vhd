library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.NUMERIC_STD.ALL; 
-- ============================================================================== -- Module Name: driver_model_pam2 -- Description: -- PAM2 driver model with: -- • Symbol → current mapping -- • Moving average filter (length = 4) -- • Oversampling -- • AXI stream output to ZmodAWG DAC -- ============================================================================== 
entity driver_model_pam2 is 
Generic (
 OVERSAMPLE_RATE : integer := 4 
 ); 
 Port (
  clk_i : in STD_LOGIC; 
  rst_ni : in STD_LOGIC; -- PAM2 input symbol 
  pam2_sym_i : in STD_LOGIC; -- signal to enable LFSR update 
  lfsr_en_o : out STD_LOGIC; -- AXI Stream output 
  m_axis_tdata : out STD_LOGIC_VECTOR(31 downto 0); 
  m_axis_tvalid : out STD_LOGIC; 
  m_axis_tready : in STD_LOGIC 
  ); 
  end driver_model_pam2; 
  
  architecture Behavioral of driver_model_pam2 is 
  ---------------------------------------------------------------- -- Oversampling counter ---------------------------------------------------------------- 
  signal sample_cnt : integer range 0 to OVERSAMPLE_RATE-1 := 0; 
  ---------------------------------------------------------------- -- mapped current value ---------------------------------------------------------------- 
  signal mapped_val : signed(13 downto 0); 
  ---------------------------------------------------------------- -- moving average registers ---------------------------------------------------------------- 
  
  -- signal x0, x1, x2, x3 : signed(13 downto 0) := (others=>'0'); 
  -- signal sum : signed(15 downto 0); 
  -- signal filtered_val : signed(13 downto 0); 
  
  ---------------------------------------------------------------- -- DAC formatted data ---------------------------------------------------------------- 
  
  signal ch_data : std_logic_vector(15 downto 0); 
  begin 
  
  -------------------------------------------------------------------- -- 1. PAM2 Symbol Mapping -------------------------------------------------------------------- 
  
  process(pam2_sym_i) 
  
  begin 
  case pam2_sym_i is 
  when '0' => 
  mapped_val <= to_signed(1000,14); 
  when '1' => 
  mapped_val <= to_signed( 4000,14); 
  when others => 
  mapped_val <= (others=>'0'); 
  end case; 
  end process; 
  -------------------------------------------------------------------- -- 2. Moving Average Filter -- Updated only when a new symbol arrives -------------------------------------------------------------------- 
  --process(clk_i) 
  --begin 
  -- if rising_edge(clk_i) then 
  -- x3 <= x2; 
  -- x2 <= x1; 
  -- x1 <= x0; 
  -- x0 <= mapped_val; 
  -- sum <= resize(x0,16) + 
  -- resize(x1,16) + 
  -- resize(x2,16) + 
  -- resize(x3,16); 
  -- filtered_val <= sum(15 downto 2); 
  -- end if; 
  --end process; 
  
  -------------------------------------------------------------------- -- 3. Format data for DAC -------------------------------------------------------------------- 
  ch_data(13 downto 0) <= std_logic_vector(mapped_val); 
  ch_data <= (others => '0');
  -------------------------------------------------------------------- -- 4. AXI Stream Output + Oversampling -------------------------------------------------------------------- 
  process(clk_i, rst_ni) 
  begin 
  if rst_ni = '0' then 
  sample_cnt <= 0; 
  m_axis_tvalid <= '0'; 
  m_axis_tdata <= (others=>'0'); 
  lfsr_en_o <= '0'; 
  elsif rising_edge(clk_i) then 
  m_axis_tvalid <= '1'; 
  lfsr_en_o <= '0'; 
  -- send waveform to both DAC channels 
  m_axis_tdata(15 downto 0) <= ch_data; 
  m_axis_tdata(31 downto 16) <= ch_data; 
  if m_axis_tready = '1' then 
  if sample_cnt = OVERSAMPLE_RATE-1 then 
  sample_cnt <= 0; 
  lfsr_en_o <= '1'; 
  else 
  sample_cnt <= sample_cnt + 1; 
  end if; 
  end if; 
  end if; 
  end process; 
  end Behavioral;