echo "Enter the file: "
read times
hour=${times:0:2}

lowercase="abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
uppercase="ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ"
awk '{print}' "/home/paramastri/sisop19/modul1/nomor4_enkripsi/$times" | tr "${lowercase:$hour:26}${uppercase:$hour:26}" "${lowercase:0:26}${uppercase:0:26}" | awk '{print}' > "/home/paramastri/sisop19/modul1/nomor4_dekripsi/$times"
