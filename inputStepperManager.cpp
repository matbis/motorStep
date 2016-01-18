#include "inputStepperManager.h"

void inputStepperManager(bit doStep_in, bit reset_in, bit* doStep_out) {
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE ap_none port=doStep_in
#pragma HLS INTERFACE ap_none port=reset_in
#pragma HLS INTERFACE ap_none port=doStep_out
	static bit doStep = 0;

	if(reset_in == 1) {
		doStep = 0;
	}
	else if(doStep_in == 1 && doStep == 0) {
		doStep = 1;
	}

	*doStep_out = doStep;
}
