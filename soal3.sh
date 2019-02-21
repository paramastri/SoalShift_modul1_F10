#!/bin/bash
iter=1
nomor=1
while [ $iter -ne 0 ]
do
if [[ -f /home/paramastri/sisop19/modul1/nomor3/password$nomor.txt ]] ; then
    nomor=$((nomor + 1))
    else
cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1 > /home/paramastri/sisop19/modul1/nomor3/password$nomor.txt
iter=0
fi
done
