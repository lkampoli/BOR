set term pdfcairo; 

set output 'Velocity.eps'
set terminal postscript eps enhanced color font 'Helvetica,16'
set termopt enhanced
set key top left
set grid back

#set key samplen 3 spacing .95 font ",8"
set key samplen 3 spacing 1.15 font ",12"
set key at graph 0.01, 0.95
#set key at graph -0.05, 0.95

set ylabel 'r/R' offset 2
#set ylabel 'y/R' 
set xlabel 'U_x/U_b
set yrange [0:1] reverse
set xrange [*:*]
set grid

ColorNames = '\
white black dark-grey red web-green web-blue dark-magenta dark-cyan dark-orange dark-yellow \
royalblue goldenrod dark-spring-green purple steelblue dark-red dark-chartreuse orchid aquamarine brown \
yellow turquoise grey0 grey10 grey20 grey30 grey40 grey50 grey60 grey70 \
grey grey80 grey90 grey100 light-red light-green light-blue light-magenta light-cyan light-goldenrod \
light-pink light-turquoise gold green dark-green spring-green forest-green sea-green blue dark-blue \
midnight-blue navy medium-blue skyblue cyan magenta dark-turquoise dark-pink coral light-coral \
orange-red salmon dark-salmon khaki dark-khaki dark-goldenrod beige olive orange violet \
dark-violet plum dark-plum dark-olivegreen orangered4 brown4 sienna4 orchid4 mediumpurple3 slateblue1 \
yellow4 sienna1 tan1 sandybrown light-salmon pink khaki1 lemonchiffon bisque honeydew \
slategrey seagreen antiquewhite chartreuse greenyellow gray light-gray light-grey dark-gray slategray \
gray0 gray10 gray20 gray30 gray40 gray50 gray60 gray70 gray80 gray90 \
gray100'

set style line 100 lw 7 pt 7 ps 0.7 lc rgb 'black' 	# exp.
set style line 101 lw 7 pt 7 ps 0.7 lc rgb 'red'   	# baseline
set style line 102 lw 7 pt 7 ps 0.7 lc rgb 'green'
set style line 103 lw 7 pt 7 ps 0.7 lc rgb 'blue'
set style line 104 lw 7 pt 7 ps 0.7 lc rgb 'orange'
set style line 105 lw 7 pt 7 ps 0.7 lc rgb 'light-magenta'
set style line 106 lw 7 pt 7 ps 0.7 lc rgb 'grey'
set style line 107 lw 7 pt 7 ps 0.7 lc rgb 'purple'
set style line 108 lw 7 pt 7 ps 0.7 lc rgb 'violet'
set style line 109 lw 7 pt 7 ps 0.7 lc rgb 'goldenrod'
set style line 110 lw 7 pt 7 ps 0.7 lc rgb 'plum'
set style line 111 lw 7 pt 7 ps 0.7 lc rgb 'greenyellow'
set style line 112 lw 7 pt 7 ps 0.7 lc rgb 'dark-cyan'
set style line 113 lw 7 pt 7 ps 0.7 lc rgb 'dark-magenta'
set style line 114 lw 7 pt 7 ps 0.7 lc rgb 'magenta'
set style line 115 lw 7 pt 7 ps 0.7 lc rgb 'yellow'
set style line 116 lw 7 pt 7 ps 0.7 lc rgb 'gray80'

f1a = 'SST_MediumBody_with.inlet.dat.profile.interpolated/postProcessing/sample/291000/'
f1b = 'SST_MediumBody_with.inlet.dat.profile.interpolated/postProcessing/sampleDict/291000/'

#STERN1 = 'run_best_BOR-in-the-loop-STERN/BOR/postProcessing/sampleDict/2000/'
#STERN2 = 'run_best_no_R_BOR-in-the-loop-STERN/BOR/postProcessing/sampleDict/2000/'

g1 = 'run_00257_GEP-in-the-loop_CLUSTER5_no_R/BOR/postProcessing/sampleDict/2000/'
g3 = 'run_00133_GEP-in-the-loop-CLUSTER5/BOR/postProcessing/sampleDict/2000/'

