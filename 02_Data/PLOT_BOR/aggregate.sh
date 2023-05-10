#for c in 0 1 2 3 4 5
#do
#echo $cluster$c 
#pdfunite cluster${c}_XoR-0.1.pdf \
#    	 cluster${c}_XoR0.0.pdf  \
#    	 cluster${c}_XoR0.1.pdf  \
#    	 cluster${c}_XoR0.2.pdf  \
#    	 cluster${c}_XoR0.3.pdf  \
#    	 cluster${c}_XoR0.4.pdf  \
#    	 cluster${c}_XoR0.5.pdf  \
#    	 cluster${c}_XoR0.6.pdf  \
#    	 cluster${c}_XoR0.7.pdf  \
#    	 cluster${c}_XoR0.8.pdf  \
#    	 cluster${c}_XoR0.9.pdf  \
#    	 cluster${c}_XoR1.0.pdf  \
#    	 cluster${c}_XoR1.1.pdf  \
#    	 cluster${c}_XoR4.17.pdf \
#    	 cluster${c}_XoR4.27.pdf \
#    	 cluster${c}_XoR4.37.pdf \
#    	 cluster${c}_XoR4.47.pdf \
#    	 cluster${c}_XoR4.57.pdf \
#    	 cluster${c}_XoR4.67.pdf \
#    	 cluster${c}_XoR4.77.pdf \
#    	 cluster${c}_XoR4.87.pdf \
#    	 cluster${c}_XoR4.97.pdf \
#    	 cluster${c}_XoR5.07.pdf \
#    	 cluster${c}_XoR5.17.pdf \
#    	 cluster${c}_XoR5.27.pdf \
#    	 cluster${c}_XoR5.37.pdf \
#    	 cluster${c}_XoR5.47.pdf \
#    	 cluster${c}_XoR8.67.pdf  \
#    	 cluster${c}_XoR8.92.pdf  \
#    	 cluster${c}_XoR9.17.pdf  \
#    	 cluster${c}_XoR9.42.pdf  \
#    	 cluster${c}_XoR9.67.pdf  \
#    	 cluster${c}_XoR9.92.pdf  \
#    	 cluster${c}_XoR10.17.pdf \
#    	 cluster${c}_XoR10.42.pdf \
#    	 cluster${c}_XoR10.67.pdf \
#    	 cluster${c}_XoR10.92.pdf \
#    	 cluster${c}_XoR11.17.pdf \
#    	 cluster${c}_XoR11.42.pdf \
#    	 cluster${c}_XoR11.67.pdf \
#    	 cluster${c}_XoR11.92.pdf \
#    	 cluster${c}_XoR12.17.pdf \
#    	 cluster${c}_XoR12.9167.pdf  \
#    	 cluster${c}_XoR13.17.pdf    \
#    	 cluster${c}_XoR13.4167.pdf  \
#    	 cluster${c}_XoR13.67.pdf    \
#    	 cluster${c}_XoR13.9167.pdf  \
#    	 cluster${c}_XoR14.17.pdf    \
#    	 cluster${c}_XoR14.4167.pdf  \
#    	 cluster${c}_XoR14.67.pdf    \
#    	 cluster${c}_XoR14.9167.pdf  \
#    	 cluster${c}_XoR15.17.pdf    \
#    	 cluster${c}_XoR15.4167.pdf  \
#    	 cluster${c}_XoR15.67.pdf    \
#    	 cluster${c}_XoR15.9167.pdf  \
#    	 cluster${c}_XoR16.17.pdf    \
#    	 cluster${c}_XoR16.4167.pdf  BOR_cluster${c}.pdf
#done
#
#pdfunite BOR_cluster0.pdf BOR_cluster1.pdf BOR_cluster2.pdf BOR_cluster3.pdf BOR_cluster4.pdf BOR_cluster5.pdf BOR_all_clusters.pdf

