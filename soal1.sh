#!/bin/bash

iter=0    

for gambarnya in /home/paramastri/sisop19/modul1/nature/*.jpg

do

base64 -d $gambarnya | xxd -r > /home/paramastri/sisop19/modul1/gambar_kebuka/$iter.jpg
iter=$((iter + 1))

done
