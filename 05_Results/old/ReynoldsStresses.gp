set term pdfcairo; 
set output 'ReynoldsStresses.eps'
set terminal postscript eps enhanced color font 'Helvetica,16'
set termopt enhanced
set term post enhanced color
set key top left
set grid back

set key samplen 3 spacing .95 font ",8"
set key at graph 0.01, 0.95
#set key at graph -0.05, 0.95

set ylabel 'y/R'
set xlabel  "U_x U_r / U^2_{/Symbol t}" #'U_{/Symbol T}^2' # 'U_xU_r/U_{tau}^2'
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

set style line 100 lw 5 pt 7 ps 0.7 lc rgb 'black'      # exp.
set style line 101 lw 5 pt 7 ps 0.7 lc rgb 'red'        # baseline
set style line 102 lw 5 pt 7 ps 0.7 lc rgb 'green'
set style line 103 lw 5 pt 7 ps 0.7 lc rgb 'blue'
set style line 104 lw 5 pt 7 ps 0.7 lc rgb 'orange'
set style line 105 lw 5 pt 7 ps 0.7 lc rgb 'light-magenta'
set style line 106 lw 5 pt 7 ps 0.7 lc rgb 'grey'
set style line 107 lw 5 pt 7 ps 0.7 lc rgb 'purple'
set style line 108 lw 5 pt 7 ps 0.7 lc rgb 'violet'
set style line 109 lw 5 pt 7 ps 0.7 lc rgb 'goldenrod'
set style line 110 lw 5 pt 7 ps 0.7 lc rgb 'plum'
set style line 111 lw 5 pt 7 ps 0.7 lc rgb 'greenyellow'
set style line 112 lw 5 pt 7 ps 0.7 lc rgb 'dark-cyan'
set style line 113 lw 5 pt 7 ps 0.7 lc rgb 'dark-magenta'
set style line 114 lw 5 pt 7 ps 0.7 lc rgb 'magenta'
set style line 115 lw 5 pt 7 ps 0.7 lc rgb 'yellow'

#set style line 100 lw 5 pt 7 ps 0.7 lc rgb 'black'      # exp.
#set style line 101 lw 5 pt 7 ps 0.7 lc rgb 'red'        # baseline
#set style line 102 lw 5 pt 7 ps 0.7 lc rgb 'web-green'
#set style line 103 lw 5 pt 7 ps 0.7 lc rgb 'web-blue'
#set style line 104 lw 5 pt 7 ps 0.7 lc rgb 'orange'
#set style line 105 lw 5 pt 7 ps 0.7 lc rgb 'light-magenta'
#set style line 106 lw 5 pt 7 ps 0.7 lc rgb 'grey'
#set style line 107 lw 5 pt 7 ps 0.7 lc rgb 'purple'
#set style line 108 lw 5 pt 7 ps 0.7 lc rgb 'dark-violet'
#set style line 109 lw 5 pt 7 ps 0.7 lc rgb 'goldenrod'
#set style line 110 lw 5 pt 7 ps 0.7 lc rgb 'plum'
#set style line 111 lw 5 pt 7 ps 0.7 lc rgb 'greenyellow'
#set style line 112 lw 5 pt 7 ps 0.7 lc rgb 'dark-cyan'
#set style line 113 lw 5 pt 7 ps 0.7 lc rgb 'dark-magenta'

f1 = 'SST_MediumBody_with.inlet.dat.profile.interpolated/postProcessing/sampleDict/291000/'

f2a = 'SST_MediumBody_with.inlet.dat.profile.interpolated_GEP/postProcessing/sampleDict/81000/'
f2b = 'SST_MediumBody_with.inlet.dat.profile.interpolated_GEP_aij_OFF_Rij_ON/postProcessing/sampleDict/267000/'
f2c = 'SST_MediumBody_with.inlet.dat.profile.interpolated_GEP_all_ON/postProcessing/sampleDict/267000/'

f5a = 'SST_MediumBody_with.inlet.dat.profile.interpolated_GEP_Chitrarth_Lav/postProcessing/sample/179000/'
f5b = 'SST_MediumBody_with.inlet.dat.profile.interpolated_GEP_Chitrarth_Lav/postProcessing/sample/179000/Rall/'
f5c = 'SST_MediumBody_with.inlet.dat.profile.interpolated_GEP_Chitrarth_Lav/postProcessing/sampleDict/278000/'

f6 = 'SST_MediumBody_with.inlet.dat.profile.interpolated_g1/postProcessing/sampleDict/10000/'
f7 = 'SST_MediumBody_with.inlet.dat.profile.interpolated_g2/postProcessing/sampleDict/10000/'
f8 = 'SST_MediumBody_with.inlet.dat.profile.interpolated_g3/postProcessing/sampleDict/5000/'

f9 = 'SST_MediumBody_with.inlet.dat.profile.interpolated_EARSMWallin/postProcessing/sampleDict/330000/'

f10= 'SST_MediumBody_with.inlet.dat.profile.interpolated_GEP_OF7/postProcessing/sampleDict/110000/'
f11= 'SST_MediumBody_with.inlet.dat.profile.interpolated_GEP_OF8/postProcessing/sampleDict/120000/'

###f12 ='run_00339/BOR/postProcessing/sampleDict/2000/'

f13 ='SST_MediumBody_with.inlet.dat.profile.interpolated_GEP_YuanFang_FlatPlate/postProcessing/sampleDict/150000/'
f14 ='SST_MediumBody_with.inlet.dat.profile.interpolated_GEP_YuanFang_HumpFlow/postProcessing/sampleDict/150000/'
f15 ='SST_MediumBody_with.inlet.dat.profile.interpolated_GEP_YuanFang_ChannelFlow/postProcessing/sampleDict/150000/'
f16 ='SST_MediumBody_with.inlet.dat.profile.interpolated_GEP_YuanFang_JetFlow/postProcessing/sampleDict/150000/'

f17 = 'SST_MediumBody_with.inlet.dat.profile.interpolated_GEP_Tr.aijx_RijHat_PH_EVE-MO-57_aijx_term_ON_Rterm_corr_ON/postProcessing/sampleDict/150000/'
f18 = 'SST_MediumBody_with.inlet.dat.profile.interpolated_GEP_Tr.aijx_RijHat_PH_EVE-MO-57_aijx_term_ON_Rterm_corr_OFF/postProcessing/sampleDict/150000/'
f19 = 'SST_MediumBody_with.inlet.dat.profile.interpolated_GEP_Tr.aijx_RijHat_PH_EVE-MO-57_aijx_term_OFF_Rterm_corr_ON/postProcessing/sampleDict/150000/'

f20 = 'SST_MediumBody_with.inlet.dat.profile.interpolated_GEP_Tr.aijx_RijHat_PH_EVE-MO-11_aijx_term_ON_Rterm_corr_ON/postProcessing/sampleDict/130380/'
f21 = 'SST_MediumBody_with.inlet.dat.profile.interpolated_GEP_Tr.aijx_RijHat_PH_EVE-MO-11_aijx_term_ON_Rterm_corr_OFF/postProcessing/sampleDict/124901/'
f22 = 'SST_MediumBody_with.inlet.dat.profile.interpolated_GEP_Tr.aijx_RijHat_PH_EVE-MO-11_aijx_term_OFF_Rterm_corr_ON/postProcessing/sampleDict/150000/'

### BOR in da loop ###
f23 = 'run_00178/BOR/postProcessing/sampleDict/2000/'
f23b = 'run_00178b/BOR/postProcessing/sampleDict/2000/' # WAKE
f23c = 'run_00611/BOR/postProcessing/sampleDict/2000/' # STERN
f23d = 'run_00178/BOR/postProcessing/sampleDict/2000/' # CENTER
f23e = 'run_00178/BOR/postProcessing/sampleDict/2000/' # BOW

g1 = 'run_00218_BOW_NEW/BOR/postProcessing/sampleDict/2000/'
g2 = 'run_00360_CENTER_NEW/BOR/postProcessing/sampleDict/2000/'
g3 = 'run_00611_STERN_NEW/BOR/postProcessing/sampleDict/2000/'
g4 = 'run_00178_WAKE_NEW/BOR/postProcessing/sampleDict/2000/'

