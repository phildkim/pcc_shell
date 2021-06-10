#!/bin/bash
#
# Unit tests for admissions.
# Unit tests for reports.
#
# Copyright (c) 2019, Sekhar Ravinutala.
# Copyright (c) 2019, Philip D. Kim
#

. admissions.sh
# Test admissions.sh
test1() {
  assertEquals \
$'1763927\n'\
$'2355554\n'\
$'3556522\n'\
$'4098132\n'\
$'6010470\n'\
$'6449132\n'\
$'7917462\n'\
$'8542331\n'\
$'8997587\n'\
$'9754596' "$(admissions 10 | sort)"
  assertNull "$(admissions 100 | sort | diff 100 -)"
}

# Test report.sh
test2(){
  assertEquals \
$'9754596  3.98  4.90  Yes  No   Yes  M\n'\
$'8997587  3.92  4.90  No   No   Yes  M\n'\
$'8542331  3.92  4.90  No   Yes  Yes  M\n'\
$'7917462  3.99  4.90  No   No   Yes  F\n'\
$'6449132  3.97  5.00  Yes  No   Yes  M\n'\
$'6010470  3.89  5.00  No   No   Yes  F\n'\
$'4098132  3.82  5.00  No   No   No   F\n'\
$'3556522  3.98  4.90  No   No   Yes  M\n'\
$'2355554  3.96  4.80  Yes  Yes  Yes  M\n'\
$'1763927  3.95  4.80  No   No   No   M' "$(report.sh 10 | sort -r)"
}

if [[ $(basename "$0") != "shunit2" ]]; then
  . $(which shunit2)
fi