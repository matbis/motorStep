#include "StepperMotorControl.h"

int main()
{
	bit doRewind;
	bit doStep;
	bit a_out;
	bit b_out;
	bit c_out;
	bit d_out;
	bit stepDone;
	bit stopRewind;
	int nSteps = 1;
	int i=0;
	int delayDuration = 5;

	// REWIND
	stopRewind = 1;
	doRewind = 1;
	doStep = 0;
	stepperMotor(doStep, doRewind, stopRewind, nSteps, delayDuration, &a_out, &b_out, &c_out, &d_out, &stepDone);
	if(stepDone != 1) {
		printf("+++++ Error in rewinding motor. Exit ... +++++\n");
		exit(1);
	}
	printf("+++++ Motor is ready to operate. Waiting doStep signal ... +++++\n");
	
	// DO STEP 1
	doRewind = 0;
	stopRewind = 0;
	while(i<2) {
		doStep = 1;
		stepperMotor(doStep, doRewind, stopRewind, nSteps, delayDuration, &a_out, &b_out, &c_out, &d_out, &stepDone);
		doStep = 0;
		int j = 0;
		// delay
		while(j<delayDuration+2) {
			stepperMotor(doStep, doRewind, stopRewind, nSteps, delayDuration, &a_out, &b_out, &c_out, &d_out, &stepDone);
			j++;
		}
		i++;
	}

	// DO NOTHING
	doRewind = 0;
	doStep = 0;
	stepperMotor(doStep, doRewind, stopRewind, nSteps, delayDuration, &a_out, &b_out, &c_out, &d_out, &stepDone);

	// REWIND
	doRewind = 1;
	doStep = 0;
	stepperMotor(doStep, doRewind, stopRewind, nSteps, delayDuration, &a_out, &b_out, &c_out, &d_out, &stepDone);
	doRewind = 0;
	i = 0;
	// delay e settaggio di stop rewinding dopo l'ultimo step
	while(i<2*(delayDuration+1)) {
		if(i ==  2*(delayDuration+1) - delayDuration ){
			stopRewind = 1;
		}
		stepperMotor(doStep, doRewind, stopRewind, nSteps, delayDuration, &a_out, &b_out, &c_out, &d_out, &stepDone);
		i++;
	}

	//transizione da delay a rewinding
	stepperMotor(doStep, doRewind, stopRewind, nSteps, delayDuration, &a_out, &b_out, &c_out, &d_out, &stepDone);

	// transizione da rewinding a waiting input
	stepperMotor(doStep, doRewind, stopRewind, nSteps, delayDuration, &a_out, &b_out, &c_out, &d_out, &stepDone);
	if(stepDone != 1) {
			printf("+++++ Error in resetting motor. Exiting ... +++++\n");
			exit(1);
	}

	// DO STEP && stopRewind = 1
	doStep = 1;
	nSteps = 2;

	//campiono il do_step e transizione da waiting input a forwarding
	stepperMotor(doStep, doRewind, stopRewind, nSteps, delayDuration, &a_out, &b_out, &c_out, &d_out, &stepDone);
	doStep = 0;
	i = 0;

	while(i<nSteps) {

			int j = 0;
			// un clock per transizione da forwarding a delay + delayDuraion+ un clock
			while(j<delayDuration+1) {
				stepperMotor(doStep, doRewind, stopRewind, nSteps, delayDuration, &a_out, &b_out, &c_out, &d_out, &stepDone);
				j++;
			}
			i++;
		}

	//transizione da delay a forward
	stepperMotor(doStep, doRewind, stopRewind, nSteps, delayDuration, &a_out, &b_out, &c_out, &d_out, &stepDone);

	//transizione da forward a waiting
	stepperMotor(doStep, doRewind, stopRewind, nSteps, delayDuration, &a_out, &b_out, &c_out, &d_out, &stepDone);



	printf("step_done:%d \n", stepDone.to_int());

	printf("+++++ Fine simulazione! +++++\n");

	return 0;
}
