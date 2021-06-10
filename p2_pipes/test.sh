#!/bin/bash

exec 2> /dev/null

test1() {
    assertEquals 14 `. pipes/1.sh`
}

test2() {
    assertEquals nobody `. pipes/2.sh`
}

test3() {
    tmp=`mktemp`
    chmod +x $tmp
    . pipes/3.sh `dirname $tmp`
    which `basename $tmp` > /dev/null
    assertEquals 0 $?
    rm $tmp
}