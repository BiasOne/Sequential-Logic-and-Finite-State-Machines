library ieee;
use ieee.std_logic_1164.all;

entity grayQuiz is
    port (
        clk    : in  std_logic;
        rst    : in  std_logic;
        go     : in std_logic;
        output : out std_logic_vector(3 downto 0));
end grayQuiz;

architecture quizBHV of grayQuiz is
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
	output  <= "1010";
	if (go = '1') then
	next_state <= STATE_1;
	else
	next_state <= STATE_0;
	end if;
 
	when STATE_1 =>          
	output  <= "1011";
	if (go = '1') then
	next_state <= STATE_2;
	else
	next_state <= STATE_1;
	end if;
 
	when STATE_2 =>          
	output  <= "0000";
	if (go = '1') then
	next_state <= STATE_3;
	else
	next_state <= STATE_2;
	end if;
 
	when STATE_3 =>          
	output  <= "1100";
	if (go  = '1') then
	next_state <= STATE_4;
	else
	next_state <= STATE_3;
	end if;
 
	when STATE_4 =>          
	output  <= "0000";
	if (go  = '1') then
	next_state <= STATE_5;
	else
	next_state <= STATE_4;
	end if;
  
	when STATE_5 =>          
	output  <= "1101";
	if (go  = '1') then
	next_state <= STATE_0;
	else
	next_state <= STATE_5;
	end if;
	
	when others =>null;
	
	end case;
 
 end process;
 end QuizBHV;