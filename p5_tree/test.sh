#!/bin/bash

#
# Unit tests for tree function
#
# Copyright (c) 2019, Sekhar Ravinutala.
#

. tree.sh

# No argument.
test1() {
    assertEquals '' "$(tree '')"
}


# File.
test2() {
    tempfile=$(mktemp temp.XXXXX)
    assertEquals $tempfile "$(tree $tempfile)"
    rm $tempfile
}

# Empty folder.
test3() {
    tempdir=$(mktemp -d dirr.XXXXX)
    assertEquals $tempdir/ "$(tree $tempdir)"
    rm -rf $tempdir
}


# Folder with only one file.
test4() {
    tempdir=$(mktemp -d dirrs.XXXXX)
    cd $tempdir
    tempfile=$'\n\t'$(mktemp file.XXXXX)
    cd ..
    assertEquals "$tempdir/$tempfile" "$(tree $tempdir)"
    rm -rf $tempdir
}

# Folder with only one folder.
test5() {
    tempdir=$(mktemp -d dirones.XXXXX)
    cd $tempdir
    tempdir1=$'\n\t'$(mktemp -d dirtwos.XXXXX)
    cd ..
    assertEquals "$tempdir/$tempdir1/" "$(tree $tempdir)"
    rm -rf $tempdir
}

# Folder with multiple files and multiple folders.
test6() {
    tempdir1=$(mktemp -d dironess.XXXXX)
    cd $tempdir1
    tempfile1=$'\n\t'$(mktemp fileone.XXXXX)
    tempdir2=$'\n\t'$(mktemp -d dirtwoss.XXXXX)
    cd $tempdir2
    tempfile2=$'\n\t\t'$(mktemp filethree.XXXXX)
    cd ..
    cd ..
    assertEquals "$tempdir1/$tempfile1$tempdir2/$tempfile2" "$(tree $tempdir1)"
    rm -rf $tempdir1 $tempdir2
}

# Folder with multiple directories and multiple files in the last directory
test7() {
    tempdir1=$(mktemp -d dirone.XXXXX)
   	cd $tempdir1
    tempdir2=$'\n\t'$(mktemp -d dirtwo.XXXXX)
    cd $tempdir2
    tempdir3=$'\n\t\t'$(mktemp -d dirthree.XXXXX)
    cd $tempdir3
    tempfile1=$'\n\t\t\t'$(mktemp fileone.XXXXX)
    tempfile2=$'\n\t\t\t'$(mktemp filetwo.XXXXX)
    cd ..
    cd ..
    cd ..
    assertEquals "$tempdir1/$tempdir2/$tempdir3/$tempfile2$tempfile1" "$(tree $tempdir1)"
   rm -rf $tempdir1 $tempdir2 $tempdir3
}

if [[ `basename "$0"` != "shunit2" ]]; then
   . `which shunit2`
fi