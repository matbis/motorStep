#include "ap_int.h"
#include "ap_utils.h"

// speed used by the motor returning at start position when reset occurs
#define SPEED 10000
#define DO_PRAGMA_INNER(x) _Pragma (#x)
#define DO_PRAGMA(x) DO_PRAGMA_INNER(x)


typedef ap_uint<1> bit;

/*
sequence	A(a)	B(b)	A'(c)	B'(d)
1			+		+		-		-
2			-		+		+		-
3			-		-		+		+
4			+		-		-		+
*/

void useStepperMotor(bit doStep_in, bit doReset_in, bit *a_out, bit *b_out, bit *c_out, bit *d_out, volatile bit *motorReady);
void doRewind(int *steps_count, int *sequence_no, bit *a_out, bit *b_out, bit *c_out, bit *d_out);
void delay();
void doStep(bit *a_out, bit *b_out, bit *c_out, bit *d_out, int *steps_count, int *sequence_no);