h1 = 'run_00120_U_and_Rwall_BOW/BOR/postProcessing/sampleDict/2000/'
h2 = 'run_00186_U_and_Rwall_BOW_ADDED_FEATURES/BOR/postProcessing/sampleDict/2000/'
h3 = 'run_00939_U_and_Rwall_BOW_ADDED_FEATURES/BOR/postProcessing/sampleDict/2000/'
h4 = 'run_00915_U_and_Rwall_BOW_ADDED_FEATURES/BOR/postProcessing/sampleDict/2000/'

i1 = 'run_00721_U_and_Rwall_BOW_ADDED_FEATURES_Qs/BOR/postProcessing/sampleDict/2000/'
i2 = 'run_00270_U_and_Rwall_BOW_ADDED_FEATURES_Qs/BOR/postProcessing/sampleDict/2000/'

z1 = 'run_01052_1000_1000/BOR/postProcessing/sampleDict/2000/'
z2 = 'run_00624_1000_1000/BOR/postProcessing/sampleDict/2000/'
z3 = 'run_00771_1000_1000/BOR/postProcessing/sampleDict/2000/'
z4 = 'run_00836_1000_1000/BOR/postProcessing/sampleDict/2000/'
z5 = 'run_00276_1000_1000/BOR/postProcessing/sampleDict/2000/'
z6 = 'run_01003_1000_1000/BOR/postProcessing/sampleDict/2000/'
z7 = 'run_00784_1000_1000/BOR/postProcessing/sampleDict/2000/'
z8 = 'run_01002_1000_1000/BOR/postProcessing/sampleDict/2000/'

w1 = 'run_00358_RUint/BOR/postProcessing/sampleDict/2000/'
w2 = 'run_00576_RUint/BOR/postProcessing/sampleDict/2000/'
w3 = 'run_00602_RUint/BOR/postProcessing/sampleDict/2000/'
w4 = 'run_00276_RUint/BOR/postProcessing/sampleDict/2000/'
w5 = 'run_00146_RUint/BOR/postProcessing/sampleDict/2000/'
w6 = 'run_00139_RUint/BOR/postProcessing/sampleDict/2000/'

x1 = 'run_00358_URwallint/BOR/postProcessing/sampleDict/2000/'
x2 = 'run_00477_URwallint/BOR/postProcessing/sampleDict/2000/'
x3 = 'run_00097_URwallint/BOR/postProcessing/sampleDict/2000/'
x4 = 'run_00087_URwallint/BOR/postProcessing/sampleDict/2000/'
x5 = 'run_00403_URwallint/BOR/postProcessing/sampleDict/2000/'
x6 = 'run_00440_URwallint/BOR/postProcessing/sampleDict/2000/'
x7 = 'run_00120_URwallint/BOR/postProcessing/sampleDict/2000/'

zzz = 'run_00103_U_1_COST_interpolated/BOR/postProcessing/sampleDict/2000/'

pop50a = 'run_00382_pop50/BOR/postProcessing/sampleDict/2000/'
pop50b = 'run_00312_pop50/BOR/postProcessing/sampleDict/2000/'
pop50c = 'run_00317_pop50/BOR/postProcessing/sampleDict/2000/'
pop50d = 'run_00181_pop50/BOR/postProcessing/sampleDict/2000/'
pop50e = 'run_00204_pop50/BOR/postProcessing/sampleDict/2000/'
pop50f = 'run_00174_pop50/BOR/postProcessing/sampleDict/2000/'
pop50g = 'run_00373_pop50/BOR/postProcessing/sampleDict/2000/'
pop50h = 'run_00369_pop50/BOR/postProcessing/sampleDict/2000/'

pop100a = 'run_00185_pop100/BOR/postProcessing/sampleDict/2000/'
pop100b = 'run_00138_pop100/BOR/postProcessing/sampleDict/2000/'
pop100c = 'run_00131_pop100/BOR/postProcessing/sampleDict/2000/'
pop100d = 'run_00086_pop100/BOR/postProcessing/sampleDict/2000/'
pop100e = 'run_00196_pop100/BOR/postProcessing/sampleDict/2000/'
pop100f = 'run_00176_pop100/BOR/postProcessing/sampleDict/2000/'
pop100g = 'run_00168_pop100/BOR/postProcessing/sampleDict/2000/'

pop200a = 'run_00115_pop200/BOR/postProcessing/sampleDict/2000/'
pop200b = 'run_00276_pop200/BOR/postProcessing/sampleDict/2000/'
pop200c = 'run_00282_pop200/BOR/postProcessing/sampleDict/2000/'
pop200d = 'run_00022_pop200/BOR/postProcessing/sampleDict/2000/'
pop200e = 'run_00280_pop200/BOR/postProcessing/sampleDict/2000/'
pop200f = 'run_00251_pop200/BOR/postProcessing/sampleDict/2000/'
pop200g = 'run_00233_pop200/BOR/postProcessing/sampleDict/2000/'
pop200h = 'run_00086_pop200/BOR/postProcessing/sampleDict/2000/'
pop200i = 'run_00104_pop200/BOR/postProcessing/sampleDict/2000/'

run01256C4pop100 = 'run_01256-C4-pop100/BOR/postProcessing/sampleDict/2000/'  
run01842C4pop100 = 'run_01842-C4-pop100/BOR/postProcessing/sampleDict/2000/'                                        
run01515C4pop100 = 'run_01515-C4-pop100/BOR/postProcessing/sampleDict/2000/'                                       
run01335C4pop100 = 'run_01335-C4-pop100/BOR/postProcessing/sampleDict/2000/'                                        
run01482C4pop100 = 'run_01482-C4-pop100/BOR/postProcessing/sampleDict/2000/'                                       
run01053C4pop100 = 'run_01053-C4-pop100/BOR/postProcessing/sampleDict/2000/'                                       
run01408C4pop100 = 'run_01408-C4-pop100/BOR/postProcessing/sampleDict/2000/'                                       
run01477C4pop100 = 'run_01477-C4-pop100/BOR/postProcessing/sampleDict/2000/'                                       

BOW1  = 'run_00295_BOR-in-the-loop-BOW/BOR/postProcessing/sampleDict/2000/'
BOW2  = 'run_00389_BOR-in-the-loop-BOW/BOR/postProcessing/sampleDict/2000/'
BOW3  = 'run_00400_BOR-in-the-loop-BOW/BOR/postProcessing/sampleDict/2000/'
BOW4  = 'run_00386_BOR-in-the-loop-BOW/BOR/postProcessing/sampleDict/2000/'
BOW5  = 'run_00340_BOR-in-the-loop-BOW/BOR/postProcessing/sampleDict/2000/'
BOW6  = 'run_00273_BOR-in-the-loop-BOW/BOR/postProcessing/sampleDict/2000/'
BOW7  = 'run_00263_BOR-in-the-loop-BOW/BOR/postProcessing/sampleDict/2000/'
BOW8  = 'run_00202_BOR-in-the-loop-BOW/BOR/postProcessing/sampleDict/2000/'
BOW9  = 'run_00360_BOR-in-the-loop-BOW/BOR/postProcessing/sampleDict/2000/'
BOW10 = 'run_00165_BOR-in-the-loop-BOW/BOR/postProcessing/sampleDict/2000/'
BOW11 = 'run_00306_BOR-in-the-loop-BOW/BOR/postProcessing/sampleDict/2000/'
BOW12 = 'run_00308_BOR-in-the-loop-BOW/BOR/postProcessing/sampleDict/2000/'
BOW13 = 'run_00268_BOR-in-the-loop-BOW/BOR/postProcessing/sampleDict/2000/'
BOW14 = 'run_00387_BOR-in-the-loop-BOW/BOR/postProcessing/sampleDict/2000/'
BOW15 = 'run_00327_BOR-in-the-loop-BOW/BOR/postProcessing/sampleDict/2000/'
BOW16 = 'run_00022a_BOR-in-the-loop-BOW/BOR/postProcessing/sampleDict/2000/'
BOW17 = 'run_00022b_BOR-in-the-loop-BOW/BOR/postProcessing/sampleDict/2000/'

