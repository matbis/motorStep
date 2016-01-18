#include "inputStepperManager.h"

int main() {

	bit doStep = 0;
	bit reset = 1;
	bit doStep_out;

	inputStepperManager(doStep, reset, &doStep_out);

	if(doStep_out == 0) {
		printf("doStep_out == 0, RESET\n");
	}

	doStep = 1;
	reset = 0;

	for(int i = 0; i < 10; i++) {
		inputStepperManager(doStep, reset, &doStep_out);
		if(doStep_out == 1) {
				printf("doStep_out == 1, DOSTEP\n");
			}
	}

	doStep = 0;
	reset = 1;

	inputStepperManager(doStep, reset, &doStep_out);

	if(doStep_out == 0) {
		printf("doStep_out == 0, RESET\n");
	}

	return 0;
}
