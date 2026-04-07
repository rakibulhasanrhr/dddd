library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lfsr_prbs15_pam2 is
Port (
    clk_i  : in  STD_LOGIC;
    rst_ni : in  STD_LOGIC;
    en_i   : in  STD_LOGIC;
    data_o : out STD_LOGIC
);
end lfsr_prbs15_pam2;

architecture Behavioral of lfsr_prbs15_pam2 is

-- ✅ Initialize to NON-ZERO (VERY IMPORTANT)
signal lfsr_reg : STD_LOGIC_VECTOR(14 downto 0) := (others => '1');

signal feedback : STD_LOGIC;

begin

-- PRBS-15: x^15 + x^14 + 1
feedback <= lfsr_reg(14) xor lfsr_reg(13);

process(clk_i, rst_ni)
begin
    if rst_ni = '0' then
        -- ✅ Safe reset (not zero!)
        lfsr_reg <= (others => '1');

    elsif rising_edge(clk_i) then
        if en_i = '1' then
            -- Shift left, insert feedback
            lfsr_reg <= lfsr_reg(13 downto 0) & feedback;
        end if;
    end if;
end process;

-- ✅ Better output bit (more "random looking")
data_o <= lfsr_reg(14);

end Behavioral;