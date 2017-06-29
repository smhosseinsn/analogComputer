*ddccTest.sp
.subckt mosres in out 
*name	drain	gate	source	bulk	type dimension		source and drain area	  source and drain perimeter
.param 
m0 	out 	in 	vdd 	vdd 	pfet 	L=2 	W=16
m1 	out 	in 	vss 	vss 	nfet 	L=2 	W=16
.ends
.end
