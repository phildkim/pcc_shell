#!/bin/bash
#
# Bash shell script to count each sentence followed by the number of words.
#
# Copyright (c), Philip D. Kim
#
# INPUT:
#       What, me worry? No.
#       And you?
# OUTPUT:
#	1	3
#	2	1
#	3	2
# The script takes in the user's input and then output whenever a sentence ends with (!.?) with the number of words.
sentence=1
words=1
for w in $(cat | sed 's/-/ /g')
do
  if [[ $w =~ [\!\?\.]$ ]]
  then
    printf "%d\t%d\n" $sentence $words
    words=1
    ((++sentence))
  else
    ((++words))
  fi
done
#
# Count words in each sentence.
#
# Copyright (c) 2019, Sekhar Ravinutala.
#
# s=1; w=1
# IFS=" -"
# while read line; do
#     for word in $line; do
#         if [[ $word =~ [?\!.]$ ]]; then
#             printf "%s\t%s\n" $s $w
#             s=$[$s+1]; w=1
#         else
#             w=$[$w+1]
#         fi
#     done
# done