library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity giaima is
    Port (	
			  clk   : in  STD_LOGIC;
			  output_ones      :  in unsigned(3 downto 0);  
              output_tens      : in unsigned(3 downto 0); 
          	  anodes     : out STD_LOGIC_VECTOR (3 downto 0);
			  segments   : out STD_LOGIC_VECTOR (6 downto 0)
			  );	
end giaima;  

architecture Behavioral of giaima  is
	
    signal digit            : unsigned(3 downto 0)  := (others => '0');
    signal seven_seg_count  : unsigned(15 downto 0) := (others => '0');
	
begin

decode: process(digit)
    begin
        case digit is

           when "0001" => segments <= "1111001"; --1--
           when "0010" => segments <= "0100100";--2--
           when "0011" => segments <= "0110000";----3---
           when "0100" => segments <= "0011001";-----4---
           when "0101" => segments <= "0010010";----5----
           when "0110" => segments <= "0000010";---6---
           when "0111" => segments <= "1111000";----7---
           when "1000" => segments <= "0000000";-----8---
           when "1001" => segments <= "0010000";----9---
           when "1010" => segments <= "0001000";----A
           when "1011" => segments <= "0000011";---B
           when "1100" => segments <= "1000110";-----C
           when "1101" => segments <= "0100001";----D
           when "1110" => segments <= "0000110";---E
           when "1111" => segments <= "0001110";----F
           when others => segments <= "1000000";----0
        end case;
    end process;
	
seven_seg: process(clk)
    begin
        if rising_edge(clk) then
            if seven_seg_count(seven_seg_count'high) = '1' then
                digit <= output_ones;
                anodes <= "1110";
            else
                digit <= output_tens;
                anodes <= "1101";
            end if;
            seven_seg_count <= seven_seg_count +1;
        end if;
    end process;
  
	 
end Behavioral;