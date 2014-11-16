#!/bin/bash

#$ is searchdir
if [ -z "$1" ]
then
	echo "need searchdirectory as parameter!"
	exit 1
else
	searchdir="$1"
	echo "searchdirectory is " $searchdir
fi

# create document space
docdir="dupedocs"
if [ -d "$docdir" ]; then
  rm -rf $docdir
fi
echo "creating working directory:"$docdir
mkdir $docdir
cd $docdir

#  list with all filetypes to be considered
validtypes="jpg jpeg mov"
echo "searching for "$validtypes" files"

#list all files of desired type with full path
itemlist="1itemlist.txt"
find "${searchdir}" -type f -print | grep -i "jpg" > $itemlist
NUMOFLINES=$(wc -l $itemlist | awk '{print $1}')

#calculate md5sum for all those items
echo "calculating md5sum of "$NUMOFLINES" items       \/ done"
md5list="2md5list.txt"
N=0
modit=$(($NUMOFLINES/40))
while read name
do
	N=$((N+1))
    doupdate=$((N%modit))
    if [ "$doupdate" = "0" ]; then
		printf "."
	fi
  mysum=`md5sum "${name}" | awk '{ print $1 }'`
  #mysum="0"
  echo $mysum": "$name >> $md5list
done < "$itemlist"
echo "   - done with md5sum"

#sort the md5list and count which items have how many duplicates
echo "list and sort duplicates and drop items that are unique"
#sort -t : -k1,2 -n $md5list > sortlist.txt
#cat sortlist.txt | awk '{ print $1; }' > md5sortlist.txt
#cat md5sortlist.txt | uniq --count > countedlist.txt
sort -t : -k1,2 -n $md5list | awk '{ print $1; }' | uniq --count > 3countedlist.txt
#sort -k1,2 -rn countedlist.txt > downlist.txt
#grep -v "^ *1 " downlist.txt > removeindex.txt
sort -k1,2 -rn 3countedlist.txt | grep -v "^ *1 " > 4removeindex.txt

echo "picking for items to be removed..."
while read name
do
  ritem=`echo $name | awk '{ print $2 }'`
  grep $ritem $md5list | awk -F':' '{ print $2 }' >> 5candidatelist.txt
done < 4removeindex.txt

cd ..
