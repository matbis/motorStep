#include "StepperMotorControl.h"

void useStepperMotor(bit doStep_in, bit doRewind_in, bit *a_out, bit *b_out, bit *c_out, bit *d_out, volatile bit *motorReady_out) {

	#pragma HLS INTERFACE ap_none port=motorReady_out
	#pragma HLS INTERFACE ap_ctrl_none port=return
	#pragma HLS INTERFACE ap_none port=a_out
	#pragma HLS INTERFACE ap_none port=b_out
	#pragma HLS INTERFACE ap_none port=c_out
	#pragma HLS INTERFACE ap_none port=d_out
	
	// number of steps done
	static int steps_count = 0;
	// number of the sequence of signals
	static int sequence_no = 4; // +--+
	// rewind activated
	static bool rewinding = false;
	
	static bit a = 1;
	static bit b = 0;
	static bit c = 0;
	static bit d = 1;

//	static bit motorReady;

	// priority to reset
	if(doRewind_in == 1) {
		if (steps_count > 0) {
			rewinding = true;
			*motorReady_out = 0;
		}
		else if (steps_count == 0)
			*motorReady_out = 1;
	}

	if (rewinding) {
		doRewind(&steps_count, &sequence_no, &a, &b, &c, &d);
		delay();
		if (steps_count == 0) {
			rewinding = false;
			*motorReady_out = 1;
		}
	}
	else if(doStep_in == 1 && doRewind_in == 0) {
		*motorReady_out = 0;
		doStep(&a, &b, &c, &d, &steps_count, &sequence_no);
		*motorReady_out = 1;
	}

	*a_out = a;
	*b_out = b;
	*c_out = c;
	*d_out = d;
//	*motorReady_out = motorReady;

}

void doRewind(int *steps_count, int *sequence_no, bit *a_out, bit *b_out, bit *c_out, bit *d_out) {
	// ciclare per steps_count volte e ogni volta fare delay(),
	// fra una sequenza e l'altra, in base alla velocità scelta
	// (define SPEED). Guardare sequence_no per capire da quale
	//sequenza avviare il riavvolgimento del nastro.

	if(*sequence_no == 1) {
		//4 +--+
		*a_out = 1;
		*b_out = 0;
		*c_out = 0;
		*d_out = 1;
	}
	else if(*sequence_no == 2) {
		//1
		*a_out = 1;
		*b_out = 1;
		*c_out = 0;
		*d_out = 0;
	}
	else if(*sequence_no == 3) {
		//2
		*a_out = 0;
		*b_out = 1;
		*c_out = 1;
		*d_out = 0;
	}
	else if(*sequence_no == 4) {
		//3
		*a_out = 0;
		*b_out = 0;
		*c_out = 1;
		*d_out = 1;
	}

	(*steps_count)--;

	// move to the next sequence
	(*sequence_no)--;
	if(*sequence_no == 0)
		*sequence_no = 4;
}

void delay() {
//	static int sum = 0;
	static bool flag = false;
	delay: {
//	#pragma HLS PROTOCOL floating
		for(int i = 0; i < SPEED; i++) {
//			#pragma HLS LATENCY min=1
//			sum++;
			flag = !flag;
//			#pragma HLS PROTOCOL fixed
//			DO_PRAGMA (HLS loop_tripcount min = SPEED)
//			ap_wait();
		}
	}
}

void doStep(bit *a_out, bit *b_out, bit *c_out, bit *d_out, int *steps_count, int *sequence_no) {
	// move to the next sequence
	(*sequence_no)++;
	if(*sequence_no == 5)
		*sequence_no = 1;

	if(*sequence_no == 1) {
		// ++--
		*a_out = 1;
		*b_out = 1;
		*c_out = 0;
		*d_out = 0;
	}
	else if(*sequence_no == 2) {
		// -++-
		*a_out = 0;
		*b_out = 1;
		*c_out = 1;
		*d_out = 0;
	}
	else if(*sequence_no == 3) {
		// --++
		*a_out = 0;
		*b_out = 0;
		*c_out = 1;
		*d_out = 1;
	}
	else if(*sequence_no == 4) {
		// +--+
		*a_out = 1;
		*b_out = 0;
		*c_out = 0;
		*d_out = 1;
	}//if
	
	// increment steps number
	(*steps_count)++;
}
