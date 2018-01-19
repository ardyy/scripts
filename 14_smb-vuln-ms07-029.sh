#!/bin/bash

echo "Searching MS07-029..."

nmap --script smb-vuln-ms07-029.nse -p 445 -oA ./results/Public/nmapMS07-029 -iL ./results/Public/online-IP.txt
