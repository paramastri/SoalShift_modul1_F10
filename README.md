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
echo -e "Personal Accessories:"
awk -F "," '{if($1 == "United States" && $7 == '2012' && $4 == "Personal Accessories") iter[$6]+=$10} END {for(hasil in iter) print iter[hasil], hasil}' WA_Sales_Products_2012-14.csv | sort -rn | awk 'NR <=3 {print $2, $3, $4}'
echo -e "\nCamping Equipment:"
awk -F "," '{if($1 == "United States" && $7 == '2012' && $4 == "Camping Equipment") iter[$6]+=$10} END {for(hasil in iter) print iter[hasil], hasil}' WA_Sales_Products_2012-14.csv | sort -rn | awk 'NR <=3 {print $2, $3, $4}'
echo -e "\nOutdoor Protection:"
awk -F "," '{if($1 == "United States" && $7 == '2012' && $4 == "Outdoor Protection") iter[$6]+=$10} END {for(hasil in iter) print iter[hasil], hasil}' WA_Sales_Products_2012-14.csv | sort -rn | awk 'NR <=3 {print $2, $3, $4}'
```

#### Penjelasan:
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

c. Pada Soal point B output product line nya adalah "Personal Accessories, Camping Equipment, dan Outdoor Protection” jadi mengunakan codingan yg mirip dengan penambahan kondisi pada ``if (“ awk -F "," '{if($1 == "United States" && $7 == '2012' && $4 == "Personal Accessories") iter[$6]+=$10} “)`` 

serta mengambil 3 kolom terakhir, dimana itu adalah nama record dari Product yang memiliki maksimal 3 kata ``(“ | awk 'NR <=3 {print $2, $3, $4} “)``