CENTER1  = 'run_00257_BOR-in-the-loop-CENTER/BOR/postProcessing/sampleDict/2000/'
CENTER2  = 'run_00212_BOR-in-the-loop-CENTER/BOR/postProcessing/sampleDict/2000/'
CENTER3  = 'run_00266_BOR-in-the-loop-CENTER/BOR/postProcessing/sampleDict/2000/'
CENTER4  = 'run_00078_BOR-in-the-loop-CENTER/BOR/postProcessing/sampleDict/2000/'
CENTER5  = 'run_00352_BOR-in-the-loop-CENTER/BOR/postProcessing/sampleDict/2000/'
CENTER6  = 'run_00393_BOR-in-the-loop-CENTER/BOR/postProcessing/sampleDict/2000/'
CENTER7  = 'run_00358_BOR-in-the-loop-CENTER/BOR/postProcessing/sampleDict/2000/'
CENTER8  = 'run_00341_BOR-in-the-loop-CENTER/BOR/postProcessing/sampleDict/2000/'
CENTER9  = 'run_00103_BOR-in-the-loop-CENTER/BOR/postProcessing/sampleDict/2000/'
CENTER10 = 'run_00335_BOR-in-the-loop-CENTER/BOR/postProcessing/sampleDict/2000/'
CENTER11 = 'run_00297_BOR-in-the-loop-CENTER/BOR/postProcessing/sampleDict/2000/'
CENTER12 = 'run_00032_BOR-in-the-loop-CENTER/BOR/postProcessing/sampleDict/2000/'
CENTER13 = 'run_00406_BOR-in-the-loop-CENTER/BOR/postProcessing/sampleDict/2000/'
CENTER14 = 'run_00405_BOR-in-the-loop-CENTER/BOR/postProcessing/sampleDict/2000/'
CENTER15 = 'run_00355_BOR-in-the-loop-CENTER/BOR/postProcessing/sampleDict/2000/'
CENTER16 = 'run_00036_BOR-in-the-loop-CENTER/BOR/postProcessing/sampleDict/2000/'
CENTER17 = 'run_00321_BOR-in-the-loop-CENTER/BOR/postProcessing/sampleDict/2000/'

STERN1  = 'run_00331_BOR-in-the-loop-STERN/BOR/postProcessing/sampleDict/2000/'
STERN2  = 'run_00286_BOR-in-the-loop-STERN/BOR/postProcessing/sampleDict/2000/'
STERN3  = 'run_00215_BOR-in-the-loop-STERN/BOR/postProcessing/sampleDict/2000/'
STERN4  = 'run_00302_BOR-in-the-loop-STERN/BOR/postProcessing/sampleDict/2000/'
STERN5  = 'run_00398_BOR-in-the-loop-STERN/BOR/postProcessing/sampleDict/2000/'
STERN6  = 'run_00401a_BOR-in-the-loop-STERN/BOR/postProcessing/sampleDict/2000/'
STERN7  = 'run_00337_BOR-in-the-loop-STERN/BOR/postProcessing/sampleDict/2000/'
STERN8  = 'run_00370_BOR-in-the-loop-STERN/BOR/postProcessing/sampleDict/2000/'
STERN9  = 'run_00298_BOR-in-the-loop-STERN/BOR/postProcessing/sampleDict/2000/'
STERN10 = 'run_00223_BOR-in-the-loop-STERN/BOR/postProcessing/sampleDict/2000/'
STERN11 = 'run_00338_BOR-in-the-loop-STERN/BOR/postProcessing/sampleDict/2000/'
STERN12 = 'run_00270_BOR-in-the-loop-STERN/BOR/postProcessing/sampleDict/2000/'
STERN13 = 'run_00308_BOR-in-the-loop-STERN/BOR/postProcessing/sampleDict/2000/'
STERN14 = 'run_00401b_BOR-in-the-loop-STERN/BOR/postProcessing/sampleDict/2000/'
STERN15 = 'run_00392_BOR-in-the-loop-STERN/BOR/postProcessing/sampleDict/2000/'
STERN16 = 'run_00390_BOR-in-the-loop-STERN/BOR/postProcessing/sampleDict/2000/'
STERN17 = 'run_00332_BOR-in-the-loop-STERN/BOR/postProcessing/sampleDict/2000/'

WAKE1  = 'run_00352_BOR-in-the-loop-WAKE/BOR/postProcessing/sampleDict/2000/'
WAKE2  = 'run_00365_BOR-in-the-loop-WAKE/BOR/postProcessing/sampleDict/2000/'
WAKE3  = 'run_00395_BOR-in-the-loop-WAKE/BOR/postProcessing/sampleDict/2000/'
WAKE4  = 'run_00337_BOR-in-the-loop-WAKE/BOR/postProcessing/sampleDict/2000/'
WAKE5  = 'run_00333_BOR-in-the-loop-WAKE/BOR/postProcessing/sampleDict/2000/'
WAKE6  = 'run_00396_BOR-in-the-loop-WAKE/BOR/postProcessing/sampleDict/2000/'
WAKE7  = 'run_00192_BOR-in-the-loop-WAKE/BOR/postProcessing/sampleDict/2000/'
WAKE8  = 'run_00234_BOR-in-the-loop-WAKE/BOR/postProcessing/sampleDict/2000/'
WAKE9  = 'run_00205_BOR-in-the-loop-WAKE/BOR/postProcessing/sampleDict/2000/'
WAKE10 = 'run_00251_BOR-in-the-loop-WAKE/BOR/postProcessing/sampleDict/2000/'
WAKE11 = 'run_00229_BOR-in-the-loop-WAKE/BOR/postProcessing/sampleDict/2000/'
WAKE12 = 'run_00346_BOR-in-the-loop-WAKE/BOR/postProcessing/sampleDict/2000/'
WAKE13 = 'run_00339_BOR-in-the-loop-WAKE/BOR/postProcessing/sampleDict/2000/'
WAKE14 = 'run_00390_BOR-in-the-loop-WAKE/BOR/postProcessing/sampleDict/2000/'

f24a = 'SST_MediumBody_with.inlet.dat.profile.interpolated_GEP_Tr.Rij_hat.squCyl.region_Ha5_newfrozenaijxRij_hat.eve/postProcessing/sampleDict/120000/'
f24b = 'SST_MediumBody_with.inlet.dat.profile.interpolated_GEP_Tr.Rij_hat.squCyl.region_Ha5_newfrozenaijxRij_hat.2.eve/postProcessing/sampleDict/120000/'
f24c = 'SST_MediumBody_with.inlet.dat.profile.interpolated_GEP_Tr.Rij_hat.squCyl.region_Ha5_newfrozenaijxRij_hat.3.eve/postProcessing/sampleDict/120000/'
f24d = 'SST_MediumBody_with.inlet.dat.profile.interpolated_GEP_Tr.Rij_hat.squCyl.region_Ha5_newfrozenaijxRij_hat.4.eve/postProcessing/sampleDict/120000/'
f24e = 'SST_MediumBody_with.inlet.dat.profile.interpolated_GEP_Tr.Rij_hat.squCyl.region_Ha5_newfrozenaijxRij_hat.5.eve/postProcessing/sampleDict/120000/'
f24f = 'SST_MediumBody_with.inlet.dat.profile.interpolated_GEP_Tr.aijx.squCyl.region_Ha5_newfrozenaijxRij_hat.2.eve/postProcessing/sampleDict/110000/'
f24g = 'SST_MediumBody_with.inlet.dat.profile.interpolated_GEP_Tr.aijx.squCyl.region_Ha5_newfrozenaijxRij_hat.3.eve/postProcessing/sampleDict/120000/'

f25a = 'SST_MediumBody_with.inlet.dat.profile.interpolated_GEP_Tr.aijx.RijHat.BFS.region.a5.newfrozenAppr_aijx_term_OFF_Rterm_corr_ON/postProcessing/sampleDict/150000/'
f25b = 'SST_MediumBody_with.inlet.dat.profile.interpolated_GEP_Tr.aijx.RijHat.BFS.region.a5.newfrozenAppr_aijx_term_ON_Rterm_corr_OFF/postProcessing/sampleDict/150000/'
#f25c = 'SST_MediumBody_with.inlet.dat.profile.interpolated_GEP_Tr.aijx.RijHat.BFS.region.a5.newfrozenAppr_aijx_term_ON_Rterm_corr_ON/postProcessing/sampleDict/150000/'
f25d = 'SST_MediumBody_with.inlet.dat.profile.interpolated_GEP_Tr.R.BFS.region.a5.k_froz_omega_froz_no-limiters_/postProcessing/sampleDict/131006/'

