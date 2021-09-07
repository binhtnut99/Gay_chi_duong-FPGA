library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity dockhoangcach is
    Port (
              clk   : in  STD_LOGIC;
              sonar_trig : out STD_LOGIC;
              chuc: out unsigned(3 downto 0);  
              donvi: out unsigned(3 downto 0);  
              sonar_echo : in  STD_LOGIC );
                      
end dockhoangcach;
architecture Behavioral of dockhoangcach is
    
     signal count            : unsigned(16 downto 0) := (others => '0');
    signal centimeters      : unsigned(15 downto 0) := (others => '0');
    signal centimeters_ones : unsigned(3 downto 0)  := (others => '0');
    signal centimeters_tens : unsigned(3 downto 0)  := (others => '0');
     signal output_ones      :   unsigned(3 downto 0);  
    signal  output_tens      :  unsigned(3 downto 0);  
    signal echo_last        : std_logic := '0';
    signal echo_synced      : std_logic := '0';
    signal echo_unsynced    : std_logic := '0';
    signal waiting          : std_logic := '0';
begin    


             chuc <= output_tens ;
             donvi <= output_ones;
process(clk) variable i : integer := 0;
    begin
        if rising_edge(clk) then----neu clk m?c 1--
            if waiting = '0' then
                if count = 1000 then -- xung he thong có f=100MHz
                   -- After 10us then go into waiting mode//- Sau 10us roi chuyen sang che do cho
                   sonar_trig <= '0';---chan trig keo ve khong
                   waiting    <= '1';----bat delay--
                   count       <= (others => '0');----dem gan ve khong de bat dau dem lai tu dau--
                else-----neu count khong bang 1000 hay cout<1000
                   sonar_trig <= '1'; ----trig van duoc gan bang 1--
                   count <= count+1; ---van dem ----
                end if;
            elsif echo_last = '0' and echo_synced = '1' then
                -- nhin thay tang bat dau dem---
                count       <= (others => '0');
                centimeters <= (others => '0');
                centimeters_ones <= (others => '0');
                centimeters_tens <= (others => '0');
            elsif echo_last = '1' and echo_synced = '0' then
                -- nhin thay clk giam xuong muc thap, bat dau tinh khoang cach
                output_ones <= centimeters_ones;
                output_tens <= centimeters_tens;
            elsif count = (2900) then----- 58micro giay/58 = 1cm
                -- tinh toan khoang cach--
                if centimeters_ones = 9 then----neu dau ra 1 so trên led 7 thanh =9---
                    centimeters_ones <= (others => '0');-----centimeters_ones gan ve khong
                    centimeters_tens <= centimeters_tens + 1; ---- centimeters_tens cong mot--
                else
                    centimeters_ones <= centimeters_ones + 1;---- neu centimeters_one <9 thi centimeters_ones = centimeters_ones  cong mot
                end if;
                centimeters <= centimeters + 1; 
                count <= (others => '0');
                if centimeters = 3448 then
                    -- het thoi gian cho phan hoi - va tiep tuc gui xung khac 
                    waiting <= '0';----xoa timer ve khong de tiep tuc gui xung khac----
                end if;
            else
                count <= count + 1;
            end if;

            echo_last     <= echo_synced;
            echo_synced   <= echo_unsynced;
            echo_unsynced <= sonar_echo;

            end if;

    end process;
     
end Behavioral;
