library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY tb_MUX4TO1 IS
END tb_MUX4TO1;

ARCHITECTURE behavior OF tb_MUX4TO1 IS
	
	COMPONENT MUX4TO1 is
		port (  in1     : in  std_logic_vector(15 downto 0);
       			in2     : in  std_logic_vector(15 downto 0);
	   		in3	   : in  std_logic_vector(15 downto 0);
	   		in4	   : in  std_logic_vector(15 downto 0);
       			s       : in  std_logic_vector(1 downto 0);
       			mux_out : out std_logic_vector(15 downto 0)
      		);
	end COMPONENT;

 	signal in1             : std_logic_vector (15 downto 0);
    	signal in2	       : std_logic_vector (15 downto 0);
    	signal in3             : std_logic_vector (15 downto 0);
	signal in4             : std_logic_vector (15 downto 0);
	signal s               : std_logic_vector(1 downto 0);
	signal mux_out         : std_logic_vector (15 downto 0);
	
	constant time_delay   : time := 20 ns;

BEGIN
	
   
	
    uut: MUX4TO1 port map ( 
	  in1     => in1,
          in2     => in2,
          in3     => in3,
          in4     => in4,
	  s       => s,
          mux_out =>mux_out
          );

	stim_process: process
      		begin
		
		assert false report "MUX4TO1 testbench started"; -- puts a note in the ModelSim transcript window
		  
		-- initialize inputs and select bit to 00 to clear everything
		
		in1 <= "0000"&"0000"&"0000"&"0000"; in2 <= "0000"&"0000"&"0000"&"0000";
		in3 <= "0000"&"0000"&"0000"&"0000"; in4 <= "0000"&"0000"&"0000"&"0000";
		s <= "00";
			wait for time_delay;
		
		
		-- first simulate when s = 00; i.e. when in1 is being selected
		
		in1 <= "1111"&"0000"&"0000"&"0000"; in2 <= "0000"&"0000"&"1111"&"0000";
		in3 <= "0000"&"1111"&"0000"&"0000"; in4 <= "0000"&"0000"&"0000"&"1111"; -- output = in1
			wait for time_delay;
		in1 <= "1111"&"0000"&"1111"&"0000"; in2 <= "0110"&"0000"&"1001"&"0000";
		in3 <= "0000"&"1111"&"0000"&"1111"; in4 <= "0000"&"0110"&"0000"&"1001"; -- output = in1
			wait for time_delay;
			
		-- now simulate when s = 1; i.e. when in2 is being selected	
		
		s <= "01"; 																-- output = in2
			wait for time_delay;
		
			
		-- now switch to s = 10; i.e. when in3 is being selected
		
		s <= "10"; 																-- output = in1
			wait for time_delay;
		
		 -- now switch to s = 11; i.e. when in4 is being selected
		
		s <= "11"; 																-- output = in1
			wait for time_delay; 
		-- now switch to s = 00; i.e. when in1 is being selected
		
		s <= "00";
			wait for time_delay;
		-- end simulation 
		
		assert false report "MUX4TO1 testbench completed"; -- puts a note in the ModelSim transcript window
		wait;	-- this wait without any time parameters stops the simulation

	   	end process;  
 
END;