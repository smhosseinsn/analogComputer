*mux21.sp
.subckt mux21 vin vout vdd vss	g='g' min='min'
.param L1='1*min'
.param L2='1*min'

.param W1='1*g'
.param W2='2*g'

*name	drain	gate	source	bulk	type dimension		source and drain area	  source and drain perimeter
m1 net1 	a 	vdd 	vdd 	pfet L=L2 W='W2*L2' ad='W2*L2*5*L2' as='W2*L2*5*L2' pd='2*W2*L2+10*L2' ps='2*W2*L2+10*L2'
m2 net2 	b 	vdd 	vdd 	pfet L=L2 W='W2*L2' ad='W2*L2*5*L2' as='W2*L2*5*L2' pd='2*W2*L2+10*L2' ps='2*W2*L2+10*L2'
m3 y	 	sbar 	net1 	vdd 	pfet L=L2 W='W2*L2' ad='W2*L2*5*L2' as='W2*L2*5*L2' pd='2*W2*L2+10*L2' ps='2*W2*L2+10*L2'
m4 y 		s 	net2 	vdd 	pfet L=L2 W='W2*L2' ad='W2*L2*5*L2' as='W2*L2*5*L2' pd='2*W2*L2+10*L2' ps='2*W2*L2+10*L2'
m5 y	 	s 	net3 	vss 	nfet L=L1 W='W1*L1' ad='W1*L1*5*L1' as='W1*L1*5*L1' pd='2*W1*L1+10*L1' ps='2*W1*L1+10*L1'
m6 y	 	sbar 	net4 	vss 	nfet L=L1 W='W1*L1' ad='W1*L1*5*L1' as='W1*L1*5*L1' pd='2*W1*L1+10*L1' ps='2*W1*L1+10*L1'
m7 net3 	a 	vss 	vss 	nfet L=L1 W='W1*L1' ad='W1*L1*5*L1' as='W1*L1*5*L1' pd='2*W1*L1+10*L1' ps='2*W1*L1+10*L1'
m8 net4 	b 	vss 	vss 	nfet L=L1 W='W1*L1' ad='W1*L1*5*L1' as='W1*L1*5*L1' pd='2*W1*L1+10*L1' ps='2*W1*L1+10*L1'

*inv
x1 s sbar vdd vss
.ends
.end