f26a = 'SST_MediumBody_with.inlet.dat.profile.interpolated_GEP_Tr.aijx.RijHat.squCyl.region_Ha5.newfrozenAppr.f.cube_aijx_term_OFF_Rterm_corr_ON/postProcessing/sampleDict/120000/'
f26b = 'SST_MediumBody_with.inlet.dat.profile.interpolated_GEP_Tr.aijx.RijHat.squCyl.region_Ha5.newfrozenAppr.f.cube_aijx_term_ON_Rterm_corr_OFF/postProcessing/sampleDict/120000/'
f26c = 'SST_MediumBody_with.inlet.dat.profile.interpolated_GEP_Tr.aijx.RijHat.squCyl.region_Ha5.newfrozenAppr.f.cube_aijx_term_OFF_Rterm_corr_ON/postProcessing/sampleDict/120000/'

f27 = 'SST_MediumBody_with.inlet.dat.profile.interpolated_GEP_Tr.aij.sqcyl.SNH2020-Reg-B/postProcessing/sampleDict/150000/'

f29 = 'SST_MediumBody_with.inlet.dat.profile.interpolated_g3_PysimpleFOAM8/postProcessing/sampleDict/30000/'

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
tail = '_R.xy'
tail2 = '_Rall.xy'
xR = "'-0.1' '0.0' '0.1' '0.2' '0.3' '0.4' '0.5' '0.6' '0.7' '0.8' '0.9' '1.0' '1.1' '4.17' '4.37' '4.57' '4.77' '4.97' '5.17' '5.37' '8.67' '8.92' '9.17' '9.42' '9.67' '9.92' '10.17' '10.42' '10.67' '10.92' '11.17' '11.42' '11.67' '11.92' '12.17' '12.9167' '13.4167' '13.9167' '14.4167' '14.9167' '15.4167' '15.9167' '16.4167'"



do for  [i=1:words(xR)] {   
	set title 'Shear stresses for MEDIUM body at x/R='.word(xR, i)
	print f10.head.word(xR,i).tail
	print f11.head.word(xR,i).tail
	print exp_head.word(exp_expr,i).exp_tail	
	print cfd1_head.word(cfd1_expr,i).cfd1_tail
	print cfd1_head.word(cfd1_expr,i).cfd2_tail
	plot \
	f10.head.word(xR,i).tail  		u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 104 title "OF7 GEP", \
	f11.head.word(xR,i).tail  		u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 105 title "OF8 GEP", \
	exp_head.word(exp_expr,i).exp_tail 	u 8:2 with l ls 100 title "Exp.", \
	cfd1_head.word(cfd1_expr,i).cfd1_tail	u 8:2 with l ls 112 title "CFD1", \
	cfd2_head.word(cfd2_expr,i).cfd2_tail	u 8:2 with l ls 113 title "CFD2"
}

plot 1/0 title "ANTRAKT"

do for  [i=1:words(xR)] {   
	set title 'Shear stresses for MEDIUM body at x/R='.word(xR, i)
	print f1.head.word(xR,i).tail
	print f9.head.word(xR,i).tail
	print exp_head.word(exp_expr,i).exp_tail	
	print cfd1_head.word(cfd1_expr,i).cfd1_tail
	print cfd1_head.word(cfd1_expr,i).cfd2_tail
	plot \
	f1.head.word(xR,i).tail  		u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 101 title "Baseline", \
	f9.head.word(xR,i).tail  		u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 102 title "Wallin", \
	exp_head.word(exp_expr,i).exp_tail 	u 8:2 with l ls 100 title "Exp.", \
	cfd1_head.word(cfd1_expr,i).cfd1_tail	u 8:2 with l ls 112 title "CFD1", \
	cfd2_head.word(cfd2_expr,i).cfd2_tail	u 8:2 with l ls 113 title "CFD2"
}

plot 1/0 title "ANTRAKT"

do for  [i=1:words(xR)] {
        set title 'Shear stresses for MEDIUM body at x/R='.word(xR, i)
        print f1.head.word(xR,i).tail
        print f13.head.word(xR,i).tail2
        print f14.head.word(xR,i).tail2
        print f15.head.word(xR,i).tail2
        print f16.head.word(xR,i).tail2
        print exp_head.word(exp_expr,i).exp_tail
        print cfd1_head.word(cfd1_expr,i).cfd1_tail
        print cfd1_head.word(cfd1_expr,i).cfd2_tail
        plot \
        f1.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 101 title "Baseline", \
        f13.head.word(xR,i).tail2               u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 102 title "FlatPlateFlow", \
        f14.head.word(xR,i).tail2               u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 103 title "HumpFlow", \
        f15.head.word(xR,i).tail2               u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 104 title "ChannelFlow", \
        f16.head.word(xR,i).tail2               u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 105 title "JetFlow", \
        exp_head.word(exp_expr,i).exp_tail      u 8:2 with l ls 100 title "Exp.", \
        cfd1_head.word(cfd1_expr,i).cfd1_tail   u 8:2 with l ls 112 title "CFD1", \
        cfd2_head.word(cfd2_expr,i).cfd2_tail   u 8:2 with l ls 113 title "CFD2"
}

plot 1/0 title "ANTRAKT"

do for  [i=1:words(xR)] {
        set title 'Shear stresses for MEDIUM body at x/R='.word(xR, i)
        print f1.head.word(xR,i).tail
	print f17.head.word(xR,i).tail2
        print f18.head.word(xR,i).tail2
        print f19.head.word(xR,i).tail2
        print f20.head.word(xR,i).tail2
        print f21.head.word(xR,i).tail2
        print f22.head.word(xR,i).tail2
        print exp_head.word(exp_expr,i).exp_tail
        print cfd1_head.word(cfd1_expr,i).cfd1_tail
        print cfd1_head.word(cfd1_expr,i).cfd2_tail
        plot \
        f1.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 101 title "Baseline", \
        f17.head.word(xR,i).tail2               u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 102 title "PH-EVE-MO-57 ON ON", \
        f18.head.word(xR,i).tail2               u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 103 title "PH-EVE-MO-57 ON OFF", \
        f19.head.word(xR,i).tail2               u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 104 title "PH-EVE-MO-57 OFF ON", \
        f20.head.word(xR,i).tail2               u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 105 title "PH-EVE-MO-11 ON ON", \
        f21.head.word(xR,i).tail2               u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 106 title "PH-EVE-MO-11 ON OFF", \
        f22.head.word(xR,i).tail2               u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 107 title "PH-EVE-MO-11 OFF ON", \
        exp_head.word(exp_expr,i).exp_tail      u 8:2 with l ls 100 title "Exp.", \
        cfd1_head.word(cfd1_expr,i).cfd1_tail   u 8:2 with l ls 112 title "CFD1", \
        cfd2_head.word(cfd2_expr,i).cfd2_tail   u 8:2 with l ls 113 title "CFD2"
}

plot 1/0 title "ANTRAKT"

do for  [i=1:words(xR)] {
        set title 'Shear stresses for MEDIUM body at x/R='.word(xR, i)
        print f1.head.word(xR,i).tail
        print f5a.head.word(xR,i).tail
        print f5b.head.word(xR,i).tail
        print f5c.head.word(xR,i).tail2
        print exp_head.word(exp_expr,i).exp_tail
        print cfd1_head.word(cfd1_expr,i).cfd1_tail
        print cfd1_head.word(cfd1_expr,i).cfd2_tail
        plot \
        f1.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 101 title "Baseline", \
        f5a.head.word(xR,i).tail                u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 102 title "GEP Chitrarth Lav R 179000", \
        f5b.head.word(xR,i).tail                u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 103 title "GEP Chitrarth Lav Rall 179000", \
        f5c.head.word(xR,i).tail2               u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 104 title "GEP Chitrarth Lav Rall 278000", \
        exp_head.word(exp_expr,i).exp_tail      u 8:2 with l ls 100 title "Exp.", \
        cfd1_head.word(cfd1_expr,i).cfd1_tail   u 8:2 with l ls 112 title "CFD1", \
        cfd2_head.word(cfd2_expr,i).cfd2_tail   u 8:2 with l ls 113 title "CFD2"
}

