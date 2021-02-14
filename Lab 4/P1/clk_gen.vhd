library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity clk_gen is
    generic (
        ms_period : positive);          -- amount of ms for button to be
                                        -- pressed before creating clock pulse
    port (
        clk50MHz : in  std_logic;
        rst      : in  std_logic;
        button_n : in  std_logic;
        clk_out  : out std_logic);
end clk_gen;

architecture clkGenBHV of clk_gen is

	constant clk_in_freq  : natural := (50 * (10**6)) ;
   constant clk_out_freq : natural := 1000;
	signal output    : std_logic;
	signal cnt     : integer;
	signal tmpCnt  : integer;



begin

	process(clk50Mhz, rst)
	begin
	
	if (rst = '1') then
	cnt<=0;
	tmpCnt <=0;
	output <='0';
		
		elsif(rising_edge(clk50Mhz)) then
		---------------------------------------------------
			if (button_n ='0') then
			cnt <= cnt+1;
			
			else
			cnt <=0;
			tmpCnt <=0;
			
			end if; 
			
			if (cnt = (clk_in_freq/clk_out_freq*ms_period)) then
			tmpCnt <= cnt;
			cnt <=0;
	
			end if;
			
			if (tmpCnt = 0) then
			output <='0';
			
			elsif(tmpCnt > 0) then
			tmpCnt <=tmpCnt -1;
			output <='1';
			
			 
			end if;
		---------------------------------------------------	 
	end if;		
	
end process;
	
clk_out <=output;

end clkGenBHV;