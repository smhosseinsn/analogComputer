*multiplier.sp

.MODEL diode D (CO=2PF, RS=1, IS=1P)
*.MODEL DFOWLER D (LEVEL=2, TOX=100, JF=1E-10, EF=1E8)
*.MODEL DGEO D (LEVEL=3, JS=1E-4, JSW=1E-8)
*.MODEL d1n750a D
*+ LEVEL=1 XP =0.0 EG =1.1
*+ XOI =0.0 XOM =0.0 XM =0.0
*+ WP =0.0 WM =0.0 LP =0.0
*+ LM =0.0 AF =1.0 JSW =0.0
*+ PB =0.65 PHP =0.8 M =0.2994
*+ FC =0.95 FCS =0.4 MJSW=0.5
*+ TT =2.446e-9 BV =4.65 RS =19
*+ IS =1.485e-11 CJO =1.09e-9 CJP =0.0
*+ PJ =0.0 N =1.615 IK =0.0
*+ IKR =1.100e-2 IBV =2.00e-2

.subckt multiplier y1 y2 y3 vb1 vb2 x z vdd vss	g='g' min='min'
x1 y1 y2 y3 vb1 vb2 vb3 x vdd vss	lpddcc	g='g' min='min'

*Diodes
D1	y1	vss	dpnw
D2	y2	vss	dpnw
D3	y3	vss	dpnw
D4	x	vss	dpnw
.ends
.end
