library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY tb_DFF_EN IS
END tb_DFF_EN;

ARCHITECTURE behavior OF tb_DFF_EN IS

-- Component Declaration for the UUT
   COMPONENT DFF_EN is
   port ( D			     : in std_logic_vector (15 downto 0);
          RST, EN, clk : in std_logic;
          Q			     : out std_logic_vector (15 downto 0)
         );
   end COMPONENT;  
       
		 -- Instantiate the Unit Under Test (UUT)
	 signal D              : std_logic_vector (15 downto 0);
    	 signal Q	       : std_logic_vector (15 downto 0);
    	 signal clk            : std_logic;
	 signal EN             : std_logic;
	 signal RST            : std_logic;
    
	 constant time_delay   : time := 20 ns;
	 constant time_delay2   : time := 200 ns;
	 
	constant TbPeriod : time := 20 ns; -- corresponds to FPGA board frequency which is 50 MHz
        signal TbClock : std_logic := '0';
        signal TbSimEnded : std_logic := '0'; 
    
	 BEGIN
	
   
	
    uut: DFF_EN port map ( 
	       D     => D,
           RST   => RST,
           EN    => EN,
		   CLK   => CLK,
           Q     => Q 
          );
 
    -- Clock generation
	
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';
    clk <= TbClock;
    
	
	-- Stimulus process 
      stim_process: process
      begin
		
		assert false report "DFF_EN testbench started"; -- puts a note in the ModelSim transcript window
		
		-- initialize inputs and set reset=0 to clear everything  
		RST<='0';
		EN <= '1';
		D <= "0000"&"0000"&"0000"&"0000";
		
		--first state EN=1 RESET=1 
		   wait for time_delay;
		RST<='1';
		   wait for time_delay;
		EN <= '1';
		   wait for time_delay;
		D <= "0000"&"0011"&"1100"&"0011";
			wait for time_delay;
			
		-- second simulate an ENABLE when EN=0 
			wait for time_delay;
		EN <= '0';
			wait for time_delay- 2 ns;
			
			
		-- now simulate when input changes during enable=0
		D <= "1111"&"1001"&"0000"&"1100";														
			wait for time_delay- 2 ns;
		
		-- now simulate when input changes during enable =1
		EN <= '1';
			wait for time_delay;
		D <= "0000"&"1100"&"1100"&"0000";
	      wait for time_delay;
		
		-- now simulate when reset =0,while Q contains a value
		RST <= '0';
			wait for time_delay;
		D <= "0000"&"1100"&"1100"&"0000";
			wait for time_delay;
		RST <= '1';
		
		
		tbSimEnded <='1';
		
		assert false report "DFF_EN testbench completed"; -- puts a note in the ModelSim transcript window
		
		wait;	-- this wait without any time parameters stops the simulation

	   end process;  
 
END;