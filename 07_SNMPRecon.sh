#!/bin/bash

#Full SNMP Tree
for word in $(cat ./results/Public/UDP161-IP.txt);do snmpwalk -c public -v1 $word>./results/Public/$word/$word-SNMPFullTree.txt  & done 

#Winuser
for word in $(cat ./results/Public/UDP161-IP.txt);do snmpwalk -c public -v1 $word 1.3.6.1.4.1.77.1.2.25 >./results/Public/$word/$word-SNMPWinUser.txt  & done 

#Enumerating Running Windows Processes
echo Enumerating Running Windows Processes
for word in $(cat ./results/Public/UDP161-IP.txt);do snmpwalk -c public -v1 $word 1.3.6.1.2.1.25.4.2.1.2 >./results/Public/$word/$word-SNMPWinProcess.txt  & done 

#Enumerating Open TCP Ports:
echo Enumerating Open TCP Ports
for word in $(cat ./results/Public/UDP161-IP.txt);do snmpwalk -c public -v1 $word 1.3.6.1.2.1.6.13.1.3 >./results/Public/$word/$word-SNMPWinTCPPorts.txt  & done 
#Enumerating Installed Software:
echo Enumerating Installed Software
for word in $(cat ./results/Public/UDP161-IP.txt);do snmpwalk -c public -v1 $word 1.3.6.1.2.1.25.6.3.1.2 >./results/Public/$word/$word-SNMPWinInstalledSoftware.txt  & done
