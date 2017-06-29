*ddccTest.sp
*----------------------------------------
*Parameters and models
*----------------------------------------
.TEMP 70
.option runlvl=5 symb=1 dcon= 1
*.option post
*.option posttop=1
*.option probe=1
.include "~/cad/analog_computer/hspice/models/1.0u/models.sp"
.include "~/cad/analog_computer/hspice/models/0.5u/models.sp"
.include "~/cad/analog_computer/hspice/models/0.13u/model013.lib_inc"
.include "~/cad/analog_computer/hspice/models/0.09u/hspice_example.include_model"
.include "~/cad/analog_computer/hspice/models/0.05u/models.sp"

.param g=10

*----------------------------------------
*Stimulus
*----------------------------------------
*To get the operating power and voltages
*.op
*Power supply and bias sensitivity testing
*.dc 	VY1	-1	1	.1m
*To get transfer function
*.AC DEC 10000 1 0.007G
*.NOISE V(x) VY1

*.PRINT NOISE INOISE ONOISE
*Time domain response
.param t_total=10us
.param t_start_in=0us
.param t_start_stable=1us
.param t_bias=0us
.tran 0.01ps t_total

*----------------------------------------
*Subcircuits
*----------------------------------------
lpddcc y1 y2 y3 vb1 vb2 vb3 x vdd vss	g='g' min='min'

*----------------------------------------
*Simulation Netlist
*----------------------------------------
*DC sources
VDD 	vdd 	gnd 	DC	'SUPPLY'
VSS 	vss 	gnd 	DC	'-1*SUPPLY'

*VY1 	y1   	gnd 	AC	0.1	pwl 	0ps	0	1ns	0	25us	'SUPPLY*0.3'	75us 	'-1*SUPPLY*0.3'	100us	0	125us	0		175us	0		200us	0	225us	0		275us	0		300us	0
*VY3 	y2   	gnd 	AC	0.1	pwl 	0ps	0	1ns	0	25us	0		75us 	0		100us	0	125us	'SUPPLY*0.3'	175us	'-1*SUPPLY*0.3'	200us	0	225us	0		275us	0		300us	0
*VY2 	y3   	gnd 	AC	0.1	pwl 	0ps	0	1ns	0	25us	0		75us 	0		100us	0	125us	0		175us	0		200us	0	225us	'SUPPLY*0.3'	275us	'-1*SUPPLY*0.3'	300us	0

*Vname N1 N2 SIN(VO VA FREQ TD THETA PHASE)
*VO is DC offset
*VA is amplitude
*TD is delay in seconds
*THETA is damping
*PHASE is in degrees

.param f1=700000
.param f2=6090000
*5610157
.param f3=5100000
.param f4=4700000
.param n=4
.param Amax=0.3

VY1			y1		gnd		DC 0
*sin(0 0.0001 f1 t_start_in 0 0)


*VY1		y1		y1a		sin(0 'A11*Amax/n' f1 t_start_in 0 0)
*VY1B		y1a		gnd		sin(0 'A12*Amax/n' f2 t_start_in 0 0)

*VY1		y1		y1a		sin(0 'A11*Amax/n' f1 t_start_in 0 0)
*VY1A		y1a		y1b		sin(0 'A12*Amax/n' f2 t_start_in 0 0)
*VY1B		y1b		gnd		sin(0 'A13*Amax/n' f3 t_start_in 0 0)

*VY1		y1		y1a		sin(0 'A11*Amax/n' f1 t_start_in 0 0)
*VY1A		y1a		y1b		sin(0 'A12*Amax/n' f2 t_start_in 0 0)
*VY1B		y1b		y1c		sin(0 'A13*Amax/n' f3 t_start_in 0 0)
*VY1C		y1c		gnd		sin(0 'A14*Amax/n' f4 t_start_in 0 0)
.param A11=1
.param A12=1
.param A13=1
.param A14=1

VY2		y2		gnd		DC 0
*0.3	sin(0 'A21*Amax/n' f1 t_start_in 0 0)

*VY2		y2		y2a		sin(0 'A21*Amax/n' f1 t_start_in 0 0)
*VY2A		y2a		gnd		sin(0 'A22*Amax/n' f2 t_start_in 0 0)

*VY2		y2		y2a		sin(0 'A21*Amax/n' f1 t_start_in 0 0)
*VY2A		y2a		y2b		sin(0 'A22*Amax/n' f2 t_start_in 0 0)
*VY2B		y2b		gnd		sin(0 'A23*Amax/n' f3 t_start_in 0 0)

*VY2		y2		y2a		sin(0 'A21*Amax/n' f1 t_start_in 0 0)
*VY2A		y2a		y2b		sin(0 'A22*Amax/n' f2 t_start_in 0 0)
*VY2B		y2b		y2c		sin(0 'A23*Amax/n' f3 t_start_in 0 0)
*VY2C		y2c		gnd		sin(0 'A24*Amax/n' f4 t_start_in 0 0)
.param A21=1
.param A22=1
.param A23=1
.param A24=1

