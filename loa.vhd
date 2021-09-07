
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity loaa is
    Port (      clk: in  STD_LOGIC;
                a,b : out STD_LOGIC;
                chuc: in unsigned(3 downto 0)
                );
end loaa;

architecture Behavioral of loaa is
signal output_tens      : unsigned(3 downto 0)  := (others => '0');


Begin
      output_tens <= chuc;
--REGISTER
  process(clk) variable i : integer := 0;
    begin
      if rising_edge(clk) then
                if output_tens = "0000" then
                if i <= 150000 then i := i + 1;
             a <= '1' ; b <= '1';
                 elsif i > 150000 and i < 200000 then i := i + 1; a <= '0';b <= '0';
            elsif i = 200000 then i := 0;
            end if;
                end if;
                if output_tens <= "0001" then
            if i <= 150000 then i := i + 1;
             a <= '1' ; b <= '1';
                 elsif i > 150000 and i < 200000 then i := i + 1; a <= '0';b <= '0';
            elsif i = 200000 then i := 0;
            end if;
                end if;
                if output_tens <= "0010" then
             if i <= 150000 then i := i + 1;
             a <= '1' ; b <= '1';
                 elsif i > 150000 and i < 200000 then i := i + 1; a <= '0';b <= '0';
            elsif i = 200000 then i := 0;
            end if;
                end if;
                if output_tens <= "0011" then
             if i <= 150000 then i := i + 1;
             a <= '1' ; b <= '1';
                 elsif i > 150000 and i < 200000 then i := i + 1; a <= '0';b <= '0';
            elsif i = 200000 then i := 0;
            end if;
                end if;
                if output_tens <= "0100" then
             if i <= 150000 then i := i + 1;
             a <= '1' ; b <= '1';
                 elsif i > 150000 and i < 200000 then i := i + 1; a <= '0';b <= '0';
            elsif i = 200000 then i := 0;
            end if;
                end if;
                if output_tens <= "0101" then
             if i <= 150000 then i := i + 1;
             a <= '1' ; b <= '1';
                 elsif i > 150000 and i < 200000 then i := i + 1; a <= '0';b <= '0';
            elsif i = 200000 then i := 0;
            end if;
                end if;
                if output_tens <= "0110" then
             if i <= 150000 then i := i + 1;
             a <= '1' ; b <= '1';
                 elsif i > 150000 and i < 200000 then i := i + 1; a <= '0';b <= '0';
            elsif i = 200000 then i := 0;
            end if;
                end if;
                if output_tens <= "0111" then
             if i <= 150000 then i := i + 1;
             a <= '1' ; b <= '1';
                 elsif i > 150000 and i < 200000 then i := i + 1; a <= '0';b <= '0';
            elsif i = 200000 then i := 0;
            end if;
                end if;
                if output_tens <= "1000" then
             if i <= 150000 then i := i + 1;
             a <= '1' ; b <= '1';
                 elsif i > 150000 and i < 200000 then i := i + 1; a <= '0';b <= '0';
            elsif i = 200000 then i := 0;
            end if;
                end if;
          end if;

       end process;

end Behavioral;



