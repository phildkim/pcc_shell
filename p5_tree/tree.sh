#!/bin/bash
#
# A function tree() that takes a single argument that represents a file
# or folder and prints the contents hierachically.
#
# Copyright (c) 2019, Philip D. Kim
#
# OUTPUT:
# pcc/
#	README
#	cs018/
#		syllabus
# A recursive tree function to call itself to print directories and files
# as shown above. Also, a tab function to append tabs in the beginning of
# every directory.

# The tab function increments a tab everything it is called in the rtree function.
tab(){
    local index=0
    while [ "$index" -lt "$1" ]
    do
        printf "\t"
        ((++index))
    done
}
# The rtree is a recursive function that prints all the directories and files.
rtree(){
    local directory="$1"
    cd "$directory"
    ls -r | while read file
    do
        tab $2
        if [ -d "$file" ]
        then
            printf "\t%s/\n" `basename $file`
            rtree `basename $file` `expr $2 + 1`
        else
            printf "\t%s\n" `basename $file`
        fi
    done
}
# The tree function argument takes either a file or directory
tree(){
    # (1) If file, then just print.
    if [ -f "$1" ]
    then
        printf "%s\n" $1
    # (2) If directory, use ls command to list the directories and pass the arguement to
    #     the recursive function rtree to print out all of the directories and files.
    elif [ -d "$1" ]
    then
        ls -d -p "$1"
        rtree "$1" 0
    # (3) Anything else, strderr to /dev/null
    else
        exec 2> /dev/null
    fi
}
#
# Format contents as a tree.
#
# Copyright (c) 2019, Sekhar Ravinutala.
#
# tree() {
#     if [ -d "$1" ]; then
#         echo $(basename "$1")/
#         for e in "$1"/*; do
#             tree "$e" | sed "s/^/\t/"
#         done
#     elif [ -e "$1" ]; then
#         basename "$1"
#     fi
# }