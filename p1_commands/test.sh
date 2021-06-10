test1() {
    rm -rf /var/tmp/PCC
    . commands/1.sh
    assertTrue '[ -d /var/tmp/PCC/CS018/Spring/2019/hello ]'
}

test2() {
    assertEquals /bin/bash `. commands/2.sh | cut -d: -f7`
}

test3() {
    local res=`. commands/3.sh`
    assertEquals 2 `echo "$res" | wc -l`
    assertEquals 01019 `echo "$res" | sed -n 2p | sed 's/ //g'`
}