*progmult.sp

.MODEL D D (CO=2PF, RS=1, IS=1P)
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

.subckt  progmult y1 y2 y3 vb1 vb2 x z y1c y1nc y2c y2nc y3c y3nc xc xnc vdd vss
*.subckt  progmult y1 y2 y3 vb1 vb2 x z vdd vss
*.subckt  progmult y1 y2 y3 vb1 vb2 x y1c y1nc y2c y2nc y3c y3nc xc xnc vdd vss
*name	drain	gate	source	bulk	type dimension		source and drain area	  source and drain perimeter

*Y1 Switch
*m24      y1d     y1c         y1     vss     nfet L='L7' W='W7'  ad='W7*L7*5*L7' as='W7*L7*5*L7' pd='2*W7*L7+10*L7' ps='2*W7*L7+10*L7'
*m25      y1d     y1nc        y1     vdd     pfet L='L8' W='W8'  ad='W8*L8*5*L8' as='W8*L8*5*L8' pd='2*W8*L8+10*L8' ps='2*W8*L8+10*L8'
*Y2 Switch
*m26      y2d     y2c         y2     vss     nfet L='L7' W='W7'  ad='W7*L7*5*L7' as='W7*L7*5*L7' pd='2*W7*L7+10*L7' ps='2*W7*L7+10*L7'
*m27      y2d     y2nc        y2     vdd     pfet L='L8' W='W8'  ad='W8*L8*5*L8' as='W8*L8*5*L8' pd='2*W8*L8+10*L8' ps='2*W8*L8+10*L8'
*Y3 Switch
*m28      y3d     y3c         y3     vss     nfet L='L7' W='W7'  ad='W7*L7*5*L7' as='W7*L7*5*L7' pd='2*W7*L7+10*L7' ps='2*W7*L7+10*L7'
*m29      y3d     y3nc        y3     vdd     pfet L='L8' W='W8'  ad='W8*L8*5*L8' as='W8*L8*5*L8' pd='2*W8*L8+10*L8' ps='2*W8*L8+10*L8'
*X Switch
*m30      xd      xc          x     vss     nfet L='L7' W='W7'  ad='W7*L7*5*L7' as='W7*L7*5*L7' pd='2*W7*L7+10*L7' ps='2*W7*L7+10*L7'
*m31      xd      xnc         x     vdd     pfet L='L8' W='W8'  ad='W8*L8*5*L8' as='W8*L8*5*L8' pd='2*W8*L8+10*L8' ps='2*W8*L8+10*L8'

*Diodes
D1  y1          vss     D
D2  y2          vss     D
D3  y3          vss     D
D4  x           vss     D
*D5  vss          y1     D
*D6  vss          y2     D
*D7  vss          y3     D
*D8  vss           x     D

*r1  y1          y1d     1
*r2  y2          y2d     1
*r3  y3          y3d     1
*r4  x           xd      1

.ends
.end