plot 1/0 title "ANTRAKT"

do for  [i=1:words(xR)] {
        set title 'Shear stresses for MEDIUM body at x/R='.word(xR, i)
        print f1.head.word(xR,i).tail
        print f2a.head.word(xR,i).tail2
        print f2b.head.word(xR,i).tail2
        print f2c.head.word(xR,i).tail2
        print exp_head.word(exp_expr,i).exp_tail
        print cfd1_head.word(cfd1_expr,i).cfd1_tail
        print cfd1_head.word(cfd1_expr,i).cfd2_tail
        plot \
        f1.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 101 title "Baseline", \
        f2a.head.word(xR,i).tail2               u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 102 title "GEP squCyl ON OFF", \
        f2b.head.word(xR,i).tail2               u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 103 title "GEP squCyl OFF ON", \
        f2c.head.word(xR,i).tail2               u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 104 title "GEP squCyl OFF ON", \
        exp_head.word(exp_expr,i).exp_tail      u 8:2 with l ls 100 title "Exp.", \
        cfd1_head.word(cfd1_expr,i).cfd1_tail   u 8:2 with l ls 112 title "CFD1", \
        cfd2_head.word(cfd2_expr,i).cfd2_tail   u 8:2 with l ls 113 title "CFD2"
}

plot 1/0 title "ANTRAKT"

do for  [i=1:words(xR)] {
        set title 'Shear stresses for MEDIUM body at x/R='.word(xR, i)
        print f1.head.word(xR,i).tail
        print f23.head.word(xR,i).tail
        print f23b.head.word(xR,i).tail
        print f23c.head.word(xR,i).tail
        print exp_head.word(exp_expr,i).exp_tail
        print cfd1_head.word(cfd1_expr,i).cfd1_tail
        print cfd1_head.word(cfd1_expr,i).cfd2_tail
        plot \
        f1.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 101 title "Baseline", \
        f23.head.word(xR,i).tail                u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 102 title "run-00178 in the loop", \
        f23b.head.word(xR,i).tail               u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 103 title "run-00178b in the loop only U WAKE", \
        f23c.head.word(xR,i).tail               u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 104 title "run-00611 in the loop only U STERN", \
        exp_head.word(exp_expr,i).exp_tail      u 8:2 with l ls 100 title "Exp.", \
        cfd1_head.word(cfd1_expr,i).cfd1_tail   u 8:2 with l ls 112 title "CFD1", \
        cfd2_head.word(cfd2_expr,i).cfd2_tail   u 8:2 with l ls 113 title "CFD2"
}

plot 1/0 title "ANTRAKT"

do for  [i=1:words(xR)] {
        set title 'Shear stresses for MEDIUM body at x/R='.word(xR, i)
        print f1.head.word(xR,i).tail
        print i1.head.word(xR,i).tail
        print i2.head.word(xR,i).tail
        print exp_head.word(exp_expr,i).exp_tail
        print cfd1_head.word(cfd1_expr,i).cfd1_tail
        print cfd1_head.word(cfd1_expr,i).cfd2_tail
        plot \
        f1.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 101 title "Baseline", \
        i1.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 102 title "run-00721 in the loop U+Rwall BOW ADDED FEATURES Qs", \
        i2.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 103 title "run-00270 in the loop U+Rwall BOW ADDED FEATURES Qs", \
        exp_head.word(exp_expr,i).exp_tail      u 8:2 with l ls 100 title "Exp.", \
        cfd2_head.word(cfd2_expr,i).cfd2_tail   u 8:2 with l ls 112 title "CFD2"
}

plot 1/0 title "ANTRAKT"

do for  [i=1:words(xR)] {
        set title 'Shear stresses for MEDIUM body at x/R='.word(xR, i)
        print f1.head.word(xR,i).tail
        print h1.head.word(xR,i).tail
        print h2.head.word(xR,i).tail
        print h3.head.word(xR,i).tail
        print h4.head.word(xR,i).tail
        print exp_head.word(exp_expr,i).exp_tail
        print cfd1_head.word(cfd1_expr,i).cfd1_tail
        print cfd1_head.word(cfd1_expr,i).cfd2_tail
        plot \
        f1.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 101 title "Baseline", \
        h1.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 102 title "run-00120 in the loop U+Rwall BOW NEW", \
        h2.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 103 title "run-00186 in the loop U+Rwall BOW ADDED FEATURES", \
        h3.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 104 title "run-00939 in the loop U+Rwall BOW ADDED FEATURES", \
        h4.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 105 title "run-00915 in the loop U+Rwall BOW ADDED FEATURES", \
        exp_head.word(exp_expr,i).exp_tail      u 8:2 with l ls 100 title "Exp.", \
        cfd2_head.word(cfd2_expr,i).cfd2_tail   u 8:2 with l ls 112 title "CFD2"
}

plot 1/0 title "ANTRAKT"

do for  [i=1:words(xR)] {
        set title 'Shear stresses for MEDIUM body at x/R='.word(xR, i)
        print f1.head.word(xR,i).tail
        print g1.head.word(xR,i).tail
        print g2.head.word(xR,i).tail
        print g3.head.word(xR,i).tail
        print g4.head.word(xR,i).tail
        print h1.head.word(xR,i).tail
        print h2.head.word(xR,i).tail
        print h3.head.word(xR,i).tail
        print h4.head.word(xR,i).tail
        print exp_head.word(exp_expr,i).exp_tail
        print cfd1_head.word(cfd1_expr,i).cfd1_tail
        print cfd1_head.word(cfd1_expr,i).cfd2_tail
        plot \
        f1.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 101 title "Baseline", \
        g1.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 102 title "run-00218 in the loop U+Rwall BOW NEW", \
        g2.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 103 title "run-00360 in the loop U+Rwall CENTER NEW", \
        g3.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 105 title "run-00611 in the loop U+Rwall STERN NEW", \
        g4.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 107 title "run-00178 in the loop U+Rwall WAKE NEw", \
        h1.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 108 title "run-00120 in the loop U+Rwall BOW NEW", \
        h2.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 109 title "run-00186 in the loop U+Rwall BOW ADDED FEATURES", \
        h3.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 110 title "run-00939 in the loop U+Rwall BOW ADDED FEATURES", \
        h4.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 111 title "run-00915 in the loop U+Rwall BOW ADDED FEATURES", \
        exp_head.word(exp_expr,i).exp_tail      u 8:2 with l ls 100 title "Exp.", \
        cfd2_head.word(cfd2_expr,i).cfd2_tail   u 8:2 with l ls 112 title "CFD2"
}

plot 1/0 title "ANTRAKT"

do for  [i=1:words(xR)] {
        set title 'Shear stresses for MEDIUM body at x/R='.word(xR, i)
        print f1.head.word(xR,i).tail
        print f24a.head.word(xR,i).tail2
        print f24b.head.word(xR,i).tail2
        print f24c.head.word(xR,i).tail2
        print f24d.head.word(xR,i).tail2
        print f24e.head.word(xR,i).tail2
        print f24f.head.word(xR,i).tail2
        print f24g.head.word(xR,i).tail2
        print exp_head.word(exp_expr,i).exp_tail
        print cfd1_head.word(cfd1_expr,i).cfd1_tail
        print cfd1_head.word(cfd1_expr,i).cfd2_tail
        plot \
        f1.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 101 title "Baseline", \
        f24a.head.word(xR,i).tail2              u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 102 title "squCyl Ha5 Rij 1", \
        f24b.head.word(xR,i).tail2              u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 103 title "squCyl Ha5 Rij 2", \
        f24c.head.word(xR,i).tail2              u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 104 title "squCyl Ha5 Rij 3", \
        f24d.head.word(xR,i).tail2              u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 105 title "squCyl Ha5 Rij 4", \
        f24e.head.word(xR,i).tail2              u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 106 title "squCyl Ha5 Rij 5", \
        f24f.head.word(xR,i).tail2              u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 107 title "squCyl Ha5 aij 2", \
        f24g.head.word(xR,i).tail2              u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 108 title "squCyl Ha5 aij 3", \
        exp_head.word(exp_expr,i).exp_tail      u 8:2 with l ls 100 title "Exp.", \
        cfd1_head.word(cfd1_expr,i).cfd1_tail   u 8:2 with l ls 112 title "CFD1", \
        cfd2_head.word(cfd2_expr,i).cfd2_tail   u 8:2 with l ls 113 title "CFD2"
}

