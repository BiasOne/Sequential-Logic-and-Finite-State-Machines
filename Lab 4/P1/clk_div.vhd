library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity clk_div is
    generic(
	 clk_in_freq  : natural := (50 * (10**6)) ; --5x10^6 or 50,000,000 or 50Mhz
    clk_out_freq : natural := 1000
	 );
	 
    port (
        clk_in  : in  std_logic;
        clk_out : out std_logic;
        rst     : in  std_logic
		  );
end clk_div;

architecture clkDivBHV of clk_div is
signal cnt: integer;
signal tmp: std_logic;


begin

	process(clk_in, rst)
	begin
	
	if (rst = '1') then
	cnt<=0;
	tmp <='0';
	
		elsif(rising_edge(clk_in)) then
		cnt <=cnt+1;
	
			if (cnt = (clk_in_freq/(clk_out_freq*2))-1) then
			cnt <= 0;
			tmp <= not tmp;
			--tmp <= '1';
			--elsif ( cnt = (clk_in_freq/clk_out_freq)-1) then
			--tmp <= '0';
	
			end if;
	end if;
		
	
end process;
	
clk_out <=tmp;

end clkDivBHV;