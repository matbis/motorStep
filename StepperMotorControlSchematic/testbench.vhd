LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY testbench IS
END testbench;

ARCHITECTURE testbench_arch OF testbench IS

SIGNAL a_out_V : STD_LOGIC_VECTOR ( 0 to 0 );
SIGNAL b_out_V : STD_LOGIC_VECTOR ( 0 to 0 );
SIGNAL c_out_V : STD_LOGIC_VECTOR ( 0 to 0 );
SIGNAL d_out_V : STD_LOGIC_VECTOR ( 0 to 0 );
SIGNAL doRewind_in_V : STD_LOGIC_VECTOR ( 0 to 0 );
SIGNAL doStep_in_V : STD_LOGIC_VECTOR ( 0 to 0 );
SIGNAL stepDone_out_V : STD_LOGIC_VECTOR ( 0 to 0 );
SIGNAL sys_clock : STD_LOGIC;

constant ClockPeriod : Time := 100 ns;
constant DelayDuration : Integer := 5;

component design_1_wrapper is
  port (
    sys_clock : in STD_LOGIC;
    doStep_in_V : in STD_LOGIC_VECTOR ( 0 to 0 );
    a_out_V : out STD_LOGIC_VECTOR ( 0 to 0 );
    b_out_V : out STD_LOGIC_VECTOR ( 0 to 0 );
    c_out_V : out STD_LOGIC_VECTOR ( 0 to 0 );
    d_out_V : out STD_LOGIC_VECTOR ( 0 to 0 );
    doRewind_in_V : in STD_LOGIC_VECTOR ( 0 to 0 );
    stepDone_out_V : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
 end component design_1_wrapper;

BEGIN
UUT : design_1_wrapper
PORT MAP (
    a_out_V => a_out_V,
    b_out_V => b_out_V,
    c_out_V => c_out_V,
    d_out_V => d_out_V,
    doRewind_in_V => doRewind_in_V,
    doStep_in_V => doStep_in_V,
    stepDone_out_V => stepDone_out_V,
    sys_clock => sys_clock
);

-- CLOCK
clock: process
    begin
        sys_clock <= '1';
        wait for 100 ns;
        loop
            wait for (ClockPeriod / 2);
            sys_clock <= not sys_clock;
        end loop;
    end process clock;

--STIMULUS
stimulus: PROCESS
BEGIN
    wait for 100 ns;
        
    -- DO STEP
    doRewind_in_V <= "1";
    doStep_in_V <= "0";
    
    wait for ClockPeriod;
    
    doRewind_in_V <= "0";
    doStep_in_V <= "1";
    
    wait for ClockPeriod;
    
    doStep_in_V <= "0";
    
    wait for (DelayDuration + 1) * ClockPeriod;
        
    doStep_in_V <= "1";
    
    wait for ClockPeriod;
        
    doStep_in_V <= "0";
    
    wait for (DelayDuration + 1) * ClockPeriod;
    
    
    -- DO NOTHING
    wait for ClockPeriod;
    
    
    -- REWINDING
    doRewind_in_V <= "1";
    wait for ClockPeriod;
    
    doRewind_in_V <= "0";
    wait for 2 * (DelayDuration + 1) * ClockPeriod;
    
    
    -- DO STEP
    doStep_in_V <= "1";
    wait for ClockPeriod;
    
    doStep_in_V <= "0";
    
    wait for 100 ns;
END PROCESS stimulus;

END testbench_arch;