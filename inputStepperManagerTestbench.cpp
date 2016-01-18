#include "inputStepperManager.h"

int main() {

	bit doStep = 0;
	bit doStep_out;

	doStep = 1;
	for(int i = 0; i < 5; i++) {
		inputStepperManager(doStep, &doStep_out);
		printf("doStep_out == %s\n", doStep_out.to_string(10).c_str());
	}

	doStep = 0;
	inputStepperManager(doStep, &doStep_out);
	if(doStep_out == 0) {
		printf("doStep_out == 0\n");
	}

	doStep = 1;
	inputStepperManager(doStep, &doStep_out);
	printf("doStep_out == %s\n", doStep_out.to_string(10).c_str());

	doStep = 0;
	for(int i = 0; i < 5; i++) {
		inputStepperManager(doStep, &doStep_out);
		printf("doStep_out == %s\n", doStep_out.to_string(10).c_str());
	}

	return 0;
}
