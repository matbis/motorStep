----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/19/2016 06:33:50 PM
-- Design Name: 
-- Module Name: TestbenchStepperControl - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Numeric_STD.all;

entity TestbenchStepperControl is
--  Port ( );
end TestbenchStepperControl;

architecture Behavioral of TestbenchStepperControl is
    SIGNAL a_out_V : STD_LOGIC_VECTOR ( 0 to 0 );
    SIGNAL b_out_V : STD_LOGIC_VECTOR ( 0 to 0 );
    SIGNAL c_out_V : STD_LOGIC_VECTOR ( 0 to 0 );
    SIGNAL d_out_V : STD_LOGIC_VECTOR ( 0 to 0 );
    SIGNAL doRewind_in_V : STD_LOGIC_VECTOR ( 0 to 0 );
    SIGNAL doStep_in_V : STD_LOGIC_VECTOR ( 0 to 0 );
    SIGNAL stepDone_out_V : STD_LOGIC_VECTOR ( 0 to 0 );
    SIGNAL sys_clock : STD_LOGIC;
    SIGNAL stopRewind_in_V : STD_LOGIC_VECTOR( 0 DOWNTO 0);
    SIGNAL nSteps_in : INTEGER;
    
    
    
    constant ClockPeriod : Time := 100 ns;
    constant DelayDuration : Integer := 5;
    constant full_step_in_V: STD_LOGIC_VECTOR( 0 DOWNTO 0) := "0";

    --COMPONENT design_1_stepperMotor_0_0
    COMPONENT stepperMotor
    PORT (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        doStep_in_V : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        doRewind_in_V : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        stopRewind_in_V: IN STD_LOGIC_VECTOR( 0 DOWNTO 0);
        nSteps_in: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        full_step_in_V: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        delayDuration_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);

        a_out_V : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
        b_out_V : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
        c_out_V : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
        d_out_V : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
        stepDone_out_V : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
        
    );
    END COMPONENT;
begin
    --UUT : design_1_stepperMotor_0_0
    UUT : stepperMotor

    PORT MAP (
        ap_clk => sys_clock,
        ap_rst => '0',
        doStep_in_V => doStep_in_V,
        doRewind_in_V => doRewind_in_V,
        a_out_V => a_out_V,
        b_out_V => b_out_V,
        c_out_V => c_out_V,
        d_out_V => d_out_V,
        stepDone_out_V => stepDone_out_V,
        stopRewind_in_V => stopRewind_in_V,
        nSteps_in => std_logic_vector(to_unsigned(nSteps_in, 32)),
        full_step_in_V => full_step_in_V,
        delayDuration_in => std_logic_vector(to_unsigned(DelayDuration,32))
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
        nSteps_in <= 1;
        
        
        -- REWIND
        doRewind_in_V <= "1";
        stopRewind_in_V <= "1";
        doStep_in_V <= "0";
        
        wait for ClockPeriod;
        
        
        doRewind_in_V <= "0";
        stopRewind_in_V <= "0";
        
        -- DO STEP 1
        doStep_in_V <= "1";
        
        wait for ClockPeriod;
        
        doStep_in_V <= "0";
        
        wait for (DelayDuration + 2) * ClockPeriod;
        
        -- DO STEP 2    
        doStep_in_V <= "1";
        
        wait for ClockPeriod;
            
        doStep_in_V <= "0";
        
        wait for (DelayDuration + 2) * ClockPeriod;
        
        
        -- DO NOTHING
        wait for ClockPeriod;
        
        
        -- REWINDING
        doRewind_in_V <= "1";
        wait for ClockPeriod;
        
        doRewind_in_V <= "0";
        wait for (2 * (DelayDuration + 1) -DelayDuration) * ClockPeriod;
        --Stop rewind asserito dopo l'ultimo step
        stopRewind_in_V <= "1";
        
        wait for DelayDuration * ClockPeriod; 
        
        --transizione da delay a rewinding
        wait for ClockPeriod;
        
        --transizione da rewinding a waiting input
        wait for ClockPeriod;
        
      
            
        -- DO STEP && stopRewind = 1
        doStep_in_V <= "1";
        nSteps_in <= 2;
        
        --campiono il do_step e transizione da waiting input a forwarding
        wait for ClockPeriod;
        doStep_in_V <= "0";
        
        wait for 2* (DelayDuration +1) * ClockPeriod;
        
       --transizione da delay a forward
        wait for ClockPeriod;
           
        --transizione da forward a waiting
        wait for ClockPeriod;
        
        wait for 100 ns;
    END PROCESS stimulus;
    
end Behavioral;
