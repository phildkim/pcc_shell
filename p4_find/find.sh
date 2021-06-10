#!/bin/bash
#
# A script to look up names and emails in a database (txt file). The user will
# query with command line options; first name (-f), last name (-l), email (-e)
# and maximum number of entries to show (-n).
#
# Copyright (c), Philip D. Kim
#
# find.sh -f Shawn -n 2
# Shawn   Diaz    crystalroberts@gardner-hoffman.co
# Shawn   Dixon   karenward@hickman-merritt.com
#
while getopts ":f:l:e:n:" line
do
  case "$line" in
    f) first_name=$OPTARG$'\t' ;;
    l) last_name=$OPTARG$'\t' ;;
    e) email_name=$OPTARG ;;
    n) line_number=$OPTARG ;;
  esac
done

str=$first_name$last_name$email_name
tempfile=$(mktemp -t tmp.XXXXXX)

if [[ -z $str ]]
then
  >&2 2> /dev/null
elif [[ -n $line_number ]]
then
  egrep "$str" data.txt | sort -k2 -k1 -k3 | head -n $line_number > $tempfile
else
  egrep "$str" data.txt | sort -k2 -k1 -k3 > $tempfile
fi
cat $tempfile
rm -f $tempfile
#
# Find entries in database.
#
# Copyright (c) 2019, Sekhar Ravinutala.
#
# a=[^\\t]+; f=$a; l=$a; e=$a; ((n=1<<31))
# while getopts :f:l:e:n: o; do
#     if [[ $o =~ f|l|e|n ]]; then
#         eval $o=$OPTARG
#     fi
# done
# if ! [[ "$f$l$e" =~ ^("$a"){3}$ ]]; then
#     grep -E "$(printf "$f\t$l\t$e")" data.txt | sort -k2,2 -k1,1 -k3,3 | head -n $n
# fi
