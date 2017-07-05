*lpddcc.sp

.subckt lp_ddcc y1 y2 y3 vb1 vb2 vb3 x vdd vss	g='g' min='min'
.param L1='1*min'
.param L2='1*min'
.param L3='1*min'
.param W1='1*g'
.param W2='3*g'
.param W3='5*g'

*name	drain	gate	source	bulk	type dimension		source and drain area	  source and drain perimeter
*Input diff pairs
m1	net2 	y1 	net3 	vss 	nfet L=L1 W='W1*L1' ad='W1*L1*5*L1' as='W1*L1*5*L1' pd='2*W1*L1+10*L1' ps='2*W1*L1+10*L1'
m2	net1 	y2 	net3 	vss 	nfet L=L1 W='W1*L1' ad='W1*L1*5*L1' as='W1*L1*5*L1' pd='2*W1*L1+10*L1' ps='2*W1*L1+10*L1'
m4	net1 	x 	net4 	vss 	nfet L=L1 W='W1*L1' ad='W1*L1*5*L1' as='W1*L1*5*L1' pd='2*W1*L1+10*L1' ps='2*W1*L1+10*L1'
m3	net2 	y3 	net4 	vss 	nfet L=L1 W='W1*L1' ad='W1*L1*5*L1' as='W1*L1*5*L1' pd='2*W1*L1+10*L1' ps='2*W1*L1+10*L1'

*PMOS bias
m5	net2	net1 	vdd 	vdd 	pfet L=L3 W='W3*L3' ad='W3*L3*5*L3' as='W3*L3*5*L3' pd='2*W3*L3+10*L3' ps='2*W3*L3+10*L3'
m6	net1	net1 	vdd 	vdd 	pfet L=L3 W='W3*L3' ad='W3*L3*5*L3' as='W3*L3*5*L3' pd='2*W3*L3+10*L3' ps='2*W3*L3+10*L3'
m7	x 	net2 	vdd 	vdd 	pfet L=L3 W='W3*L3' ad='W3*L3*5*L3' as='W3*L3*5*L3' pd='2*W3*L3+10*L3' ps='2*W3*L3+10*L3'

*NMOS bias
m8	net3 	vb1 	vss 	vss 	nfet L=L2 W='W2*L2' ad='W2*L2*5*L2' as='W2*L2*5*L2' pd='2*W2*L2+10*L2' ps='2*W2*L2+10*L2'
m9	net4 	vb2 	vss 	vss 	nfet L=L2 W='W2*L2' ad='W2*L2*5*L2' as='W2*L2*5*L2' pd='2*W2*L2+10*L2' ps='2*W2*L2+10*L2'
m10	x 	vb3 	vss 	vss 	nfet L=L2 W='W2*L2' ad='W2*L2*5*L2' as='W2*L2*5*L2' pd='2*W2*L2+10*L2' ps='2*W2*L2+10*L2'
.ends
.end
