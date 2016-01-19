LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE work.design_1_wrapper;

ENTITY testbench IS
END testbench;

ARCHITECTURE testbench_arch OF testbench IS

SIGNAL a_out_V : STD_LOGIC_VECTOR ( 0 to 0 );
SIGNAL b_out_V : STD_LOGIC_VECTOR ( 0 to 0 );
SIGNAL c_out_V : STD_LOGIC_VECTOR ( 0 to 0 );
SIGNAL d_out_V : STD_LOGIC_VECTOR ( 0 to 0 );
SIGNAL doRewind_in_V : STD_LOGIC_VECTOR ( 0 to 0 );
SIGNAL doStep_in_V : STD_LOGIC_VECTOR ( 0 to 0 );
SIGNAL motorReady_V : STD_LOGIC_VECTOR ( 0 to 0 );
SIGNAL sys_clock : STD_LOGIC;

constant ClockPeriod : Time := 100 ns;

BEGIN
UUT : ENTITY work.design_1_wrapper
PORT MAP (
    a_out_V => a_out_V,
    b_out_V => b_out_V,
    c_out_V => c_out_V,
    d_out_V => d_out_V,
    doRewind_in_V => doRewind_in_V,
    doStep_in_V => doStep_in_V,
    motorReady_V => motorReady_V,
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
    doRewind_in_V <= "0";
    doStep_in_V <= "0";
    
    wait for 2 * ClockPeriod;
    
    doRewind_in_V <= "0";
    doStep_in_V <= "1";
    
    wait for 2 * ClockPeriod;
    
    doStep_in_V <= "0";
    
    wait for 2 * ClockPeriod;
        
    doStep_in_V <= "1";
    
    wait for 2 * ClockPeriod;
        
    doStep_in_V <= "0";
    
    wait for 2 * ClockPeriod;
END PROCESS stimulus;

END testbench_arch;