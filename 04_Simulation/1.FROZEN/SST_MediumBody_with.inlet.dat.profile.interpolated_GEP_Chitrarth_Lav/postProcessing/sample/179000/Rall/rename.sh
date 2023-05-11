for f in *
do
  f1="${f%.*}"
  f2=${f1::-3}
  echo $f $f1 $f2.xy
  mv $f $f2.xy
done

