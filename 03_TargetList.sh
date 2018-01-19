#!/bin/bash

echo "Making Target IP List..."
nmap -sL $@ > ./results/Public/nmapiplist.txt
cat ./results/Public/nmapiplist.txt | grep "Nmap sc" | cut -d " " -f 5 > ./results/Public/IP.txt

echo "Searching for online systems..."
nmap -PR -sP -PM -PE -PS -R $@ |grep "Host is up" -B 1 |grep "Nmap scan" |cut -d " " -f 5 >./results/Public/online-IP.txt
