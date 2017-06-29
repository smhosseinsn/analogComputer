*ccii.sp
.subckt ccii y x ib z1 z2 z3 z4 vdd vss	g='g' min='min'
.param L1='1*min'
.param L2='1*min'
.param L3='1*min'
.param L4='1*min'
.param W1=10
.param W2=16
.param W3=5
.param W4=5

*name	drain	gate	source	bulk	type dimension		source and drain area	  source and drain perimeter
*NMOS Bias transistors
m1 	ib 	ib 	vss 	vss 	nfet L=L1 W='g*W1*L1' ad='g*W1*L1*5*L1' as='g*W1*L1*5*L1' pd='2*g*W1*L1+10*L1' ps='2*g*W1*L1+10*L1'
m2 	net2 	ib 	vss 	vss 	nfet L=L1 W='g*W1*L1' ad='g*W1*L1*5*L1' as='g*W1*L1*5*L1' pd='2*g*W1*L1+10*L1' ps='2*g*W1*L1+10*L1'
m3 	net3 	ib 	vss 	vss 	nfet L=L1 W='g*W1*L1' ad='g*W1*L1*5*L1' as='g*W1*L1*5*L1' pd='2*g*W1*L1+10*L1' ps='2*g*W1*L1+10*L1'
m4 	net4 	net4 	vss 	vss 	nfet L=L1 W='g*W1*L1' ad='g*W1*L1*5*L1' as='g*W1*L1*5*L1' pd='2*g*W1*L1+10*L1' ps='2*g*W1*L1+10*L1'
m5 	z1 	net4 	vss 	vss 	nfet L=L1 W='g*W1*L1' ad='g*W1*L1*5*L1' as='g*W1*L1*5*L1' pd='2*g*W1*L1+10*L1' ps='2*g*W1*L1+10*L1'
m6 	z2 	net4 	vss 	vss 	nfet L=L1 W='g*W1*L1' ad='g*W1*L1*5*L1' as='g*W1*L1*5*L1' pd='2*g*W1*L1+10*L1' ps='2*g*W1*L1+10*L1'
m7 	net5 	net4 	vss 	vss 	nfet L=L1 W='g*W1*L1' ad='g*W1*L1*5*L1' as='g*W1*L1*5*L1' pd='2*g*W1*L1+10*L1' ps='2*g*W1*L1+10*L1'
m8 	net6 	net6 	vss 	vss 	nfet L=L1 W='g*W1*L1' ad='g*W1*L1*5*L1' as='g*W1*L1*5*L1' pd='2*g*W1*L1+10*L1' ps='2*g*W1*L1+10*L1'
m9 	z3 	net6 	vss 	vss 	nfet L=L1 W='g*W1*L1' ad='g*W1*L1*5*L1' as='g*W1*L1*5*L1' pd='2*g*W1*L1+10*L1' ps='2*g*W1*L1+10*L1'
m10 	z4 	net6 	vss 	vss 	nfet L=L1 W='g*W1*L1' ad='g*W1*L1*5*L1' as='g*W1*L1*5*L1' pd='2*g*W1*L1+10*L1' ps='2*g*W1*L1+10*L1'

*PMOS Bias transistors
m11 	net2 	net2 	vdd 	vdd 	pfet L=L2 W='g*W2*L2' ad='g*W2*L2*5*L2' as='g*W2*L2*5*L2' pd='2*g*W2*L2+10*L2' ps='2*g*W2*L2+10*L2'
m12 	net7 	net2 	vdd 	vdd 	pfet L=L2 W='g*W2*L2' ad='g*W2*L2*5*L2' as='g*W2*L2*5*L2' pd='2*g*W2*L2+10*L2' ps='2*g*W2*L2+10*L2'
m13 	net8 	net8 	vdd 	vdd 	pfet L=L2 W='g*W2*L2' ad='g*W2*L2*5*L2' as='g*W2*L2*5*L2' pd='2*g*W2*L2+10*L2' ps='2*g*W2*L2+10*L2'
m14 	z1 	net8 	vdd 	vdd 	pfet L=L2 W='g*W2*L2' ad='g*W2*L2*5*L2' as='g*W2*L2*5*L2' pd='2*g*W2*L2+10*L2' ps='2*g*W2*L2+10*L2'
m15 	z2 	net8 	vdd 	vdd 	pfet L=L2 W='g*W2*L2' ad='g*W2*L2*5*L2' as='g*W2*L2*5*L2' pd='2*g*W2*L2+10*L2' ps='2*g*W2*L2+10*L2'
m16 	net6 	net8 	vdd 	vdd 	pfet L=L2 W='g*W2*L2' ad='g*W2*L2*5*L2' as='g*W2*L2*5*L2' pd='2*g*W2*L2+10*L2' ps='2*g*W2*L2+10*L2'
m17 	net5 	net5 	vdd 	vdd 	pfet L=L2 W='g*W2*L2' ad='g*W2*L2*5*L2' as='g*W2*L2*5*L2' pd='2*g*W2*L2+10*L2' ps='2*g*W2*L2+10*L2'
m18 	z33 	net5 	vdd 	vdd 	pfet L=L2 W='g*W2*L2' ad='g*W2*L2*5*L2' as='g*W2*L2*5*L2' pd='2*g*W2*L2+10*L2' ps='2*g*W2*L2+10*L2'
m19 	z4 	net5 	vdd 	vdd 	pfet L=L2 W='g*W2*L2' ad='g*W2*L2*5*L2' as='g*W2*L2*5*L2' pd='2*g*W2*L2+10*L2' ps='2*g*W2*L2+10*L2'

*Input diff pairs
m20 net7 	net7 	y 	vss 	nfet L=L3 W='g*W3*L3' ad='g*W3*L3*5*L3' as='g*W3*L3*5*L3' pd='2*g*W3*L3+10*L3' ps='2*g*W3*L3+10*L3'
m21 net3 	net3 	y 	vdd 	pfet L=L4 W='g*W4*L4' ad='g*W1*L4*5*L4' as='g*W4*L4*5*L4' pd='2*g*W4*L4+10*L4' ps='2*g*W4*L4+10*L4'
m22 net8 	net7 	x 	vss 	nfet L=L3 W='g*W3*L3' ad='g*W1*L3*5*L3' as='g*W3*L3*5*L3' pd='2*g*W3*L3+10*L3' ps='2*g*W3*L3+10*L3'
m23 net4 	net3 	x 	vdd 	pfet L=L4 W='g*W4*L4' ad='g*W4*L4*5*L4' as='g*W4*L4*5*L4' pd='2*g*W4*L4+10*L4' ps='2*g*W4*L4+10*L4'
.ends
.end