plot 1/0 title "ANTRAKT"

do for  [i=1:words(xR)] {
        set title 'Shear stresses for MEDIUM body at x/R='.word(xR, i)
        print f1.head.word(xR,i).tail
        print f25a.head.word(xR,i).tail2
        print f25b.head.word(xR,i).tail2
        print f25d.head.word(xR,i).tail2
        print exp_head.word(exp_expr,i).exp_tail
        print cfd1_head.word(cfd1_expr,i).cfd1_tail
        print cfd1_head.word(cfd1_expr,i).cfd2_tail
        plot \
        f1.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 101 title "Baseline", \
        f25a.head.word(xR,i).tail2              u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 102 title "BFS OFF ON aij", \
        f25b.head.word(xR,i).tail2              u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 103 title "BFS ON OFF aij", \
        f25d.head.word(xR,i).tail2              u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 104 title "BFS Rij", \
        exp_head.word(exp_expr,i).exp_tail      u 8:2 with l ls 100 title "Exp.", \
        cfd1_head.word(cfd1_expr,i).cfd1_tail   u 8:2 with l ls 112 title "CFD1", \
        cfd2_head.word(cfd2_expr,i).cfd2_tail   u 8:2 with l ls 113 title "CFD2"
}

plot 1/0 title "ANTRAKT"

do for  [i=1:words(xR)] {
        set title 'Shear stresses for MEDIUM body at x/R='.word(xR, i)
        print f1.head.word(xR,i).tail
        print f26a.head.word(xR,i).tail2
        print f26b.head.word(xR,i).tail2
        print f26c.head.word(xR,i).tail2
        print exp_head.word(exp_expr,i).exp_tail
        print cfd1_head.word(cfd1_expr,i).cfd1_tail
        print cfd1_head.word(cfd1_expr,i).cfd2_tail
        plot \
        f1.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 101 title "Baseline", \
        f26a.head.word(xR,i).tail2              u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 102 title "cube aij OFF Rij ON", \
        f26b.head.word(xR,i).tail2              u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 103 title "cube aij ON Rij OFF", \
        f26c.head.word(xR,i).tail2              u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 104 title "cube aij ON Rij ON", \
        exp_head.word(exp_expr,i).exp_tail      u 8:2 with l ls 100 title "Exp.", \
        cfd1_head.word(cfd1_expr,i).cfd1_tail   u 8:2 with l ls 112 title "CFD1", \
        cfd2_head.word(cfd2_expr,i).cfd2_tail   u 8:2 with l ls 113 title "CFD2"
}

plot 1/0 title "ANTRAKT"

do for  [i=1:words(xR)] {
        set title 'Shear stresses for MEDIUM body at x/R='.word(xR, i)
        print f1.head.word(xR,i).tail
        print f29.head.word(xR,i).tail2
        print exp_head.word(exp_expr,i).exp_tail
        print cfd1_head.word(cfd1_expr,i).cfd1_tail
        print cfd1_head.word(cfd1_expr,i).cfd2_tail
        plot \
        f1.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 101 title "Baseline", \
        f29.head.word(xR,i).tail2               u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 104 title "ML pipeline", \
        exp_head.word(exp_expr,i).exp_tail      u 8:2 with l ls 100 title "Exp.", \
        cfd1_head.word(cfd1_expr,i).cfd1_tail   u 8:2 with l ls 112 title "CFD1", \
        cfd2_head.word(cfd2_expr,i).cfd2_tail   u 8:2 with l ls 113 title "CFD2"
}

plot 1/0 title "ANTRAKT"

###############
# Best models #
###############
do for  [i=1:words(xR)] {
	set title 'Shear stresses for MEDIUM body at x/R='.word(xR, i)
	print word(xR,i)
	if (word(xR,i)==-0.1) {
	 xmax = 1.2;
	 xmin = 0.75;
	 ymax = 1;
	 ymin = 1;
	 set yrange [0:1] reverse;
	 set xrange [xmin:xmax];
	                  set yrange [0:1] reverse;
	                  set xrange [*:*];
	} else {
	   if (word(xR,i)==0.0) {
	    xmax = 1.2;
	    xmin = 0.75;
	    ymax = 1;
	    ymin = 0.15;
	    set yrange [ymin:ymax] reverse;
	    set xrange [xmin:xmax];
	                  set yrange [0:1] reverse;
	                  set xrange [*:*];
	 } else {
	    if (word(xR,i)==0.1) {
	     xmax = 1.2;
	     xmin = 0.78;
	     ymax = 1;
	     ymin = 0.19;
	     set yrange [ymin:ymax] reverse;
	     set xrange [xmin:xmax];
	                  set yrange [0:1] reverse;
	                  set xrange [*:*];
	  } else {
	     if (word(xR,i)==0.2) {
	      xmax = 1.2;
	      xmin = 0.8;
	      ymax = 1;
	      ymin = 0.21;
	      set yrange [ymin:ymax] reverse;
	      set xrange [xmin:xmax];
	                  set yrange [0:1] reverse;
	                  set xrange [*:*];
	   } else {
	      if (word(xR,i)==0.3) {
	       xmax = 1.3;
	       xmin = 0.8;
	       ymax = 1;
	       ymin = 0.225;
	       set yrange [ymin:ymax] reverse;
	       set xrange [xmin:xmax];
	                  set yrange [0:1] reverse;
	                  set xrange [*:*];
	    } else {
	       if (word(xR,i)==0.4) {
	        xmax = 1.3;
	        xmin = 0.8;
	        ymax = 1;
	        ymin = 0.26;
	        set yrange [ymin:ymax] reverse;
	        set xrange [xmin:xmax];
	                  set yrange [0:1] reverse;
	                  set xrange [*:*];
	     } else {
	        if (word(xR,i)==0.5) {
	         xmax = 1.3;
	         xmin = 0.85;
	         ymax = 1;
	         ymin = 0.295;
	         set yrange [ymin:ymax] reverse;
	         set xrange [xmin:xmax];
	                  set yrange [0:1] reverse;
	                  set xrange [*:*];
	      } else {
	         if (word(xR,i)==0.6) {
	          xmax = 1.3;
	          xmin = 0.85;
	          ymax = 1;
	          ymin = 0.31;
	          set yrange [ymin:ymax] reverse;
	          set xrange [xmin:xmax];
	                  set yrange [0:1] reverse;
	                  set xrange [*:*];
	       } else {
	          if (word(xR,i)==0.7) {
	           xmax = 1.35;
	           xmin = 0.9;
	           ymax = 1;
	           ymin = 0.35;
	           set yrange [ymin:ymax] reverse;
	           set xrange [xmin:xmax];
	                  set yrange [0:1] reverse;
	                  set xrange [*:*];
	        } else {
	           if (word(xR,i)==0.8) {
	            xmax = 1.35;
	            xmin = 0.9;
	            ymax = 1;
	            ymin = 0.365;
	            set yrange [ymin:ymax] reverse;
	            set xrange [xmin:xmax];
	                  set yrange [0:1] reverse;
	                  set xrange [*:*];
	         } else {
	            if (word(xR,i)==0.9) {
	             xmax = 1.4;
	             xmin = 0.95;
	             ymax = 1;
	             ymin = 0.375;
	             set yrange [ymin:ymax] reverse;
	             set xrange [xmin:xmax];
	                  set yrange [0:1] reverse;
	                  set xrange [*:*];
	          } else {
	             if (word(xR,i)==1.0) {
	              xmax = 1.4;
	              xmin = 0.95;
	              ymax = 1;
	              ymin = 0.385;
	              set yrange [ymin:ymax] reverse;
	              set xrange [xmin:xmax];
	                  set yrange [0:1] reverse;
	                  set xrange [*:*];
	           } else {
	              if (word(xR,i)==1.1) {
	               xmax = 1.4;
	               xmin = 0.95;
	               ymax = 1;
	               ymin = 0.395;
	               set yrange [ymin:ymax] reverse;
	               set xrange [xmin:xmax];
	                  set yrange [0:1] reverse;
	                  set xrange [*:*];
	            } else {
	              if (word(xR,i)==4.17 || word(xR,i)==4.37 || word(xR,i)==4.57 || word(xR,i)==4.77 || word(xR,i)==4.97 || word(xR,i)==5.17 || word(xR,i)==5.37) {
	               xmax = 1.5;
	               xmin = 0.95;
	               ymax = 1;
	               ymin = 0.5;
	               set yrange [ymin:ymax] reverse;
	               set xrange [xmin:xmax];
	                  set yrange [0:1] reverse;
	                  set xrange [*:*];
	            } else {
	               if (word(xR,i)==8.67 || word(xR,i)==8.92 || word(xR,i)==9.17 || word(xR,i)==9.42 || word(xR,i)==9.67 || word(xR,i)==9.92 || word(xR,i)==10.17 || word(xR,i)==10.42 || word(xR,i)==10.67 || word(xR,i)==10.92 || word(xR,i)==11.17) {
	                xmax = 1.5;
	                xmin = 1.0;
	                ymax = 1;
	                ymin = 0.5;
	                set yrange [ymin:ymax] reverse;
	                set xrange [xmin:xmax];
	                  set yrange [0:1] reverse;
	                  set xrange [*:*];
	             } else {
	                if (word(xR,i)==11.42 || word(xR,i)==11.67) {
	                 xmax = 1.4;
	                 xmin = 1.0;
	                 ymax = 1;
	                 ymin = 0.5;
	                 set yrange [ymin:ymax] reverse;
	                 set xrange [xmin:xmax];
	                  set yrange [0:1] reverse;
	                  set xrange [*:*];
	              } else {
	                 if (word(xR,i)==11.92 || word(xR,i)==12.17) {
			  set key samplen 3 spacing .95 font ",8"
			  set key at graph 0.6, 0.9
	                  xmax = 1.35;
	                  xmin = 1.0;
	                  ymax = 1;
	                  ymin = 0.5;
	                  set yrange [ymin:ymax] reverse;
	                  set xrange [xmin:xmax];
	                  set yrange [0:1] reverse;
	                  set xrange [*:*];
	               } else {
			  set key samplen 3 spacing .95 font ",8"
			  set key at graph 0.01, 0.85
	                  set yrange [0:1] reverse;
	                  set xrange [*:*];
		      }
		     }
		    }
		   }
		   }
		  }
		 }
		}
	       }
	     }
	    }
	   }
	  }
         }
        }
       }
       }

        print f1.head.word(xR,i).tail
        print f2a.head.word(xR,i).tail2
        print f5c.head.word(xR,i).tail2
        print exp_head.word(exp_expr,i).exp_tail
        print cfd1_head.word(cfd1_expr,i).cfd1_tail
        plot \
        f1.head.word(xR,i).tail                  u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 101 title "Baseline", \
        f2a.head.word(xR,i).tail2                u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 102 title "GEP squCyl aij ON Rij OFF", \
        f5c.head.word(xR,i).tail2                u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 104 title "GEP Lav's model", \
        f16.head.word(xR,i).tail2                u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 105 title "JetFlow", \
        f21.head.word(xR,i).tail2                u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 103 title "PH-EVE-MO-11 aij ON Rij OFF", \
        f25d.head.word(xR,i).tail2               u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 107 title "BFS Rij", \
        f26b.head.word(xR,i).tail2               u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 114 title "cube aij ON Rij OFF", \
        f27.head.word(xR,i).tail2                u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 115 title "SNH2020-Reg-B", \
        exp_head.word(exp_expr,i).exp_tail       u 8:2 with l ls 100 title "Exp.", \
        cfd1_head.word(cfd1_expr,i).cfd1_tail    u 8:2 with l ls 112 title "CFD1", \
}

