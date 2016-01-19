----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/19/2016 02:59:55 PM
-- Design Name: 
-- Module Name: testbenchInputStepper - Behavioral
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
--USE work.design_1_inputStepperManager_0_0;

entity testbenchInputStepper is
--  Port ( );
end testbenchInputStepper;

architecture Behavioral of testbenchInputStepper is
    SIGNAL doStep_in_V : STD_LOGIC_VECTOR ( 0 to 0 );
    SIGNAL sys_clock : STD_LOGIC;
    SIGNAL doStep_out_V : STD_LOGIC_VECTOR ( 0 to 0 );
    constant ClockPeriod : Time := 100 ns;
begin
    UUT : ENTITY work.design_1_inputStepperManager_0_0
    PORT MAP (
        ap_clk => sys_clock,
        ap_rst => '0',
        doStep_in_V => doStep_in_V,
        doStep_out_V => doStep_out_V
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
        doStep_in_V <= "0";
        
        wait for 2 * ClockPeriod;
        
        doStep_in_V <= "1";
        
        wait for 2 * ClockPeriod;
        
        doStep_in_V <= "0";
        
        wait for 2 * ClockPeriod;
            
        doStep_in_V <= "1";
        
        wait for 2 * ClockPeriod;
            
        doStep_in_V <= "0";
        
        wait for 2 * ClockPeriod;
    END PROCESS stimulus;
end Behavioral;
