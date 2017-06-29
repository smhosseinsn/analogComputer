*ddcc.sp
.subckt ddcc y1 y2 y3 vb1 vb2 x z vdd vss g='g' min='min'
.param L1='2*min'
.param L2='2*min'
.param L3='1*min'
.param L4='2*min'
.param L5='1*min'
.param L6='2*min'
.param W1=1
.param W2=2
.param W3=8
.param W4=1.5
.param W5=8
.param W6=1.5

*name	drain	gate	source	bulk	type dimension		source and drain area	  source and drain perimeter
*Input diff pairs
m1 net7 	y1 	net8 	vss 	nfet L=L1 W='g*W1*L1' ad='g*W1*L1*5*L1' as='g*W1*L1*5*L1' pd='2*g*W1*L1+10*L1' ps='2*g*W1*L1+10*L1'
m2 net6 	y2 	net8 	vss 	nfet L=L1 W='g*W1*L1' ad='g*W1*L1*5*L1' as='g*W1*L1*5*L1' pd='2*g*W1*L1+10*L1' ps='2*g*W1*L1+10*L1'
m3 net6 	x 	net9 	vss 	nfet L=L1 W='g*W1*L1' ad='g*W1*L1*5*L1' as='g*W1*L1*5*L1' pd='2*g*W1*L1+10*L1' ps='2*g*W1*L1+10*L1'
m4 net7 	y3 	net9 	vss 	nfet L=L1 W='g*W1*L1' ad='g*W1*L1*5*L1' as='g*W1*L1*5*L1' pd='2*g*W1*L1+10*L1' ps='2*g*W1*L1+10*L1'

*NMOS bias
m5 net1 	net2 	net6 	vss 	nfet L=L2 W='g*W2*L2' ad='g*W2*L2*5*L2' as='g*W2*L2*5*L2' pd='2*g*W2*L2+10*L2' ps='2*g*W2*L2+10*L2'
m6 net2 	net2 	net7 	vss 	nfet L=L2 W='g*W2*L2' ad='g*W2*L2*5*L2' as='g*W2*L2*5*L2' pd='2*g*W2*L2+10*L2' ps='2*g*W2*L2+10*L2'

*PMOS bias
m7 net1 	net1 	vdd 	vdd 	pfet L=L3 W='g*W3*L3' ad='g*W3*L3*5*L3' as='g*W3*L3*5*L3' pd='2*g*W3*L3+10*L3' ps='2*g*W3*L3+10*L3'
m8 net2 	net1 	vdd 	vdd 	pfet L=L3 W='g*W3*L3' ad='g*W3*L3*5*L3' as='g*W3*L3*5*L3' pd='2*g*W3*L3+10*L3' ps='2*g*W3*L3+10*L3'

*PMOS driver
m9 net3 	net2 	vdd 	vdd 	pfet L=L5 W='g*W5*L5' ad='g*W5*L5*5*L5' as='g*W5*L5*5*L5' pd='2*g*W5*L5+10*L5' ps='2*g*W5*L5+10*L5'
m10 net4 	net2 	vdd 	vdd 	pfet L=L3 W='g*W3*L3' ad='g*W3*L3*5*L3' as='g*W3*L3*5*L3' pd='2*g*W3*L3+10*L3' ps='2*g*W3*L3+10*L3'

m12 x 		net7 	net3 	vdd 	pfet L=L5 W='g*W5*L5' ad='g*W5*L5*5*L5' as='g*W5*L5*5*L5' pd='2*g*W5*L5+10*L5' ps='2*g*W5*L5+10*L5'
m13 z	 	net7 	net4 	vdd 	pfet L=L3 W='g*W3*L3' ad='g*W3*L3*5*L3' as='g*W3*L3*5*L3' pd='2*g*W3*L3+10*L3' ps='2*g*W3*L3+10*L3'

*NMOS source
m15 net8 	vb1 	net10 	vss 	nfet L=L4 W='g*W4*L4' ad='g*W4*L4*5*L4' as='g*W4*L4*5*L4' pd='2*g*W4*L4+10*L4' ps='2*g*W4*L4+10*L4'
m16 net9 	vb1 	net11 	vss 	nfet L=L4 W='g*W4*L4' ad='g*W4*L4*5*L4' as='g*W4*L4*5*L4' pd='2*g*W4*L4+10*L4' ps='2*g*W4*L4+10*L4'

m20 net10 	vb2 	vss 	vss 	nfet L=L4 W='g*W4*L4' ad='g*W4*L4*5*L4' as='g*W4*L4*5*L4' pd='2*g*W4*L4+10*L4' ps='2*g*W4*L4+10*L4'
m21 net11 	vb2 	vss 	vss 	nfet L=L4 W='g*W4*L4' ad='g*W4*L4*5*L4' as='g*W4*L4*5*L4' pd='2*g*W4*L4+10*L4' ps='2*g*W4*L4+10*L4'

*NMOS driver
*Level 1
m17 x 	vb1 	net12 	vss 	nfet L=L6 W='g*W6*L6' ad='g*W6*L6*5*L6' as='g*W6*L6*5*L6' pd='2*g*W6*L6+10*L6' ps='2*g*W6*L6+10*L6'
m18 z 	vb1 	net13 	vss 	nfet L=L4 W='g*W4*L4' ad='g*W4*L4*5*L4' as='g*W4*L4*5*L4' pd='2*g*W4*L4+10*L4' ps='2*g*W4*L4+10*L4'

*Level 2
m22 net12 	vb2 	vss 	vss 	nfet L=L6 W='g*W6*L6' ad='g*W6*L6*5*L6' as='g*W6*L6*5*L6' pd='2*g*W6*L6+10*L6' ps='2*g*W6*L6+10*L6'
m23 net13 	vb2 	vss 	vss 	nfet L=L4 W='g*W4*L4' ad='g*W4*L4*5*L4' as='g*W4*L4*5*L4' pd='2*g*W4*L4+10*L4' ps='2*g*W4*L4+10*L4'

.ends
.end
