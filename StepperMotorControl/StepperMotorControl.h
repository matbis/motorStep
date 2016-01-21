#include "ap_int.h"
#include "ap_utils.h"

typedef ap_uint<1> bit;
//enum State {waitingInput, forwarding, rewinding, delay};

/*
sequence	A(a)	B(b)	A'(c)	B'(d)
0			+		+		-		-
1			-		+		+		-
2			-		-		+		+
3			+		-		-		+
*/

void stepperMotor(bit doStep_in, bit doRewind_in, int delayDuration_in, bit *a_out, bit *b_out, bit *c_out, bit *d_out, volatile bit *stepDone_out);
void doStep(int *steps_count, ap_uint<2> *sequence_no, bool rewind);
void driveMotor(ap_uint<2> *sequence_no, bit *a_out, bit *b_out, bit *c_out, bit *d_out);
