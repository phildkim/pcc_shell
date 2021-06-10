#
# Unit tests for find.
#
# Copyright (c) 2019, Sekhar Ravinutala.
#

PATH=$PATH:.

test1() {
    assertEquals '' "$(find.sh)"
}

test2() {
    assertEquals '' "$(find.sh -f shawn)"
}

test3() {
    assertEquals $'Kristin\tCruz\tsamanthawhite@hotmail.com
Shawn\tScott\tsamanthalove@hotmail.com' "$(find.sh -e saman.*@hotmail.com)"
}

test4() {
    assertEquals $'Shawn\tScott\tsamanthalove@hotmail.com' "$(find.sh -f Shawn -l Scott)"
}

test5() {
    assertEquals $'Shawn\tDiaz\tcrystalroberts@gardner-hoffman.com
Shawn\tDixon\tkarenward@hickman-merritt.com
Shawn\tKing\tbrittanymorgan@owens.com
Shawn\tScott\tsamanthalove@hotmail.com
Shawn\tThompson\tnstanton@hotmail.com
Shawn\tYoung\tdownskimberly@blake.com' "$(find.sh -f Shawn)"
}

test6() {
    assertEquals $'Shawn\tDiaz\tcrystalroberts@gardner-hoffman.com
Shawn\tDixon\tkarenward@hickman-merritt.com' "$(find.sh -f Shawn -n 2)"
}

test7() {
    assertEquals $'Shawn\tDixon\tkarenward@hickman-merritt.com' "$(find.sh -f Sha.* -l Di.*n)"
}

test8() {
    assertEquals $'' "$(find.sh -f Shawn -ln Scott)"
}

if [[ `basename "$0"` != "shunit2" ]]; then
    . `which shunit2`
fi