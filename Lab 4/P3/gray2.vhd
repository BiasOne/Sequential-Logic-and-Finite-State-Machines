library ieee;
use ieee.std_logic_1164.all;

entity gray2 is
    port (
        clk    : in  std_logic;
        rst    : in  std_logic;
        go     : in std_logic;
        output : out std_logic_vector(3 downto 0));
end gray2;

architecture gray2BHV of gray2 is
type STATE_TYPE is (STATE_0, STATE_1, STATE_2, STATE_3, STATE_4, STATE_5, STATE_6, STATE_7, STATE_8, STATE_9, STATE_10, STATE_11, STATE_12, STATE_13, STATE_14, STATE_15);  
signal state, next_state : STATE_TYPE; 

begin

process(clk, rst)
begin 

	if (rst = '1') then
	state <= STATE_0;
	elsif(rising_edge(clk)) then
	state <= next_state;
	end if;
end process;
	 
process(go, state)
begin
		
	case state is 	
	when STATE_0 =>          
	output  <= "0000";
	if (go = '1') then
	next_state <= STATE_1;
	else
	next_state <= STATE_0;
	end if;
 
	when STATE_1 =>          
	output  <= "0001";
	if (go = '1') then
	next_state <= STATE_2;
	else
	next_state <= STATE_1;
	end if;
 
	when STATE_2 =>          
	output  <= "0011";
	if (go = '1') then
	next_state <= STATE_3;
	else
	next_state <= STATE_2;
	end if;
 
	when STATE_3 =>          
	output  <= "0010";
	if (go  = '1') then
	next_state <= STATE_4;
	else
	next_state <= STATE_3;
	end if;
 
	when STATE_4 =>          
	output  <= "0110";
	if (go  = '1') then
	next_state <= STATE_5;
	else
	next_state <= STATE_4;
	end if;
 
	when STATE_5 =>          
	output  <= "0111";
	if (go  = '1') then
	next_state <= STATE_6;
	else
	next_state <= STATE_5;
	end if;
 
	when STATE_6 =>          
	output  <= "0101";
	if (go  = '1') then
	next_state <= STATE_7;
	else
	next_state <= STATE_6;
	end if;
 
	when STATE_7 =>          
	output  <= "0100";
	if (go  = '1') then
	next_state <= STATE_8;
	else
	next_state <= STATE_7;
	end if;
 
	when STATE_8 =>          
	output  <= "1100";
	if (go  = '1') then
	next_state <= STATE_9;
	else
	next_state <= STATE_8;
	end if;
 
	when STATE_9 =>          
	output  <= "1101";
	if (go  = '1') then
	next_state <= STATE_10;
	else
	next_state <= STATE_9;
	end if;
 
	when STATE_10 =>          
	output  <= "1111";
	if (go  = '1') then
	next_state <= STATE_11;
	else
	next_state <= STATE_10;
	end if;
 
	when STATE_11 =>          
	output  <= "1110";
	if (go  = '1') then
	next_state <= STATE_12;
	else
	next_state <= STATE_11;
	end if; 

	when STATE_12 =>          
	output  <= "1010";
	if (go  = '1') then
	next_state <= STATE_13;
	else
	next_state <= STATE_12;
	end if;
 
	when STATE_13 =>          
	output  <= "1011"; 
	if (go  = '1') then
	next_state <= STATE_14;
	else
	next_state <= STATE_13;
	end if;
 
	when STATE_14 =>          
	output  <= "1001";
	if (go  = '1') then
	next_state <= STATE_15;
	else
	next_state <= STATE_14;
	end if;
 
	when STATE_15 =>          
	output  <= "1000";
	if (go  = '1') then
	next_state <= STATE_0;
	else
	next_state <= STATE_15;
	end if;
	
	when others =>null;
	
	end case;
 
 end process;
 end gray2BHV;