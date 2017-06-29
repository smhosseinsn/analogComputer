*eddcc.sp

*Operating Modes
*c11	c12	c2	c3
* 0	 0	0	0	z = y1 * sig(w1) - y2 * sig(w2) + y3 * sig(w3)
* 1	 0	0	0	z = exp(y1 * sig(w1) - y2 * sig(w2) + y3 * sig(w3))
* 0	 1	0	0	z = ln(y1 * sig(w1) - y2 * sig(w2) + y3 * sig(w3))
* 1	 1	0	0	z = (y1 * sig(w1)) / (y2 * sig(w2)) * (y3 * sig(w3))
* 0	 0	1	0	z = int(y1 * sig(w1) - y2 * sig(w2) + y3 * sig(w3))
* 0	 0	0	1	z = deriv(y1 * sig(w1) - y2 * sig(w2) + y3 * sig(w3))

.subckt eddcc y1 w1 y2 w2 y3 w3 c11 c12 c2 c3 vb1 vb2 x z vdd vss	g='g' min='min' SUPPLY='SUPPLY'
X1 w1	o1 	y1 	vss	inv 	g	min
S1 	o1 	v1 	c11 	vss 	SMOD
D1	v1	vss			DMOD

X2 w2	o2 	y2 	vss	inv 	g	min
S2 	o2 	v2 	c11 	vss 	SMOD
D2	v2	vss			DMOD

X3 w3	o3 	y3 	vss	inv 	g	min
S3 	o3 	v3 	c11 	vss 	SMOD
D3	v3	vss			DMOD

X4 o1 o2 o3 vb1 vb2 vb3 x vdd vss	lpddcc	g 	min
S4 	x 	v4 	c12 	vss 	SMOD
D4	v4	vss			DMOD

S5 	x 	v5 	c2 	vss 	SMOD
S6 	z 	v6 	c2 	vss 	SMOD
R1	v5	vss	1k
C1	v6	vss	1f

S5 	z 	v5 	c3 	vss 	SMOD
S6 	x 	v6 	c3 	vss 	SMOD
R1	v5	vss	1k
C1	v6	vss	1f

.MODEL SMOD VSWITCH(RON = 1, VON = 'SUPPLY', ROFF = 100MEG, VOFF='-1*SUPPLY')
.MODEL DMOD D (IS=0.1PA, RS=16 CJO=2PF TT=12N BV=100 IBV=0.1PA)

.ends
