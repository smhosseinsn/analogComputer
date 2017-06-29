*floating_gate.sp
.subckt floating_gate  bit  bit_bar word vdd vss	g='g' min='min'	SUPPLY='SUPPLY'
.param L1='1*min'
.param L2='1*min'
.param W1='1*g'
.param W2='2*g'

*isolate	inv	cap	spinFET		isolate

*name	drain	gate	source	bulk	type dimension		source and drain area	  source and drain perimeter
*Isolation transistors
m1 bit		word		curr 		curr 		nfet 	L=L1	W='W1*L1' ad='W1*L1*5*L1' as='W1*L1*5*L1' pd='2*W1*L1+10*L1' ps='2*W1*L1+10*L1'
m2 bit_bar 	word 		curr_bar 	curr_bar 	nfet 	L=L1	W='W1*L1' ad='W1*L1*5*L1' as='W1*L1*5*L1' pd='2*W1*L1+10*L1' ps='2*W1*L1+10*L1'

x1 curr 	curr_bar 	vdd 	vss	inv 	g='g'	min='min'
c1 curr		vss		1f
E1 curr		vss		VOL='...'	curr_bar	vss	MAX='SUPPLY'	MIN='-1*SUPPLY'	

.ends
.end

