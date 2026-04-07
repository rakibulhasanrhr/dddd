----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/11/2026 02:00:27 PM
-- Design Name: 
-- Module Name: Noise_generator - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;                -- it repeats every 52 us
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Data_generator is
 Port ( 
    aclk   : in  std_logic;
    aresetn : in  std_logic;
    m_axis_tdata : out std_logic_vector(31 downto 0);
    m_axis_tvalid   : out STD_LOGIC;
    m_axis_tready   : in STD_LOGIC
    );
end Data_generator;

architecture Behavioral of Data_generator is
    signal lfsr            : std_logic_vector(15 downto 0);
    signal feedback        : std_logic;
    signal Bits_out        : std_logic_vector(13 downto 0);
    signal Timing_clock    : std_logic_vector(2 downto 0);
    signal clock           : std_logic;
begin

m_axis_tvalid <= '1';

    process(aclk, aresetn)
    begin
        if aresetn = '0' then
            -- Any non-zero seed is valid
            lfsr <= x"ACE1";
        elsif rising_edge(aclk) then
            lfsr <= lfsr(14 downto 0) & feedback;
        end if;
    end process;
    
    process(aclk)
    begin
    
    clock <= not(clock);
        if Clock = '1' then
            Timing_clock <= std_logic_vector(unsigned(Timing_clock) + 1);
        end if;
    if Timing_clock = "110" then
    
    Timing_clock <= (others => '0');
    feedback <= lfsr(15) xor lfsr(11) xor lfsr(9) xor lfsr(5);
    Bits_out(0) <= lfsr(0) xor lfsr(5) xor lfsr(9);
    Bits_out(1) <= lfsr(1) xor lfsr(6) xor lfsr(10);
    Bits_out(2) <= lfsr(2) xor lfsr(7) xor lfsr(12);
    Bits_out(3) <= lfsr(3) xor lfsr(8) xor lfsr(15);
    Bits_out(4) <= lfsr(4) xor lfsr(5) xor lfsr(9);
    Bits_out(5) <= lfsr(5) xor lfsr(6) xor lfsr(11);
    Bits_out(6) <= lfsr(6) xor lfsr(7) xor lfsr(13);
    Bits_out(7) <= lfsr(7) xor lfsr(8) xor lfsr(15);
    Bits_out(8) <= lfsr(8) xor lfsr(14) xor lfsr(9);
    Bits_out(9) <= lfsr(9) xor lfsr(15) xor lfsr(10);
    Bits_out(10) <= lfsr(10) xor lfsr(1) xor lfsr(12);
    Bits_out(11) <= lfsr(11) xor lfsr(2) xor lfsr(15);
    Bits_out(12) <= lfsr(12) xor lfsr(3) xor lfsr(11);
    Bits_out(13) <= lfsr(13) xor lfsr(4) xor lfsr(13);
    
    end if;
    
    
    m_axis_tdata(31 downto 18) <= Bits_out;
    m_axis_tdata(17 downto 16) <= "00";
    m_axis_tdata(15 downto 2) <= Bits_out;
    m_axis_tdata(1 downto 0) <= "00";
    

    end process;
    

end Behavioral;