for c in 0 1 2 3 4 5
do
echo $cluster$c 
 cp   cluster${c}_XoRXoR_-0.1.xy.png    c${c}-00.png
 cp   cluster${c}_XoRXoR_0.0.xy.png     c${c}-01.png	
 cp   cluster${c}_XoRXoR_0.1.xy.png     c${c}-02.png   
 cp   cluster${c}_XoRXoR_0.2.xy.png     c${c}-03.png  
 cp   cluster${c}_XoRXoR_0.3.xy.png     c${c}-04.png
 cp   cluster${c}_XoRXoR_0.4.xy.png     c${c}-05.png
 cp   cluster${c}_XoRXoR_0.5.xy.png     c${c}-06.png
 cp   cluster${c}_XoRXoR_0.6.xy.png     c${c}-07.png
 cp   cluster${c}_XoRXoR_0.7.xy.png     c${c}-08.png
 cp   cluster${c}_XoRXoR_0.8.xy.png     c${c}-09.png 
 cp   cluster${c}_XoRXoR_0.9.xy.png     c${c}-10.png 
 cp   cluster${c}_XoRXoR_1.0.xy.png     c${c}-12.png
 cp   cluster${c}_XoRXoR_1.1.xy.png     c${c}-13.png
 cp   cluster${c}_XoRXoR_4.17.xy.png    c${c}-14.png 
 cp   cluster${c}_XoRXoR_4.27.xy.png    c${c}-15.png
 cp   cluster${c}_XoRXoR_4.37.xy.png    c${c}-16.png
 cp   cluster${c}_XoRXoR_4.47.xy.png    c${c}-17.png
 cp   cluster${c}_XoRXoR_4.57.xy.png    c${c}-18.png
 cp   cluster${c}_XoRXoR_4.67.xy.png    c${c}-19.png
 cp   cluster${c}_XoRXoR_4.77.xy.png    c${c}-20.png
 cp   cluster${c}_XoRXoR_4.87.xy.png    c${c}-21.png
 cp   cluster${c}_XoRXoR_4.97.xy.png    c${c}-22.png
 cp   cluster${c}_XoRXoR_5.07.xy.png    c${c}-23.png
 cp   cluster${c}_XoRXoR_5.17.xy.png    c${c}-24.png
 cp   cluster${c}_XoRXoR_5.27.xy.png    c${c}-25.png
 cp   cluster${c}_XoRXoR_5.37.xy.png    c${c}-26.png
 cp   cluster${c}_XoRXoR_5.47.xy.png    c${c}-27.png
 cp   cluster${c}_XoRXoR_8.67.xy.png    c${c}-28.png
 cp   cluster${c}_XoRXoR_8.92.xy.png    c${c}-29.png
 cp   cluster${c}_XoRXoR_9.17.xy.png    c${c}-30.png
 cp   cluster${c}_XoRXoR_9.42.xy.png    c${c}-31.png
 cp   cluster${c}_XoRXoR_9.67.xy.png    c${c}-32.png
 cp   cluster${c}_XoRXoR_9.92.xy.png    c${c}-33.png
 cp   cluster${c}_XoRXoR_10.17.xy.png   c${c}-34.png
 cp   cluster${c}_XoRXoR_10.42.xy.png   c${c}-35.png
 cp   cluster${c}_XoRXoR_10.67.xy.png   c${c}-36.png
 cp   cluster${c}_XoRXoR_10.92.xy.png   c${c}-37.png
 cp   cluster${c}_XoRXoR_11.17.xy.png   c${c}-38.png
 cp   cluster${c}_XoRXoR_11.42.xy.png   c${c}-39.png
 cp   cluster${c}_XoRXoR_11.67.xy.png   c${c}-40.png
 cp   cluster${c}_XoRXoR_11.92.xy.png   c${c}-41.png
 cp   cluster${c}_XoRXoR_12.17.xy.png   c${c}-42.png
 cp   cluster${c}_XoRXoR_12.9167.xy.png c${c}-43.png 
 cp   cluster${c}_XoRXoR_13.17.xy.png   c${c}-44.png 
 cp   cluster${c}_XoRXoR_13.4167.xy.png c${c}-45.png 
 cp   cluster${c}_XoRXoR_13.67.xy.png   c${c}-46.png 
 cp   cluster${c}_XoRXoR_13.9167.xy.png c${c}-47.png 
 cp   cluster${c}_XoRXoR_14.17.xy.png   c${c}-48.png 
 cp   cluster${c}_XoRXoR_14.4167.xy.png c${c}-49.png 
 cp   cluster${c}_XoRXoR_14.67.xy.png   c${c}-50.png 
 cp   cluster${c}_XoRXoR_14.9167.xy.png c${c}-51.png 
 cp   cluster${c}_XoRXoR_15.17.xy.png   c${c}-52.png 
 cp   cluster${c}_XoRXoR_15.4167.xy.png c${c}-53.png 
 cp   cluster${c}_XoRXoR_15.67.xy.png   c${c}-54.png 
 cp   cluster${c}_XoRXoR_15.9167.xy.png c${c}-55.png 
 cp   cluster${c}_XoRXoR_16.17.xy.png   c${c}-56.png 
 cp   cluster${c}_XoRXoR_16.4167.xy.png c${c}-57.png 
done
