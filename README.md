# SoalShift_modul1_F10

## Jawaban Soal Shift Sistem Operasi 2019 

## Modul 1

Oleh: 

* 05111640000125 Fadhlan Aulia
* 05111740000019 Paramastri Ardiningrum

## Daftar Isi
* [1. Mendekripsi File](#1-mendekripsi-file)
* [2. Filter Data dengan AWK](#2-filter-data-dengan-awk)
* [3. Password](#3-password)
* [4. Enkripsi Back Up Syslog](#4-enkripsi-back-up-syslog)
* [5. Simpan Record Syslog](#5-simpan-record-syslog)
- - - 

## 1. Mendekripsi File
#### soal1.sh
```
#!/bin/bash

iter=0

for gambarnya in /home/paramastri/sisop19/modul1/nature/*.jpg

do

base64 -d $gambarnya | xxd -r > /home/paramastri/sisop19/modul1/gambar_kebuka/$iter.jpg
iter=$((iter + 1))

done
```

#### crontab -e
```
14 14 14 2 * /bin/bash /home/paramastri/sisop19/modul1/soal1.sh 

14 14 * 2 5 /bin/bash /home/paramastri/sisop19/modul1/soal1.sh
```

#### Penjelasan

##### Soal: 
Anda diminta tolong oleh teman anda untuk mengembalikan filenya yang telah
dienkripsi oleh seseorang menggunakan bash script, file yang dimaksud adalah
nature.zip. Karena terlalu mudah kalian memberikan syarat akan membuka seluruh
file tersebut jika pukul 14:14 pada tanggal 14 Februari atau hari tersebut adalah hari
jumat pada bulan Februari.

##### Solusi: 
Pertama-tama, untuk mengenskripsi file tersebut, buat script soal1.sh yang berisi sintaks-sintaks shell.
File nature.zip di decode menjadi hex ``(“base64 -d $gambarnya”)``

kemudian output tersebut di reverse ``(“ xxd -r ”)`` kembali menjadi file .JPG yang sudah terdekripsi
``(“xxd -r > /home/paramastri/sisop19/modul1/gambar_kebuka/$iter.jpg”)``
 
dan itu dilakukan secara berulang sampai semua gambar tersebut berhasil di dekripsi 
``(“for gambarnya in /home/paramastri/sisop19/modul1/nature/*.jpg”)``

Script tadi dijalankan dalam crontab pada pukul 14:14 pada tanggal 14 Februari
``(“14 14 14 2 * /bin/bash /home/paramastri/sisop19/modul1/soal1.sh”)``

atau hari jumat pada bulan Februari
``(“14 14 * 2 5 /bin/bash /home/paramastri/sisop19/modul1/soal1.sh”)``

![alt text](https://github.com/paramastri/SoalShift_modul1_F10/blob/master/no1.PNG)


## 2. Filter Data dengan AWK
#### soal2.sh
```
#!/bin/bash

echo -e "JAWABAN NO 2\n\na)"

#(a)
awk -F ',' '{if($7 == '2012') iter[$1]+=$10} END {for(hasil in iter) {print hasil}}' WA_Sales_Products_2012-14.csv | sort -nr | head -1

echo -e "\nb)"

#(b)
awk -F  "," '{if($1 == "United States" && $7 == '2012') iter[$4]+=$10} END {for(hasil in iter) print iter[hasil], hasil}' WA_Sales_Products_2012-14.csv | sort -rn | awk 'NR<=3 {print $2,$3}'

echo -e "\nc)"

#(c)
#(c)
awk -F "," '{if($1 == "United States" && $7 == '2012' && ($4 == "Personal Accessories" || $4 == “Camping Equipment” || $4 == “Outdoor Protection” )) iter[$6]+=$10} END {for(hasil in iter) print iter[hasil], hasil}' WA_Sales_Products_2012-14.csv | sort -rn | awk 'NR <=3 {print $2, $3, $4}'
```

#### Penjelasan
##### Soal: 

Anda merupakan pegawai magang pada sebuah perusahaan retail, dan anda diminta
untuk memberikan laporan berdasarkan file WA_Sales_Products_2012-14.csv.

Laporan yang diminta berupa:

a. Tentukan negara dengan penjualan(quantity) terbanyak pada tahun 2012.

b. Tentukan tiga product line yang memberikan penjualan(quantity)terbanyak pada soal poin a.

c. Tentukan tiga product yang memberikan penjualan(quantity)terbanyak berdasarkan tiga product line yang didapatkan pada soal poin b.

##### Solusi:
a. Mencari data penjualan pada tahun 2012 serta jumlah quantity berdasarkan negara
 ``(“awk -F ',' '{if($7 == '2012') iter[$1]+=$10} ”)``

Yang kemudian hasil tersebut diprint
``(“{for(hasil in iter) {print hasil}}' WA_Sales_Products_2012-14.csv”)``

Output tadi kemudian disorting berdasarkan negara jumlah quantity terbanyak ``(“ | sort -nr “)``

Kemudian diambil negara urutan pertama dari hasil sorting tadi. ``(“ | head -1”)``

b. Pada soal poin A output negara yg keluar adalah United States maka pada soal ini mencari tiga product yg berada pada negara tersebut serta jumlah quantity masing-masing product.
``(“ awk -F  "," '{if($1 == "United States" && $7 == '2012') iter[$4]+=$10} “)``

Yang kemudian hasil tersebut diprint
``(“{for(hasil in iter) print iter[hasil], hasil}' WA_Sales_Products_2012-14.csv ”)``

Output tadi di sorting ``(“ | sort -rn “)`` dan output diambil 2 kolom terakhir yaitu kolom 2 dan 3 yang terdiri dari 2 kata product line dan diambil 3 kuantity teratas ``(“ | awk 'NR<=3 {print $2,$3}' “)``

c. Pada soal poin B output yang keluar adalah Personal Accessories, Camping Equipment, Outdoor Protection. Dari 3 macem product ini kita cari penjualan tertingginya ``(“ awk -F “,” ‘{if ($1 ==“United States” && $7 ==’2012’ && ($4 == “Personal Accessories” || $4 == “Camping Equipment” || $4 == “Outdoor Proctection”)) iter[$6]+=$10}`` yang kemudian hasil tersebut diprint ``(“ END {for(hasil in iter) print iter[hasil],hasil}’WA_Sales_Products_2012-14.csv’ ”)``. Output tadi disorting ``(“ | sort -rn “)``  dan Output diambil 3 quantity teratas dari 3 product line kemudian di print hasilnya bersama jumlah kuantitynya ``(“ | awk 'NR<=3 {print $2,$3,$4}' “)``.

![alt text](https://github.com/paramastri/SoalShift_modul1_F10/blob/master/no2.PNG)

## 3. Password
#### soal3.sh
```
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
```

#### Penjelasan
##### Soal: 

Buatlah sebuah script bash yang dapat menghasilkan password secara acak
sebanyak 12 karakter yang terdapat huruf besar, huruf kecil, dan angka. Password
acak tersebut disimpan pada file berekstensi .txt dengan ketentuan pemberian nama
sebagai berikut:

a. Jika tidak ditemukan file password1.txt maka password acak tersebut disimpan pada file bernama password1.txt

b. Jika file password1.txt sudah ada maka password acak baru akan disimpan pada file bernama password2.txt dan begitu seterusnya.

c. Urutan nama file tidak boleh ada yang terlewatkan meski filenya dihapus.

d. Password yang dihasilkan tidak boleh sama.

##### Solusi:

a. Ketika dalam kondisi tidak ditemukan password(nomor).txt, maka penyimpanan pada file dilakukan dengan menuliskan tujuan penyimpanannya dengan path seperti ini: 
``/home/paramastri/sisop19/modul1/nomor3/password$nomor.txt``

b. Lalu apabila nomor file password sudah ada pada file .txt, maka password acak yang baru akan dibuat dengan diberi nomor +1 dari nomor sebelumnya secara otomatis:
``then nomor=$((nomor + 1))``

c. Karena setiap akan menamai file dilakukan perulangan dengan menggunakan kondisi:
``if [[ -f /home/paramastri/sisop19/modul1/nomor3/password$nomor.txt ]]``. Maka nomor file password yang sudah ada tidak akan dibuat lagi dan apabila urutannya terlewat atau terhapus sehingga belum ada, maka akan dibuat sesuai dengan urutan nomor file yang seharusnya.

d. Supaya isi password tidak akan sama, maka diambil karakter sesuai ketentuan dari /dev/urandom seperti ini:
``cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1``


![alt text](https://github.com/paramastri/SoalShift_modul1_F10/blob/master/no3.PNG)

## 4. Enkripsi Back Up Syslog
#### soal4_e.sh
```
hour=`date +"%H"`
filename=`date +"%H:%M %d-%m-%Y"`

lowercase="abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
uppercase="ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ"

cat /var/log/syslog | tr "${lowercase:0:26}${uppercase:0:26}" "${lowercase:$hour:26}${uppercase:$hour:26}" > "/home/paramastri/sisop19/modul1/nomor4_enkripsi/$filename"
```
#### soal4_d.sh
```
echo "Enter the file: "
read times
hour=${times:0:2}

lowercase="abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
uppercase="ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ"
awk '{print}' "/home/paramastri/sisop19/modul1/nomor4_enkripsi/$times" | tr "${lowercase:$hour:26}${uppercase:$hour:26}" "${lowercase:0:26}${uppercase:0:26}" | awk '{print}' > "/home/paramastri/sisop19/modul1/nomor4_dekripsi/$times"
```
#### crontab -e
```
@hourly /bin/bash /home/paramastri/sisop19/modul1/soal4_e.sh
```
#### Penjelasan
##### Soal:
Lakukan backup file syslog setiap jam dengan format nama file “jam:menit tanggal-bulan-tahun”. Isi dari file backup terenkripsi dengan konversi huruf (string manipulation) yang disesuaikan dengan jam dilakukannya backup misalkan sebagai berikut:

a. Huruf b adalah alfabet kedua, sedangkan saat ini waktu menunjukkan pukul 12, sehingga huruf b diganti dengan huruf alfabet yang memiliki urutan ke 12+2 = 14.

b. Hasilnya huruf b menjadi huruf n karena huruf n adalah huruf ke empat belas, dan seterusnya.

c. setelah huruf z akan kembali ke huruf a.

d. Backup file syslog setiap jam.

e. dan buatkan juga bash script untuk dekripsinya.

##### Solusi
Supaya karakter tertentu dapat diterjemahkan dengan urutan (tanggal file terbuat) + (urutan alfabet), dibuat sintaks seperti dibawah ini:
`` hour=`date +"%H"` ``

Ketika setiap huruf sudah diterjemahkan, urutan alfabet pun ikut tergeser, sehingga sintaks ‘tr’ atau translate ditulis seperti ini: 
`` tr "${lowercase:0:26}${uppercase:0:26}"``
``"${lowercase:$hour:26}${uppercase:$hour:26}" ``

Kami menuliskan urutan alfabet sebanyak 2 kali supaya alfabet melakukan translate dan bergeser dengan tepat. Kemungkinan terburuk yang dapat terjadi adalah ketika file terbut pada pukul 23. Sehingga tentu huruf z akan menjadi urutan ke 23 + 26 = 49. Hal ini akan ter-cover karena jumlah alfabet yang saya tuliskan 2 kali menghasilkan 52 karakter yang dimana menanggung urutan huruf z yang menjadi ke-49 tadi.
`` lowercase="abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
uppercase="ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ" ``

Untuk melakukan back up file syslog setiap jam, dituliskan pada pengaturan crontab sebagai berikut:
`` @hourly /bin/bash /home/paramastri/sisop19/modul1/soal4_e.sh ``

Script dekripsi telah kami buat dan disimpan pada shell script ‘soal4_d.sh’

#### Syslog terdekripsi
![alt text](https://github.com/paramastri/SoalShift_modul1_F10/blob/master/no4_dekripsi.PNG)

#### Syslog terenkripsi
![alt text](https://github.com/paramastri/SoalShift_modul1_F10/blob/master/no4_enkripsi.PNG)


## 5. Simpan Record Syslog
#### soal5.sh
```
awk '/cron/ || /CRON/,!/sudo/' /var/log/syslog | awk 'NF < 13' >> /home/paramastri/modul1/syslogno5.log
```
#### crontab -e
```
2-30/6 * * * * /home/paramastri/sisop19/modul1/soal5.sh
```

#### Penjelasan
##### Soal:

Buatlah sebuah script bash untuk menyimpan record dalam syslog yang memenuhi kriteria berikut:

a. Tidak mengandung string “sudo”, tetapi mengandung string “cron”, serta buatlah pencarian stringnya tidak bersifat case sensitive, sehingga huruf kapital atau tidak, tidak menjadi masalah.

b. Jumlah field (number of field) pada baris tersebut berjumlah kurang dari 13.

c. Masukkan record tadi ke dalam file logs yang berada pada direktori /home/[user]/modul1.
 
d. Jalankan script tadi setiap 6 menit dari menit ke 2 hingga 30, contoh 13:02, 13:08, 13:14, dst.


##### Solusi:

a. Untuk memfilter output yang dihasilkan supaya sesuai seperti yang diminta, kami menggunakan sintaks seperti di bawah ini:
``awk '/cron/ || /CRON/,!/sudo/' /var/log/syslog``

Yang artinya mengambil string ‘cron’ dan ‘CRON’ (karena tidak case sensitive) dan tidak mengandung string ‘sudo’ dengan perintah ``‘!/sudo/’ yang difilter dari data pada /var/log/syslog``

b. Untuk menentukan inputnya adalah jumlah field yang tidak kurang dari 13, kami menuliskan sintaks NF: number of field < 13 yang dituliskan seperti ini:
``| awk 'NF < 13'``

c. Memasukkan record ke dalam file ekstensi .log menggunakan penulisan path seperti dibawah ini dengan ‘>>’ yang artinya akan dilakukan append pada isi file tersebut:
``>> /home/paramastri/modul1/syslogno5.log``

d. Untuk menjalankan script sesuai ketentuan waktu yang tersedia, dilakukan pengaturan pada crontab -e dengan sintaks seperti ini:
``2-30/6 * * * * /home/paramastri/sisop19/modul1/soal5.sh``

![alt text](https://github.com/paramastri/SoalShift_modul1_F10/blob/master/no5.PNG)
