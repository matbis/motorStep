#include "ap_int.h"
#include "ap_utils.h"

// speed used by the motor returning at start position when reset occurs
#define SPEED 5
//#define DO_PRAGMA_INNER(x) _Pragma (#x)
//#define DO_PRAGMA(x) DO_PRAGMA_INNER(x)


typedef ap_uint<1> bit;

/*
sequence	A(a)	B(b)	A'(c)	B'(d)
0			+		+		-		-
1			-		+		+		-
2			-		-		+		+
3			+		-		-		+
*/

void stepperMotor(bit doStep_in, bit doRewind_in, bit *a_out, bit *b_out, bit *c_out, bit *d_out, volatile bit *stepDone_out);
//void delay();
void doStep(int *steps_count, ap_uint<2> *sequence_no, bool rewind);
void driveMotor(ap_uint<2> *sequence_no, bit *a_out, bit *b_out, bit *c_out, bit *d_out);