VY3		y3		gnd		DC 0	    sin(0 0.0001 f1 t_start_in 0 0)
*0.3	sin(0 'A31*Amax/n' f1 t_start_in 0 0)

*VY3		y3		y3a		sin(0 'A31*Amax/n' f1 t_start_in 0 0)
*VY3A		y3a		gnd		sin(0 'A32*Amax/n' f2 t_start_in 0 0)

*VY3		y3		y3a		sin(0 'A31*Amax/n' f1 t_start_in 0 0)
*VY3A		y3a		y3b		sin(0 'A32*Amax/n' f2 t_start_in 0 0)
*VY3B		y3b		gnd		sin(0 'A33*Amax/n' f3 t_start_in 0 0)

*VY3		y3		y3a		sin(0 'A31*Amax/n' f1 t_start_in 0 0)
*VY3A		y3a		y3b		sin(0 'A32*Amax/n' f2 t_start_in 0 0)
*VY3B		y3b		y3c		sin(0 'A33*Amax/n' f3 t_start_in 0 0)
*VY3C		y3c		gnd		sin(0 'A34*Amax/n' f4 t_start_in 0 0)
.param A31=1
.param A32=1
.param A33=1
.param A34=1

.param SUPPLY=0.9
VB1	vb1 	gnd 	DC	-0.1
VB2	vb2 	gnd 	DC	-0.38
X1	y1 y2 y3 vb1 vb2 x vdd vss chen
c0 	x gnd 1f
r1  y1 gnd 10k
r2  y2 gnd 10k
r3  y3 gnd 10k

.probe tran POS = PAR('I(VDD)')
.probe tran Pos_Current = PAR('((POS)^2)^0.5')
.probe tran NEG = PAR('I(VSS)')
.probe tran Neg_Current = PAR('((NEG)^2)^0.5')
.probe tran MISC_BIAS = PAR('(((I(VB1))^2)^0.5)*(((V(VB1))^2)^0.5)+(((I(VB2))^2)^0.5)*(((V(VB2))^2)^0.5)')
.probe tran MISC_IN = PAR('(((I(Y1))^2)^0.5)*(((V(Y1))^2)^0.5)+(((I(Y2))^2)^0.5)*(((V(Y2))^2)^0.5)+(((I(Y3))^2)^0.5)*(((V(Y3))^2)^0.5)')

*Bias Power
.meas tran Bias_Pos_Curr 	AVG PAR('Pos_Current') from t_bias to t_start_in
.meas tran Bias_Neg_Curr 	AVG PAR('Neg_Current') from t_bias to t_start_in
.meas tran Bias_Misc	 	AVG PAR('MISC_BIAS+MISC_IN') from t_bias to t_start_in
.meas tran Bias_Power_Pos 	PARAM 'Bias_Pos_Curr*SUPPLY' from t_bias to t_start_in
.meas tran Bias_Power_Neg 	PARAM 'Bias_Neg_Curr*SUPPLY' from t_bias to t_start_in
.meas tran Total_Bias_Power 	PARAM 'Bias_Power_Pos + Bias_Power_Neg + Bias_Misc' from t_bias to t_start_in

*Transient Power
.meas tran Avg_Pos_Curr 	AVG PAR('Pos_Current') from t_start_in to t_total
.meas tran Avg_Neg_Curr 	AVG PAR('Neg_Current') from t_start_in to t_total
.meas tran Power_Misc	 	AVG PAR('MISC_BIAS+MISC_IN') from t_start_in to t_total
.meas tran Power_Pos 		PARAM 'Avg_Pos_Curr*SUPPLY' from t_start_in to t_total
.meas tran Power_Neg 		PARAM 'Avg_Neg_Curr*SUPPLY' from t_start_in to t_total
.meas tran Total_Average_Power 	PARAM 'Power_Pos + Power_Neg + Power_Misc' from t_start_in to t_total

.probe tran X_ERROR = PAR('V(x) - (v(y1) - v(y2) + v(y3))')
.probe tran X_SQ_ERROR = PAR('((X_ERROR)^2)^0.5')

.meas  tran TOTAL_X_SQ_ERROR INTEGRAL PAR('X_SQ_ERROR') from t_start_in to t_total
.meas  tran AVG_X_SQ_ERROR AVG PAR('X_SQ_ERROR') from t_start_in to t_total

.probe tran X_OUT_SQ = PAR('((V(x))^2)^0.5')
.meas  tran AVG_X_OUT_SQ AVG PAR('X_OUT_SQ') from t_start_in to t_total
.meas  tran X_ERROR_RATE PARAM 'AVG_X_SQ_ERROR/AVG_X_OUT_SQ*100' from t_start_in to t_total

.meas ac gainmax max vdb(x)
.meas ac f3db when vdb(x)='gainmax-3'

.meas tran maxval pp V(x) from t_start_stable to t_total

.end

