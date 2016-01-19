#include "StepperMotorControl.h"

int main()
{
	bit doRewind = 1;
	bit doStep = 0;
	bit a_out;
	bit b_out;
	bit c_out;
	bit d_out;
	bit motorReady;
	int i=0;

	// reset
	useStepperMotor(doStep, doRewind, &a_out, &b_out, &c_out, &d_out, &motorReady);
	
	if(motorReady != 1) {
		printf("Error in resetting motor. Exiting ...\n");
		exit(1);
	}
	printf("Motor is ready to operate. Starting ...\n");
	
	doRewind = 0;
	doStep = 1;
		
	// doStep() 10 times
	while(i<10) {
		useStepperMotor(doStep, doRewind, &a_out, &b_out, &c_out, &d_out, &motorReady);
		i++;
	}

	doRewind = 1;
	doStep = 0;

	// reset
	i = 0;
	while(i<11) {
		useStepperMotor(doStep, doRewind, &a_out, &b_out, &c_out, &d_out, &motorReady);
		i++;
	}

	if(motorReady != 1) {
			printf("Error in resetting motor. Exiting ...\n");
			exit(1);
	}

	printf("fine simulazione!\n");

	return 0;
}