# Best models for mean axial velocity`
#        f16.head.word(xR,i).tail              u ($2/2.2):1 with l ls 102 title "JetFlow", \
#        f21.head.word(xR,i).tail              u ($2/2.2):1 with l ls 103 title "PH-EVE-MO-11 aij ON Rij OFF", \
#        f25d.head.word(xR,i).tail             u ($2/2.2):1 with l ls 104 title "BFS Rij", \
#        f26b.head.word(xR,i).tail             u ($2/2.2):1 with l ls 114 title "cube aij ON Rij OFF", \
#        f27.head.word(xR,i).tail              u ($2/2.2):1 with l ls 115 title "SNH2020-Reg-B", \
}


plot 1/0 title "EMPTY FIGURE"
plot 1/0 title "ANTRAKT"

set ylabel 'y/R'
set xlabel  "U_x U_r / U^2_{/Symbol t}" #'U_{/Symbol T}^2' # 'U_xU_r/U_{tau}^2'
set yrange [0:1] reverse
set xrange [*:*]
set grid
do for  [i=1:words(xR)] {
        set title 'Shear stresses for MEDIUM body at x/R='.word(xR, i)
        print f1.head.word(xR,i).tail
        print exp_head.word(exp_expr,i).exp_tail
        print cfd1_head.word(cfd1_expr,i).cfd1_tail
        print cfd1_head.word(cfd1_expr,i).cfd2_tail
        plot \
        f1.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 101 title "Baseline", \
        z1.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 102 title "run01052-1000-1000", \
        z3.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 104 title "run00771-1000-1000", \
        z5.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 106 title "run00276-1000-1000", \
        z6.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 107 title "run01003-1000-1000", \
        exp_head.word(exp_expr,i).exp_tail      u 8:2 with l ls 100 title "Exp.", \
        cfd2_head.word(cfd2_expr,i).cfd2_tail   u 8:2 with l ls 112 title "CFD2"
}
        #z2.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 103 title "run00624-1000-1000", \
        #z4.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 105 title "run00836-1000-1000", \
        #z7.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 108 title "run00784-1000-1000", \
        #z8.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 109 title "run01002-1000-1000", \

plot 1/0 title "ANTRAKT"

do for  [i=1:words(xR)] {
        set title 'Shear stresses for MEDIUM body at x/R='.word(xR, i)
        plot \
        f1.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 101 title "Baseline", \
        w1.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 102 title "run00358-RUint", \
        w2.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 103 title "run00576-RUint", \
        w3.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 104 title "run00602-RUint", \
        w4.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 105 title "run00276-RUint", \
        w5.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 106 title "run00146-RUint", \
        w6.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 107 title "run00139-RUint", \
        exp_head.word(exp_expr,i).exp_tail      u 8:2 with l ls 100 title "Exp.", \
        cfd2_head.word(cfd2_expr,i).cfd2_tail   u 8:2 with l ls 112 title "CFD2"
}

plot 1/0 title "ANTRAKT"

do for  [i=1:words(xR)] {
        set title 'Shear stresses for MEDIUM body at x/R='.word(xR, i)
        plot \
        f1.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 101 title "Baseline", \
        x1.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 102 title "run00358-URwallint", \
        x2.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 103 title "run00477-URwallintr", \
        x3.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 104 title "run00097-URwallintr", \
        x6.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 107 title "run00440-URwallintr", \
        x7.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 108 title "run00103-1UCOST", \
        zzz.head.word(xR,i).tail                u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 109 title "run00120-URwallintr", \
        exp_head.word(exp_expr,i).exp_tail      u 8:2 with l ls 100 title "Exp.", \
        cfd2_head.word(cfd2_expr,i).cfd2_tail   u 8:2 with l ls 112 title "CFD2"
}

        #x4.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 105 title "run00087-URwallintr", \
        #x5.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 106 title "run00403-URwallintr", \

plot 1/0 title "ANTRAKT"

