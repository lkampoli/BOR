set term pdfcairo; set output 'mean_axial_velocity.pdf'
#set terminal postscript enhanced
set termopt enhanced
set grid

set key bottom right

#set style line 1 lt 1 pt 7 ps 1.5 lw 5 lc rgb 'black'
#set style line 2 lt 1 pt 7 ps 1.5 lw 5 lc rgb 'forest-green'
#set style line 3 lt 1 pt 7 ps 1.5 lw 5 lc rgb 'blue'
#set style line 4 lt 1 pt 9 ps 1.5 lw 5 lc rgb 'red'
#set style line 5 lt 1 pt 7 ps 1.5 lw 2 lc rgb 'cyan'
#set style line 6 lt 1 pt 7 ps 1.5 lw 2 lc rgb 'orange'
#set style line 7 lt 1 pt 7 ps 1.5 lw 2 lc rgb 'grey'

set style line 1 lw 1 pt 7 ps 0.7 lc rgb 'black'
set style line 101 lw 5 pt 7 ps 0.7 lc rgb 'red'
set style line 102 lw 5 pt 7 ps 0.7 lc rgb 'blue'
set style line 103 lw 5 pt 7 ps 0.7 lc rgb 'green'
set style line 104 lw 5 pt 7 ps 0.7 lc rgb 'orange'
set style line 105 lw 5 pt 7 ps 0.7 lc rgb 'cyan'
set style line 106 lw 5 pt 7 ps 0.7 lc rgb 'grey'
set style line 107 lw 5 pt 7 ps 0.7 lc rgb 'forest-green'

set style line    1 lw 3

#set style fill  transparent solid 0.2 noborder

set grid back
#unset log x
set xlabel "y/R"

#set log y
#set format y  "10^{%-L}"
set ylabel "U/U_b" offset -0.5,0

plot "<(sed -n '533,608p'   BoRDataCompilation_Small.dat)" using 3:4 title "x/R=0.5" with l ls 1 ,\
     "<(sed -n '900,969p'   BoRDataCompilation_Small.dat)" using 3:4 title "x/R=1.0" with l ls 101, \
     "<(sed -n '1039,1102p' BoRDataCompilation_Small.dat)" using 3:4 title "x/R=4.1" with l ls 102, \
     "<(sed -n '2281,2340p' BoRDataCompilation_Small.dat)" using 3:4 title "x/R=10." with l ls 103, \
     "<(sed -n '5693,5784p' BoRDataCompilation_Small.dat)" using 3:4 title "x/R=20." with l ls 104, \
     "<(sed -n '7717,7808p' BoRDataCompilation_Small.dat)" using 3:4 title "x/R=30." with l ls 105,\
     "<(sed -n '8177,8268p' BoRDataCompilation_Small.dat)" using 3:4 title "x/R=40." with l ls 106,\
     "<(sed -n '8637,8728p' BoRDataCompilation_Small.dat)" using 3:4 title "x/R=50." with l ls 107

set ylabel "u_xu_r/u_{tau}^2" offset -0.5,0
plot "<(sed -n '533,608p'   BoRDataCompilation_Small.dat)" using 3:8 title "x/R=0.5" with l ls 1 ,\
     "<(sed -n '900,969p'   BoRDataCompilation_Small.dat)" using 3:8 title "x/R=1.0" with l ls 101, \
     "<(sed -n '1039,1102p' BoRDataCompilation_Small.dat)" using 3:8 title "x/R=4.1" with l ls 102, \
     "<(sed -n '2281,2340p' BoRDataCompilation_Small.dat)" using 3:8 title "x/R=10." with l ls 103, \
     "<(sed -n '5693,5784p' BoRDataCompilation_Small.dat)" using 3:8 title "x/R=20." with l ls 104, \
     "<(sed -n '7717,7808p' BoRDataCompilation_Small.dat)" using 3:8 title "x/R=30." with l ls 105,\
     "<(sed -n '8177,8268p' BoRDataCompilation_Small.dat)" using 3:8 title "x/R=40." with l ls 106,\
     "<(sed -n '8637,8728p' BoRDataCompilation_Small.dat)" using 3:8 title "x/R=50." with l ls 107

set ylabel "u_r^2/u_{tau}^2" 
plot "<(sed -n '533,608p'   BoRDataCompilation_Small.dat)" using 3:7 title "x/R=0.5" with l ls 1 ,\
     "<(sed -n '900,969p'   BoRDataCompilation_Small.dat)" using 3:7 title "x/R=1.0" with l ls 101, \
     "<(sed -n '1039,1102p' BoRDataCompilation_Small.dat)" using 3:7 title "x/R=4.1" with l ls 102, \
     "<(sed -n '2281,2340p' BoRDataCompilation_Small.dat)" using 3:7 title "x/R=10." with l ls 103, \
     "<(sed -n '5693,5784p' BoRDataCompilation_Small.dat)" using 3:7 title "x/R=20." with l ls 104, \
     "<(sed -n '7717,7808p' BoRDataCompilation_Small.dat)" using 3:7 title "x/R=30." with l ls 105,\
     "<(sed -n '8177,8268p' BoRDataCompilation_Small.dat)" using 3:7 title "x/R=40." with l ls 106,\
     "<(sed -n '8637,8728p' BoRDataCompilation_Small.dat)" using 3:7 title "x/R=50." with l ls 107

set ylabel "u_x^2/u_{tau}^2" 
plot "<(sed -n '533,608p'   BoRDataCompilation_Small.dat)" using 3:6 title "x/R=0.5" with l ls 1 ,\
     "<(sed -n '900,969p'   BoRDataCompilation_Small.dat)" using 3:6 title "x/R=1.0" with l ls 101, \
     "<(sed -n '1039,1102p' BoRDataCompilation_Small.dat)" using 3:6 title "x/R=4.1" with l ls 102, \
     "<(sed -n '2281,2340p' BoRDataCompilation_Small.dat)" using 3:6 title "x/R=10." with l ls 103, \
     "<(sed -n '5693,5784p' BoRDataCompilation_Small.dat)" using 3:6 title "x/R=20." with l ls 104, \
     "<(sed -n '7717,7808p' BoRDataCompilation_Small.dat)" using 3:6 title "x/R=30." with l ls 105,\
     "<(sed -n '8177,8268p' BoRDataCompilation_Small.dat)" using 3:6 title "x/R=40." with l ls 106,\
     "<(sed -n '8637,8728p' BoRDataCompilation_Small.dat)" using 3:6 title "x/R=50." with l ls 107

	q
