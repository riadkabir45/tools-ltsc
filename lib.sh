#!/bin/sh
slmgrc(){
    cscript.exe "$WINDIR\system32\slmgr.vbs" $* >/dev/null 2>/dev/null
}

checkAdmin(){
    bcdedit >/dev/null 2>/dev/null
    return $?
}

checkNet(){
    ping -n 1 8.8.8.8 2>/dev/null | grep -q TTL
    return $?
}
