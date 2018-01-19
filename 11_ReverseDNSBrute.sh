#!/bin/bash


echo "Bruteforcing DNS Infos for all Targets against found DNS server"

for word in $(cat ./results/Public/DNS-IP.txt);do 
echo $word >./results/Public/var.tmp;

for target in $(cat ./results/Public/online-IP.txt);do 
server=$(cat ./results/Public/var.tmp);

#Wierd double loop .. well 
nslookup $target $server -type=any |tee -a ./results/Public/$server-DNSanswers.txt ./results/Public/$target/$target-DNSAnswerby$server.txt  & 
done 
done

rm ./results/Public/var.tmp;

