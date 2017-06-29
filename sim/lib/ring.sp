*ring.sp
.subckt ring curr vdd vss g='g' min='min'
X1 curr a vdd vss inv g min
X2 a b vdd vss inv g min
X3 b curr vdd vss inv g min
.ends
