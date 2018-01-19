#!/bin/bash

echo Runing nbtscan against online targets

nbtscan -r -v -h -f ./results/Public/online-IP.txt > ./results/Public/netbios-humanreadable.txt
nbtscan -r -f ./results/Public/online-IP.txt > ./results/Public/netbios-overview.txt
nbtscan -r -e  -f ./results/Public/online-IP.txt > ./results/Public/netbios-names.txt
nbtscan -s / -f ./results/Public/online-IP.txt > ./results/Public/netbios-machinereadable.txt
for word in $(cat ./results/Public/online-IP.txt);do nbtscan  -v -h $word >./results/Public/$word/$word-netbios-response.txt  ; done