g4 = 'run_00317_GEP-in-the-loop_CLUSTER0_no_R/BOR/postProcessing/sampleDict/2000/'
g5 = 'run_00403_GEP-in-the-loop-CLUSTER0/BOR/postProcessing/sampleDict/2000/'

### Experimental data
exp_head = "<(sed -n '"
exp_tail = "' ../DATA/BoR_Data/data_Oct_2021/turbStat/BoRDataCompilation_Medium.dat)"
exp_expr = " '22, 118p' '119, 204p' '205, 285p' '286, 363p' '364, 439p' '440, 512p' '513, 582p' '583, 650p' '651, 716p' '717, 780p' '781, 842p' '843, 903p' '904, 963p' '964, 1014p' '1066, 1116p' '1168, 1218p' '1270, 1320p' '1372, 1422p' '1473, 1522p' '1571, 1618p' '1667, 1713p' '1714, 1760p' '1761, 1807p' '1808, 1854p'  '1855, 1901p' '1902, 1948p' '1949, 1995p'  '1996, 2042p' '2043, 2089p' '2090, 2136p' '2137, 2184p' '2185, 2234p' '2235, 2288p' '2289, 2347p' '2348, 2413p' '2583, 2674p' '2767, 2858p' '2951, 3042p' '3135, 3226p' '3319, 3410p' '3503, 3594p' '3687, 3778p' '3871, 3962p' "

### CFD solutions from Ganbo
cfd1_head = exp_head
cfd1_tail = "' ../DATA/cfd_sst_exp_inlet.dat)"
cfd1_expr = " '15, 111p' '112, 197p' '198, 278p' '279, 356p' '357, 432p' '433, 505p' '506, 575p' '576, 643p' '644, 709p' '710, 773p' '774, 835p' '836, 896p' '897, 956p' '957, 1007p' '1059, 1109p' '1161, 1211p' '1263, 1313p' '1365, 1415p' '1466, 1515p' '1564, 1611p' '1660, 1706p' '1707, 1753p' '1754, 1800p' '1801, 1847p' '1848, 1894p' '1895, 1941p' '1942, 1988p' '1989, 2035p' '2036, 2082p' '2083, 2129p' '2130, 2177p' '2178, 2227p' '2228, 2281p' '2282, 2340p' '2341, 2406p' '2576, 2667p' '2760, 2851p' '2944, 3035p' '3128, 3219p' '3312, 3403p' '3496, 3587p' '3680, 3771p' '3864, 3955p' "

cfd2_head = cfd1_head
cfd2_tail = "' ../DATA/cfd.dat)"
cfd2_expr = cfd1_expr

### RANS
head = 'XoRp'
tail = '_U.xy'
xR = "'-0.1' '0.0' '0.1' '0.2' '0.3' '0.4' '0.5' '0.6' '0.7' '0.8' '0.9' '1.0' '1.1' '4.17' '4.37' '4.57' '4.77' '4.97' '5.17' '5.37' '8.67' '8.92' '9.17' '9.42' '9.67' '9.92' '10.17' '10.42' '10.67' '10.92' '11.17' '11.42' '11.67' '11.92' '12.17' '12.9167' '13.4167' '13.9167' '14.4167' '14.9167' '15.4167' '15.9167' '16.4167'"


set ylabel 'r/R' offset 2
#set ylabel 'y/R' 
set xlabel 'U_x/U_b
set yrange [0:1] reverse
set xrange [*:*]
set grid
set key top left
set key at graph 0.01, 0.95
do for  [i=1:words(xR)] {
        set title 'Axial mean velocity for MEDIUM body at x/R='.word(xR, i)
        plot \
        f1b.head.word(xR,i).tail    		u 2:1 with l ls 101 title "Baseline", \
        g4.head.word(xR,i).tail 		u 2:1 with l ls 102 title "w/o R", \
        g5.head.word(xR,i).tail 		u 2:1 with l ls 103 title "w/ R", \
        exp_head.word(exp_expr,i).exp_tail  	u 4:2 with l ls 100 title "Exp."
}

        #g1.head.word(xR,i).tail 		u 2:1 with l ls 102 title "w/o R", \
        #g3.head.word(xR,i).tail 		u 2:1 with l ls 103 title "w/ R", \
	q
