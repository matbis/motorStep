#include "StepperMotorControl.h"

void stepperMotor(bit doStep_in, bit doRewind_in, int delayDuration_in, bit *a_out, bit *b_out, bit *c_out, bit *d_out, bit *stepDone_out) {

	#pragma HLS INTERFACE ap_stable port=delayDuration_in
//	#pragma HLS INTERFACE s_axilite port=stepDone_out
//	#pragma HLS INTERFACE s_axilite port=doRewind_in
//	#pragma HLS INTERFACE s_axilite port=doStep_in

	#pragma HLS INTERFACE ap_none port=stepDone_out
//	#pragma HLS INTERFACE ap_ctrl_none port=return
	#pragma HLS INTERFACE ap_none port=a_out
	#pragma HLS INTERFACE ap_none port=b_out
	#pragma HLS INTERFACE ap_none port=c_out
	#pragma HLS INTERFACE ap_none port=d_out
	
	// number of steps done
	static int steps_count = 0;
	#pragma HLS RESET variable=steps_count

	// number of the sequence of signals
	static ap_uint<2> sequence_no = 0; // ++--
	#pragma HLS RESET variable=sequence_no

	static enum State curState = waitingInputState;
	#pragma HLS RESET variable=curState

	static enum State prevState = waitingInputState;
	#pragma HLS RESET variable=prevState

	static int counter_delay = 0;
	#pragma HLS RESET variable=counter_delay

	ap_uint<2> sequence_no_tmp = sequence_no;


	switch(curState) {
		case waitingInputState:
			waitingInput(&curState, &prevState, doRewind_in, doStep_in, steps_count, stepDone_out);
			break;
		case forwardingState:
			forwarding(&curState, &prevState, &steps_count, &sequence_no_tmp, stepDone_out);
			break;
		case rewindingState:
			rewinding(&curState, &prevState, &steps_count, &sequence_no_tmp, stepDone_out);
			break;
		case delayState:
			delay(&curState, &prevState, &counter_delay, delayDuration_in, stepDone_out);
			break;
	}

	driveMotor(&sequence_no_tmp, a_out, b_out, c_out, d_out);

	sequence_no = sequence_no_tmp;
}


void waitingInput(State* curState, State* prevState, bit doRewind_in, bit doStep_in, int steps_count, bit* stepDone_out) {
	#pragma HLS INLINE
	if(doRewind_in == 1) {
		if(steps_count > 0) {
			*curState = rewindingState;
			*prevState = waitingInputState;
		}
	}
	else if(doStep_in == 1) {
		*curState = forwardingState;
		*prevState = waitingInputState;
	}
	*stepDone_out = 1;
}

void forwarding(State* curState, State* prevState, int* steps_count, ap_uint<2>* sequence_no_tmp, bit* stepDone_out) {
	#pragma HLS INLINE
	if(*prevState == delayState) {
		*curState = waitingInputState;
		*prevState = forwardingState;
	}
	else {
		doStep(steps_count, sequence_no_tmp, false);
		*curState = delayState;
		*prevState = forwardingState;
	}
	*stepDone_out = 0;
}

void rewinding(State* curState, State* prevState, int* steps_count, ap_uint<2>* sequence_no_tmp, bit* stepDone_out) {
	#pragma HLS INLINE
	if(*steps_count > 0) {
		doStep(steps_count, sequence_no_tmp, true);
		*curState = delayState;
		*prevState = rewindingState;
	}
	else {
		*curState = waitingInputState;
		*prevState = rewindingState;
	}
	*stepDone_out = 0;
}

void delay(State* curState, State* prevState, int* counter_delay, int delayDuration_in, bit* stepDone_out) {
	#pragma HLS INLINE
	int counter_delay_tmp = *counter_delay;
	counter_delay_tmp++;
	if(counter_delay_tmp == delayDuration_in) {
		counter_delay_tmp = 0;
		if(*prevState == rewindingState) {
			*curState = rewindingState;
		}
		else {
			*curState = forwardingState;
		}
		*prevState = delayState;
	}
	*stepDone_out = 0;
	*counter_delay = counter_delay_tmp;
}

void doStep(int *steps_count, ap_uint<2> *sequence_no, bool rewind) {
	#pragma HLS INLINE
	if(rewind) {
		if(*sequence_no == 0) {
			*sequence_no = 3;
		}
		else {
			// move to the prev sequence
			(*sequence_no)--;
		}

		// decrement steps number
		(*steps_count)--;
	}
	else {
		if(*sequence_no == 3) {
			*sequence_no = 0;
		}
		else {
			// move to the next sequence
			(*sequence_no)++;
		}
		// increment steps number
		(*steps_count)++;
	}//rewind
}

void driveMotor(ap_uint<2> *sequence_no, bit *a_out, bit *b_out, bit *c_out, bit *d_out) {
	#pragma HLS INLINE
	if(*sequence_no == 0) {
		// ++--
		*a_out = 1;
		*b_out = 1;
		*c_out = 0;
		*d_out = 0;
	}
	else if(*sequence_no == 1) {
		// -++-
		*a_out = 0;
		*b_out = 1;
		*c_out = 1;
		*d_out = 0;
	}
	else if(*sequence_no == 2) {
		// --++
		*a_out = 0;
		*b_out = 0;
		*c_out = 1;
		*d_out = 1;
	}
	else if(*sequence_no == 3) {
		// +--+
		*a_out = 1;
		*b_out = 0;
		*c_out = 0;
		*d_out = 1;
	}//if
}
