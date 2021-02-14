-- Greg Stitt
-- University of Florida

library ieee;
use ieee.std_logic_1164.all;

entity gray2_tb is
end gray2_tb;

architecture TB of gray2_tb is

  signal clk50MHz, rst, go : std_logic := '0';
  signal output       : std_logic_vector(3 downto 0);
  

begin

  Gray2 : entity work.gray2
    port map (
      clk    => clk50MHz,
      rst    => rst,
      go     => go,
      output => output);
  
  
  clk50MHz <= not clk50MHz after 5 ns;

  process
  begin

    rst <= '1';
    go  <= '0';
    for i in 0 to 5 loop
      wait until clk50MHz 'event and clk50MHz  = '1';
    end loop;  -- i

    rst <= '0';
    wait until clk50MHz 'event and clk50MHz  = '1';

    for i in 0 to 1000 loop
      for j in 0 to 3 loop
        go <= '1';
        wait until clk50MHz 'event and clk50MHz ='1';
      end loop;  -- j

      go <= '0';
      wait until clk50MHz 'event and clk50MHz ='1';      
    end loop;  -- i
    
  end process;
end;

