for r in run_0*
do
    echo $r
    [ "$(ls -A $r/output)" ] && echo "Not Empty" || echo "Empty"
    #gzip -d $r/output/STERN_U1.edf.gz
    gzip $r/output/STERN_U1.edf
    #wc -l $r/output/STERN_U1.edf
done
