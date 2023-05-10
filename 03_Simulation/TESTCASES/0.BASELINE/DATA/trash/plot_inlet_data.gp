set term pdfcairo; set output 'inlet-data.pdf'
#set size ratio -1
#unset grid
#set tic scale 0
#set style line 1 lw 1 pt 7 ps 0.7 lc rgb 'black'
#set style line 2 lw 1 pt 7 ps 0.7 lc rgb 'red'

DATA = 'inlet.dat'
EXP  = 'U_Exp.dat'

plot DATA using 1:2 notitle with l ls 1, \
     EXP  using 1:2 notitle with l ls 2

plot DATA using 1:3 notitle with l ls 1

plot DATA using 1:4 notitle with l ls 1

q
