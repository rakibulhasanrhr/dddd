library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- ==============================================================================
-- Module Name: lfsr_prbs15_pam4
-- Description: A Pseudo-Random Bit Sequence (PRBS-15) generator optimized for 
--              PAM-4 applications. It generates 2 bits in parallel every time 
--              it is enabled, matching the 2-bits-per-symbol requirement.
-- Polynomial:  x^15 + x^14 + 1
-- ==============================================================================

entity lfsr_prbs15_pam4 is
    Port (
        clk_i    : in  STD_LOGIC;  -- System clock (e.g., 100 MHz from DAC controller)
        rst_ni   : in  STD_LOGIC;  -- Active-LOW asynchronous reset (Start/Stop control)
        en_i     : in  STD_LOGIC;  -- Enable signal (Controls the symbol generation rate)
        data_o   : out STD_LOGIC_VECTOR (1 downto 0) -- 2-bit output for one PAM-4 symbol
    );
end lfsr_prbs15_pam4;

architecture Behavioral of lfsr_prbs15_pam4 is
    
    -- 15-bit shift register for PRBS-15
    signal lfsr_reg : STD_LOGIC_VECTOR(14 downto 0);
    
    -- Feedback signals for parallel 2-bit shifting
    signal fb_0     : STD_LOGIC;
    signal fb_1     : STD_LOGIC;

begin

    -- Calculate the feedback bits for a 2-bit parallel shift.
    -- Standard PRBS-15 taps are at bit 15 and 14 (indices 14 and 13).
    fb_0 <= lfsr_reg(14) xor lfsr_reg(13);
    fb_1 <= lfsr_reg(13) xor lfsr_reg(12);

    process(clk_i, rst_ni)
    begin
        if rst_ni = '0' then
            -- RESET / STOP state: 
            -- The LFSR seed must NEVER be all zeros, otherwise it locks up.
            -- Setting the LSB to '1' ensures it starts correctly.
            lfsr_reg <= (0 => '1', others => '0');
            
        elsif rising_edge(clk_i) then
            -- START / RUN state:
            -- Only shift the register when the enable signal is HIGH.
            if en_i = '1' then
                -- Shift left by 2 positions and append the new feedback bits
                lfsr_reg <= lfsr_reg(12 downto 0) & fb_1 & fb_0;
            end if;
        end if;
    end process;

    -- Output the two newest bits continuously to the Driver Model
    data_o <= lfsr_reg(1 downto 0);

end Behavioral;