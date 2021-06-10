#!/bin/bash
#
# This script takes the number of open spots as an argument,
# call admissions() as a library to get the IDs of selected
# students and print a report of admitted students.
#
# Copyright (c) 2019, Philip D. Kim
#
# ID($1),GPA($2),statement($7),alumni($3),affirm($5),first-applicant($8),gender($6)

. admissions.sh
report(){
  local number_of_admissions=$1
  temp_report=$(mktemp file.XXXXX)
  admissions $number_of_admissions > $temp_report
  awk 'NR==FNR{student_id[$1]=$1;next}
    ($1 in student_id){
      ($3=="T")?$3="Yes":$3="No";
      ($5=="T")?$5="Yes":$5="No";
      ($8=="T")?$8="Yes":$8="No";
      printf("%-9d%-6s%-6s%-5s%-5s%-5s%c\n",$1,$2,$7,$3,$5,$8,$6)
  }' $temp_report data | sort -n
  rm $temp_report
}
report $1