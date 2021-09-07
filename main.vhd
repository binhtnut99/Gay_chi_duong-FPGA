library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity main is
    Port (  a,b : out STD_LOGIC;
              clk   : in  STD_LOGIC;
              sonar_trig : out STD_LOGIC;
           sonar_echo : in  STD_LOGIC;
           anodes     : out STD_LOGIC_VECTOR (3 downto 0);
              segments   : out STD_LOGIC_VECTOR (6 downto 0));
end main;

architecture Behavioral of main is
    signal output_ones      : unsigned(3 downto 0)  := (others => '0');
    signal output_tens      : unsigned(3 downto 0)  := (others => '0'); 
begin

khoangcach: entity work.dockhoangcach
    port map( clk => clk,
              sonar_trig => sonar_trig,
              donvi  => output_ones,    
              chuc => output_tens,  
              sonar_echo => sonar_echo
              );
seg7: entity work. giaima
  Port map  (
              clk   => clk,
              output_ones => output_ones,
              output_tens => output_tens,
              anodes   => anodes,
              segments => segments
              );
bell: entity work.loaa
  Port map  (
              clk   => clk,
            chuc   => output_tens ,
              a  => a,
              b  => b
              );

end Behavioral;

