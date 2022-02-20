#!/bin/sh
#WINDIR
mode 80,20
loaderDir=$WINDIR/System32/spp/tokens/skus

eventE(){
    echo "E : $*"
    read -n 1
    exit 1
}

eventI(){
    echo "I : $*"
}

eventI Checking Resources
[ ! -e "./lib.sh" ] && eventE Files missing
[ ! -e "./skus.zip" ] && eventE Files missing

eventI Loading libs
. ./lib.sh

checkNet || {
    msg \* "Please enable internet"
    eventE "Network access missing"
}

checkAdmin || {
    msg \* "Please run as admin"
    eventE "Admin privilage missing"
}

eventI "Injecting SKUS"
unzip -qo skus.zip -d "$loaderDir" || eventE "Failed to inject"

eventI Re-installing system license files
slmgrc /rilc || eventE Failed to re-install
eventI "Uninstalling current key"
slmgrc /upk || eventE "Failed to uninstall key"
eventI "Uninstalling current KMS"
slmgrc /ckms || eventE "Failed to uninstall KMS"
eventI "Clearing registery"
slmgrc /cpky || eventE "Failed to clear registery"
eventI "Installing new key"
slmgrc /ipk M7XTQ-FN8P6-TTKYV-9D4CC-J462D || eventE "Failed to install key"
eventI "Installing new KMS"
slmgrc /skms kms.teevee.asia  || eventE "Failed to install KMS"

eventI Key successfully installed
read -n 1
