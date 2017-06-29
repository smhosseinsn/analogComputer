*inv.sp
.subckt inv vin vout vdd vss	g='g' min='min'
.param L1='1*min'
.param L2='1*min'

.param W1='1*g'
.param W2='2*g'

*name	drain	gate	source	bulk	type dimension		source and drain area	  source and drain perimeter
m1 vout 	vin 	vss 	vss 	nfet L=L1 W='W1*L1' ad='W1*L1*5*L1' as='W1*L1*5*L1' pd='2*W1*L1+10*L1' ps='2*W1*L1+10*L1'
m2 vout 	vin 	vdd 	vdd 	pfet L=L2 W='W2*L2' ad='W2*L2*5*L2' as='W2*L2*5*L2' pd='2*W2*L2+10*L2' ps='2*W2*L2+10*L2'
.ends
.end

