library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
    port (
        clk    : in  std_logic;
        rst    : in  std_logic;
        go     : in std_logic;
        up_n   : in  std_logic;         -- active low
        load_n : in  std_logic;         -- active low
        input  : in  std_logic_vector(3 downto 0);
        output : out std_logic_vector(3 downto 0));
end counter;

architecture counterBHV of counter is
    -- use a 4 bit unsigned instead of an integer.
    signal count : unsigned(3 downto 0);
	 
begin

    process(clk, rst)
	 
    begin
	 
		if (rst = '1') then
		count <= "0000";
		
		elsif (rising_edge(clk)) then
		
			if(go='1') then
		
				if(load_n ='0') then
				count <= unsigned(input(3 downto 0));
				-- notice here that we can just add or subtract 1
				elsif (up_n = '0') then
				count <= count + 1; 
			
				else             
				count <= count - 1; 	
		
				end if;
			
			else
			count <=count;
				
			end if;
		end if;
	end process;
  
output <= std_logic_vector(count);

end counterBHV;
