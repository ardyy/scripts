#!/bin/bash

echo Agressive Nikto
for word in $(cat ./results/Public/HTTP-IP.txt);
do nikto -h $word >./results/Public/$word/$word-NiktoScan.txt  & done 
