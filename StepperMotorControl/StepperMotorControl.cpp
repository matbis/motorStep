#include "StepperMotorControl.h"

void stepperMotor(bit doStep_in, bit doRewind_in, bit *a_out, bit *b_out, bit *c_out, bit *d_out, volatile bit *stepDone_out) {

	#pragma HLS INTERFACE ap_none port=stepDone_out
//	#pragma HLS INTERFACE ap_ctrl_none port=return
	#pragma HLS INTERFACE ap_none port=a_out
	#pragma HLS INTERFACE ap_none port=b_out
	#pragma HLS INTERFACE ap_none port=c_out
	#pragma HLS INTERFACE ap_none port=d_out
	
	// number of steps done
	static int steps_count = 0;
	// number of the sequence of signals
	static ap_uint<2> sequence_no = 3; // +--+
	// rewind activated
	static bool rewinding = false;
	static bool forwarding = false;
	static bool delay = false;
	static int counter_delay = 0;
	ap_uint<2> sequence_no_tmp = sequence_no;

	if(delay) {
		int counter_delay_tmp = counter_delay;
		counter_delay_tmp++;
		if(counter_delay_tmp == SPEED) {
			counter_delay_tmp = 0;
			delay = false;
		}
		*stepDone_out = 0;
		counter_delay = counter_delay_tmp;
	}
	else if(forwarding) {
		forwarding = false;
		*stepDone_out = 1;
	}
	else if(rewinding) {
		if(steps_count == 0) {
			rewinding = false;
			*stepDone_out = 1;
		}
		else {
			*stepDone_out = 0;
			doStep(&steps_count, &sequence_no_tmp, rewinding);
			delay = true;
		}
	}
	else if(doRewind_in == 1) {
		if(steps_count == 0) {
			*stepDone_out = 1;
		}
		else {
			rewinding = true;
			*stepDone_out = 0;
			doStep(&steps_count, &sequence_no_tmp, true);
			delay = true;
		}
	}
	else if(doStep_in == 1) {
		forwarding = true;
		*stepDone_out = 0;
		doStep(&steps_count, &sequence_no_tmp, rewinding);
		delay = true;
	}
	else {
		*stepDone_out = 1;
	}

	driveMotor(&sequence_no, a_out, b_out, c_out, d_out);

//	if(sequence_no_tmp == 0) {
//			// ++--
//			*a_out = 1;
//			*b_out = 1;
//			*c_out = 0;
//			*d_out = 0;
//		}
//		else if(sequence_no_tmp == 1) {
//			// -++-
//			*a_out = 0;
//			*b_out = 1;
//			*c_out = 1;
//			*d_out = 0;
//		}
//		else if(sequence_no_tmp == 2) {
//			// --++
//			*a_out = 0;
//			*b_out = 0;
//			*c_out = 1;
//			*d_out = 1;
//		}
//		else if(sequence_no_tmp == 3) {
//			// +--+
//			*a_out = 1;
//			*b_out = 0;
//			*c_out = 0;
//			*d_out = 1;
//		}//if

	sequence_no = sequence_no_tmp;
}

//void delay() {
////	static int sum = 0;
//	static bool flag = false;
//	delay: {
////	#pragma HLS PROTOCOL floating
//		for(int i = 0; i < SPEED; i++) {
////			#pragma HLS LATENCY min=1
////			sum++;
//			flag = !flag;
////			#pragma HLS PROTOCOL fixed
////			DO_PRAGMA (HLS loop_tripcount min = SPEED)
////			ap_wait();
//		}
//	}
//}

void doStep(int *steps_count, ap_uint<2> *sequence_no, bool rewind) {
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
