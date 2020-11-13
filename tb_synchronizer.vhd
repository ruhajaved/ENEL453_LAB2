library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY tb_synchronizer IS
END tb_synchronizer;

ARCHITECTURE behavior OF tb_synchronizer IS
	
	COMPONENT Synchronizer is
	port(
		SW_ext : in std_logic_vector (9 downto 0);
		clk    : in std_logic;
		SW_int : out std_logic_vector (9 downto 0)
		);
end COMPONENT;

        signal SW_ext          : std_logic_vector (9 downto 0);
	signal clk             : std_logic;
	signal SW_int         : std_logic_vector (9 downto 0);
	
	constant time_delay   : time := 20 ns;
	constant time_delay2   : time := 22 ns;
	constant time_delay3   : time := 16 ns;


		
        constant TbPeriod : time := 20 ns; -- corresponds to FPGA board frequency which is 50 MHz
        signal TbClock : std_logic := '0';
        signal TbSimEnded : std_logic := '0'; 

BEGIN
	
   
	
    uut: Synchronizer port map ( 
	  SW_ext     => SW_ext,
          clk        => clk,
          SW_int     => SW_int
          );

	-- Clock generation
	
        TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';
        clk <= TbClock;
	

	stim_process: process
      		
		begin
		
		assert false report "Synchronizer testbench started"; -- puts a note in the ModelSim transcript window
		  
		-- initialize inputs to 0 to clear everything
		
		SW_ext <= "00"&"0000"&"0000";
			wait for time_delay+2 ns;
		
		
		--simulate input is offset from the clock
		
			
		SW_ext <= "11"&"1111"&"1111";
			wait for time_delay-4 ns;
			
		--simulate input is offset from the clock
		
		SW_ext <= "00"&"1111"&"0000";															-- output = in2
			wait for time_delay+6 ns;
		
			
		--simulate input is offset from the clock
		
		SW_ext <= "11"&"0000"&"1111";															-- output = in1
			wait for time_delay-8 ns;
		
		 --simulate input is offset from the clock
		
		SW_ext <= "10"&"1011"&"1101";															-- output = in1
			wait for time_delay+10 ns; 

		--simulate input is offset from the clock
		
		SW_ext <= "00"&"0011"&"1100";
			wait for time_delay-12 ns;
		-- end simulation 
		tbSimEnded <='1';
		assert false report "Synchronizer testbench completed"; -- puts a note in the ModelSim transcript window
		wait;	-- this wait without any time parameters stops the simulation

	   	end process;  
 
END;