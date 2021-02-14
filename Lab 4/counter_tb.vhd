
-- Greg Stitt
-- University of Florida

-- The following testbench generates inputs for the counter2 entity. Make
-- sure to change the architecture that is instantiated to test each
-- implementation. 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity counter_tb is
end counter_tb;


architecture TB of counter_tb is
    signal clk50Mhz    : std_logic := '0';
    signal rst         : std_logic := '0';
	 signal load_n		  : std_logic := '1';
    signal up_n        : std_logic := '1';
	 signal go          : std_logic := '1';
	 signal input       : std_logic_vector(3 downto 0);
    signal output      : std_logic_vector(3 downto 0);

    signal done : std_logic := '0';    
    
begin

    -- Change the architecture to test the different implementations and
    -- different max_values
    UUT : entity work.counter
        port map (
            clk    => clk50Mhz,
            rst    => rst,
				go     => go,
            up_n   => up_n,
				load_n => load_n,
				input  => input,
            output => output);

    -- create the clock (and not done ensure that the simulation will finish)
    clk50Mhz <= not clk50Mhz and not done after 10 ns;

    -- toggle the up input every 500 ns;
    up_n <= not up_n and not done after 500 ns;

    -- stop the simulation after 5000 ns;
    done <= '1' after 1000 ns;
    
    process
    begin
        -- reset the counter for 4 cycles
        rst <= '1';
        for i in 0 to 3 loop
            wait until rising_edge(clk50Mhz);
        end loop;
			
		  go <= '0';
        wait until rising_edge(clk50Mhz);
		  
        rst <= '0';
        wait until rising_edge(clk50Mhz);
		  	  
		  up_n <= '0';

		  wait until rising_edge(clk50Mhz);
		  
		  up_n <= '0';

		  wait until rising_edge(clk50Mhz);
		  
		  up_n <= '1';

		  wait until rising_edge(clk50Mhz);
		  
		  up_n <= '1';		 

		  wait until rising_edge(clk50Mhz);
		  
		  input <= "1111";
		  
		  wait until rising_edge(clk50Mhz);
		  		  
		  load_n <= '0';
		  
		  wait until rising_edge(clk50Mhz);
		  
		  input <= "1001";
		  
		  wait until rising_edge(clk50Mhz);
		  
		  input <= "1011";
		  
		  wait until rising_edge(clk50Mhz);
		  		  
		  load_n <= '0';		  
		  
		  wait until rising_edge(clk50Mhz);
		   
			rst <= '1';
        for i in 0 to 3 loop
            wait until rising_edge(clk50Mhz);
        end loop;
		  		  		  
		  go <= '1';
		  
        wait until rising_edge(clk50Mhz);
		  
        rst <= '0';
		  
        wait until rising_edge(clk50Mhz);
		  	  
		  up_n <= '0';

		  wait until rising_edge(clk50Mhz);
		  
		  up_n <= '0';

		  wait until rising_edge(clk50Mhz);
		  
		  up_n <= '1';

		  wait until rising_edge(clk50Mhz);
		  
		  up_n <= '1';		 

		  wait until rising_edge(clk50Mhz);
		  
		  input <= "1111";
		  
		  wait until rising_edge(clk50Mhz);
		  		  
		  load_n <= '0';
		  
		  wait until rising_edge(clk50Mhz);
		  
		  input <= "1001";
		  
		  wait until rising_edge(clk50Mhz);
		  
		  input <= "1011";
		  
		  wait until rising_edge(clk50Mhz);
		  		  
		  load_n <= '0';
		  
		  report "Done!";
		  done <= '1';

        -- wait until done is asserted
        wait;
               
    end process;
    
    
end TB;
