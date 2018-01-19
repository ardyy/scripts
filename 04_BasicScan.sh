#!/bin/bash

echo "Creating Folder per Host.."
for word in $(cat ./results/Public/online-IP.txt);do mkdir ./results/$word  ;
mkdir ./results/Public/$word/loot  ;
echo -n"">>./results/Public/$word/$word-notes.txt; 
done


echo "Basic NMAP Scan..."
echo Udp 161 Scan
nmap  -Pn -n -vv -sU -p U:161 -oA ./results/Public/nmapUDP161 -iL ./results/Public/online-IP.txt &
echo HTTP scan
nmap  -Pn -n -vv -p http* -oA ./results/Public/nmaphttp -iL ./results/Public/online-IP.txt &
echo FTP scan
nmap  -Pn -n -vv -p ftp* -oA ./results/Public/nmapftp -iL ./results/Public/online-IP.txt &
echo DNS scan
nmap  -Pn -n -vv -p 53 -oA ./results/Public/nmapdns -iL ./results/Public/online-IP.txt &

echo SMB/CIFS scan
nmap  -Pn -n -vv -sU -sS -p 137-139,445 -oA ./results/nmapsmb -iL ./results/online-IP.txt &
