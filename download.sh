n=103
while [ $n -ge 1 ]
do
    read a
    st="HGKRPji$n.mp3"
    curl $a > $st
    n=`expr $n - 1`
done
