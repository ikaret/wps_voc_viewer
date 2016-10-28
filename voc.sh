#!/bin/sh
log="/data/log/"
text="vTransSetDB().*"
data=$date

echo "Search Phone Number : \c"
read option1
echo "Search Process Name : \c"
read option2
echo "Search Date(ex .0813*, .*) :\c"
read option3
echo "Save File Name(ex. 20150813.txt): \c"
read filename

path=$log$option2$option3

grep "$text$option1" $path > grep.txt

while read line
do
pid=`echo $line | awk '{FS="|"} {print $2}'`
echo "========= $pid ========="
echo "========= $pid =========" >> $filename
grep -w "$pid" $path >> $filename

echo "" >> $filename
done < grep.txt

rm -rf grep.txt
echo "$filename File Success"
