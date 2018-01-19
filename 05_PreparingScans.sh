#!/bin/bash

echo SNMP List
cat ./results/Public/nmapUDP161.gnmap| grep 161/open |cut -d ":" -f 2  |cut -d " " -f 2 >./results/Public/UDP161-IP.txt

echo HTTP IP list
cat ./results/Public/nmaphttp.gnmap| grep open |cut -d ":" -f 2  |cut -d " " -f 2 >./results/Public/HTTP-IP.txt

echo FTP IP list
cat ./results/Public/nmapftp.gnmap| grep open |cut -d ":" -f 2  |cut -d " " -f 2 >./results/Public/FTP-IP.txt

echo SMB/CIFS IP list
cat ./results/Public/nmapsmb.gnmap| grep open |cut -d ":" -f 2  |cut -d " " -f 2 >./results/Public/SMB-IP.txt

echo DNS List
cat ./results/Public/nmapdns.gnmap| grep 53/open |cut -d ":" -f 2  |cut -d " " -f 2 >./results/Public/DNS-IP.txt
