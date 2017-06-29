*switch.sp
.subckt switch clock notclock vin vout vdd vss	g='g' min='min'
.param L1='1*min'
.param L2='1*min'

.param W1='1*g'
.param W2='2*g'
.param switchL1=2
.param switchL2=2
.param switchW1=1
.param switchW2=2
.param switchG=1
m1	vout	clock	        vin	vss	nfet L='switchL1*min' W='switchW1*min*switchG'  ad='switchW1*min*switchG*5*switchL1*min' as='switchW1*min*switchG*5*switchL1*min' pd='2*switchW1*min*switchG+10*switchL1*min' ps='2*switchW1*min*switchG+10*switchL1*min'	
m2	vout	notclock	vin	vdd	pfet L='switchL2*min' W='switchW2*min*switchG'  ad='switchW2*min*switchG*5*switchL2*min' as='switchW2*min*switchG*5*switchL2*min' pd='2*switchW2*min*switchG+10*switchL2*min' ps='2*switchW2*min*switchG+10*switchL2*min'
.ends
.end
