#!/bin/sh
IFS=""
password=792241.tk


for i in *.zip ; do
folder=`basename $i .zip`
unzip -d $folder -P $password $i
cd $folder
zipmv gbk
	for j in *; do
		cd $j
		cue=`ls -1 *.cue|head -n 1`
		cueu=utf8$cue
		isutf8 $cue
		if [ "$?" = "0" ]; then
			awk '{if(NR==1)sub(/^\xef\xbb\xbf/,"");print}' $cue > $cueu
		else
			cat $cue| iconv -f gbk -t utf8 -c > $cueu
		fi
		img=`ls -1 *.ape|head -n 1`
		musicsplit ape $cueu $img
		cuetag $cueu *.flac
		cd ..
	done

cd ..
done
