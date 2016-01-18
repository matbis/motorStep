#include "inputStepperManager.h"

void inputStepperManager(bit doStep_in, bit* doStep_out) {

	#pragma HLS INTERFACE ap_ctrl_none port=return
	#pragma HLS INTERFACE ap_none port=doStep_in
	#pragma HLS INTERFACE ap_none port=doStep_out

	static bit doStep = 0;
	static ap_uint<2> counter = 0;
	static bool valid_input = true;

	if(counter == 3) {
		doStep = 0;
		counter = 0;
	}

	if(doStep == 1) {
		counter++;
	}

	if(doStep_in == 1 && doStep == 0 && valid_input) {
		doStep = 1;
		valid_input = false;
		counter++;
	}

	if(!valid_input && doStep_in == 0) {
		valid_input = true;
	}

	*doStep_out = doStep;
}
