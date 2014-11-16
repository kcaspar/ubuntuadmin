#!/bin/bash

cd dupedocs
touch data.txt

#run through all entries in candidatelist
while read filepath
do
#for each file obtain identify and exif data
#grep for tags and accumlate the relevant data
#save to data.txt

  #ritem=`echo "$name" # | awk '{ print $2 }'`
  #echo "$filepath"
  d1=$(identify -verbose "$filepath")
  d2=$(exif "$filepath")
  data="$d1""$d2"
  #echo "$data"

  s1="signature: Filesize: pixels:"
  s2="exif:Make: exif:Model: exif:ExifImageLength: exif:ExifImageWidth:"
  s3="date:create: date:modify: exif:DateTime:"
  s4="exif:DateTime: exif:DateTimeOriginal:"
  s="$s1 $s2 $s3 $s4"
  information=""

  for str in $s
  do
    result=""
    found=$(echo "$data" | grep "$str")
    if [ "$found" = "" ]; then
    result="unknown"
    else
      #extract data - considering the structure of the line
      if [[ $s1 == *$str* ]]; then
	  # one : separator
      result=$(echo "$found" | awk -F: '{ $1=""; print $0 }' | tr -d ' ')
      else
      # two : separator
      result=$(echo "$found" | awk -F: '{ $1=$2=""; print $0 }' | tr -d ' ')
      fi
    fi
    information+=":$result"
  done
  echo "$filepath""$information" >> data.txt
  #grep $ritem $md5list | awk -F':' '{ print $2 }' >> 5candidatelist.txt
done < 5candidatelist.txt #5test.txt #

cd ..

# awk -F: '{ $1=$2=""; print $0 }'
