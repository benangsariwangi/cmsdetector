#!/bin/bash)
#This colour
cyan='\e[0;36m'
green='\e[1;32m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'
BlueF='\e[1;34m'
clear
echo -e " $green
   ____ __  __ ____    ____  _____ _____ _____ ____ _____ ___  ____  
   / ___|  \/  / ___|  |  _ \| ____|_   _| ____/ ___|_   _/ _ \|  _ \ 
  | |   | |\/| \___ \  | | | |  _|   | | |  _|| |     | || | | | |_) |
  | |___| |  | |___) | | |_| | |___  | | | |__| |___  | || |_| |  _ < 
   \____|_|  |_|____/  |____/|_____| |_| |_____\____| |_| \___/|_| \_|

"$white"
          --+=[ Code By "$okegreen":"$BlueF" ./malesmandii       "$white"        ]=+--
          --+=[ Github  "$okegreen":"$BlueF" www.github.com/"prabs401     $white"    ]=+--
          --+=[ Credits "$okegreen": "$BlueF"backboxindonesia.or.id     "$white" ]=+-- 


"
		tput sgr0
printf "     Input Mass Target : ";read url;
echo ""
sleep 1;

for scan in `cat $url`
do
page=$(curl -s https://whatcms.org/APIEndpoint \
--data-urlencode key="61d2f9e58037bb9358a84513c6cedfc0d96291ac0bd56b24f6aec9aa8d3c52306e3316" \
--data-urlencode url="$scan")
if [[ $page =~ "request" ]]; then
	cms=$(echo $page | jq .result.name | tr -d \")
	confidence=$(echo $page | jq .result.confidence | tr -d \")
	code=$(echo $page | jq .result.code | tr -d \")
	message=$(echo $page | jq .result.msg | tr -d \")

	sleep 1;
	echo ""
	echo -e "$BlueF     [!] Scanning -> "$scan;
	echo ""
	echo -e "$white     Code [$BlueF $code $white] , Status [$green $message $white] $white CMS [$red $cms $white]"
	tput sgr0
	echo ""
	sleep 10;
fi	
done
