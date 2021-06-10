#!/bin/sh
#
# Unit tests for count.
#
# Copyright (c) 2019, Sekhar Ravinutala.
#

test1() {
    assertEquals $'1\t8\n2\t3' "`count.sh << EOF
The quick fox jumped over the lazy dog.
Sure, it did.
EOF`"
}
test2() {
    assertEquals $'1\t8\n2\t3\n3\t3\n4\t1' "`count.sh << EOF
The quick fox jumped over the lazy dog.
Did it, really? Yes-sirry Bob! OK.
EOF`"
}
test3() {
    assertEquals $'1\t8\n2\t3\n3\t4' "`count.sh << EOF
The quick fox jumped over the lazy dog. So, you
say. But are you sure?
EOF`"
}
if [[ `basename "$0"` != "shunit2" ]]; then
    . `which shunit2`
fi