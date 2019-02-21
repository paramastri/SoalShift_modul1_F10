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
