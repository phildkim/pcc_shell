#!/bin/bash
#
# Admissions library that takes the number of open spots as an argument
# and return a list of sorted IDs by 70%(weight),20%(alumni),10%(affirm)
#
# Copyright (c) 2019, Philip D. Kim
#

# LC_ALL variable forced to C will drop unicode support, increase speed
PATH=$PATH:.
admissions(){
  local available=$1
  LC_ALL=C filter.awk -v spots=$available data
}