do for  [i=1:words(xR)] {
        set title 'Shear stresses for MEDIUM body at x/R='.word(xR, i)
        plot \
        f1.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 101 title "Baseline", \
        pop50e.head.word(xR,i).tail             u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 106 title "pop50e", \
        pop50f.head.word(xR,i).tail             u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 107 title "pop50f", \
        pop50g.head.word(xR,i).tail             u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 108 title "pop50g", \
        pop50h.head.word(xR,i).tail             u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 109 title "pop50h", \
        exp_head.word(exp_expr,i).exp_tail      u 8:2 with l ls 100 title "Exp.", \
        cfd2_head.word(cfd2_expr,i).cfd2_tail   u 8:2 with l ls 112 title "CFD2"
}

plot 1/0 title "ANTRAKT"

do for  [i=1:words(xR)] {
        set title 'Shear stresses for MEDIUM body at x/R='.word(xR, i)
        plot \
        f1.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 101 title "Baseline", \
        pop100a.head.word(xR,i).tail            u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 102 title "pop100a", \
        pop100b.head.word(xR,i).tail            u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 103 title "pop100b", \
        pop100c.head.word(xR,i).tail            u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 104 title "pop100c", \
        pop100d.head.word(xR,i).tail            u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 105 title "pop100d", \
        pop100e.head.word(xR,i).tail            u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 106 title "pop100e", \
        pop100f.head.word(xR,i).tail            u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 107 title "pop100f", \
        pop100g.head.word(xR,i).tail            u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 108 title "pop100g", \
        exp_head.word(exp_expr,i).exp_tail      u 8:2 with l ls 100 title "Exp.", \
        cfd2_head.word(cfd2_expr,i).cfd2_tail   u 8:2 with l ls 112 title "CFD2"
}

plot 1/0 title "ANTRAKT"

do for  [i=1:words(xR)] {
        set title 'Shear stresses for MEDIUM body at x/R='.word(xR, i)
        plot \
        f1.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 101 title "Baseline", \
        pop200a.head.word(xR,i).tail            u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 102 title "pop200a", \
        pop200b.head.word(xR,i).tail            u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 103 title "pop200b", \
        pop200c.head.word(xR,i).tail            u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 104 title "pop200c", \
        pop200d.head.word(xR,i).tail            u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 105 title "pop200d", \
        pop200e.head.word(xR,i).tail            u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 106 title "pop200e", \
        pop200f.head.word(xR,i).tail            u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 107 title "pop200f", \
        pop200g.head.word(xR,i).tail            u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 108 title "pop200g", \
        pop200h.head.word(xR,i).tail            u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 109 title "pop200h", \
        pop200i.head.word(xR,i).tail            u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 110 title "pop200i", \
        exp_head.word(exp_expr,i).exp_tail      u 8:2 with l ls 100 title "Exp.", \
        cfd2_head.word(cfd2_expr,i).cfd2_tail   u 8:2 with l ls 112 title "CFD2"
}

plot 1/0 title "ANTRAKT"

do for  [i=1:words(xR)] {
        set title 'Shear stresses for MEDIUM body at x/R='.word(xR, i)
        plot \
        f1.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 101 title "Baseline", \
        run01256C4pop100.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 102 title "run01256C4pop100", \
        run01842C4pop100.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 103 title "run01842C4pop100", \
        run01515C4pop100.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 104 title "run01515C4pop100", \
        run01335C4pop100.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 105 title "run01335C4pop100", \
        run01482C4pop100.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 106 title "run01482C4pop100", \
        run01053C4pop100.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 107 title "run01053C4pop100", \
        run01408C4pop100.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 108 title "run01408C4pop100", \
        run01477C4pop100.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 109 title "run01477C4pop100", \
        exp_head.word(exp_expr,i).exp_tail      u 8:2 with l ls 100 title "Exp.", \
        cfd2_head.word(cfd2_expr,i).cfd2_tail   u 8:2 with l ls 112 title "CFD2"
}

plot 1/0 title "ANTRAKT"

do for  [i=1:words(xR)] {
        set title 'Shear stresses for MEDIUM body at x/R='.word(xR, i)
        plot \
        f1.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 101 title "Baseline", \
        BOW1.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 102 title "bow1", \
        BOW2.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 103 title "bow2", \
        BOW3.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 104 title "bow3", \
        BOW4.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 105 title "bow4", \
        BOW6.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 107 title "bow6", \
        BOW7.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 108 title "bow7", \
        BOW8.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 109 title "bow8", \
        BOW9.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 110 title "bow9", \
        BOW10.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 111 title "bow10", \
        BOW11.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 113 title "bow11", \
        BOW13.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 115 title "bow13", \
        BOW14.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 116 title "bow14", \
        BOW17.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 119 title "bow17", \
        exp_head.word(exp_expr,i).exp_tail      u 8:2 with l ls 100 title "Exp.", \
        cfd2_head.word(cfd2_expr,i).cfd2_tail   u 8:2 with l ls 112 title "CFD2"
}


        #BOW5.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 106 title "bow5", \
        #BOW12.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 114 title "bow12", \
        #BOW15.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 117 title "bow15", \
        #BOW16.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 118 title "bow16", \

plot 1/0 title "ANTRAKT"

do for  [i=1:words(xR)] {
        set title 'Shear stresses for MEDIUM body at x/R='.word(xR, i)
        plot \
        f1.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 101 title "Baseline", \
        WAKE1.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 102 title "wake1", \
        WAKE2.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 103 title "wake2", \
        WAKE3.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 104 title "wake3", \
        WAKE4.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 105 title "wake4", \
        WAKE5.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 105 title "wake5", \
        WAKE6.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 107 title "wake6", \
        WAKE7.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 108 title "wake7", \
        WAKE8.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 109 title "wake8", \
        WAKE9.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 110 title "wake9", \
        WAKE10.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 111 title "wake10", \
        WAKE11.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 113 title "wake11", \
        WAKE12.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 113 title "wake12", \
        WAKE13.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 115 title "wake13", \
        WAKE14.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 116 title "wake14", \
        exp_head.word(exp_expr,i).exp_tail      u 8:2 with l ls 100 title "Exp.", \
        cfd2_head.word(cfd2_expr,i).cfd2_tail   u 8:2 with l ls 112 title "CFD2"
}

plot 1/0 title "ANTRAKT"

do for  [i=1:words(xR)] {
        set title 'Shear stresses for MEDIUM body at x/R='.word(xR, i)
        plot \
        f1.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 101 title "Baseline", \
        CENTER3.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 104 title "center3", \
        CENTER5.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 105 title "center5", \
        CENTER6.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 107 title "center6", \
        CENTER7.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 108 title "center7", \
        CENTER8.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 109 title "center8", \
        CENTER9.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 110 title "center9", \
        CENTER10.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 111 title "center10", \
        CENTER11.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 113 title "center11", \
        CENTER13.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 115 title "center13", \
        exp_head.word(exp_expr,i).exp_tail      u 8:2 with l ls 100 title "Exp.", \
        cfd2_head.word(cfd2_expr,i).cfd2_tail   u 8:2 with l ls 112 title "CFD2"
}

plot 1/0 title "ANTRAKT"

do for  [i=1:words(xR)] {
        set title 'Shear stresses for MEDIUM body at x/R='.word(xR, i)
        plot \
        f1.head.word(xR,i).tail                 u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 101 title "Baseline", \
        STERN2.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 103 title "stern2", \
        STERN6.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 105 title "stern6", \
        STERN7.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 107 title "stern7", \
        STERN10.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 109 title "stern10", \
        STERN15.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 111 title "stern15", \
        STERN16.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 113 title "stern16", \
        STERN17.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 115 title "stern17", \
        exp_head.word(exp_expr,i).exp_tail      u 8:2 with l ls 100 title "Exp.", \
        cfd2_head.word(cfd2_expr,i).cfd2_tail   u 8:2 with l ls 112 title "CFD2"
}
        #STERN4.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 105 title "stern4", \
        #STERN5.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 105 title "stern5", \
        #STERN3.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 104 title "stern3", \
        #STERN8.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 109 title "stern8", \
        #STERN9.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 110 title "stern9", \
        #STERN1.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 102 title "stern1", \
        #STERN13.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 115 title "stern13", \
        #STERN14.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 116 title "stern14", \
        #STERN11.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 113 title "stern11", \
        #STERN12.head.word(xR,i).tail   u ($3*(4.1*4.1)/(0.186*0.186)):1 with l ls 113 title "stern12", \

q
