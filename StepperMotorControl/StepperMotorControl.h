#include "ap_int.h"
#include "ap_utils.h"

typedef ap_uint<1> bit;
enum State {waitingInputState, forwardingState, rewindingState, delayState};

/*
sequence	A(a)	B(b)	A'(c)	B'(d)
0			+		+		-		-
1			-		+		+		-
2			-		-		+		+
3			+		-		-		+
*/

void stepperMotor(bit doStep_in, bit doRewind_in, bit stopRewind_in, int nSteps_in, int delayDuration_in, bit full_step_in, bit *a_out, bit *b_out, bit *c_out, bit *d_out, bit *stepDone_out);
void waitingInput(State* curState, State* prevState, bit doRewind_in, bit stopRewind_in, bit doStep_in, int nSteps_in, int *steps_count, bit* stepDone_out);
void forwarding(State* curState, State* prevState, bit doRewind_in, bit full_step_in, int* steps_count, ap_uint<3>* sequence_no_tmp, bit* stepDone_out);
void rewinding(State* curState, State* prevState, bit stopRewind_in, bit full_step_in, ap_uint<3>* sequence_no_tmp, bit* stepDone_out);
void delay(State* curState, State* prevState, int* counter_delay, int delayDuration_in, bit* stepDone_out);
void doStep(ap_uint<3> *sequence_no, bool rewind, bit full_step);
void driveMotor(ap_uint<3> *sequence_no, bit *a_out, bit *b_out, bit *c_out, bit *d_out);
