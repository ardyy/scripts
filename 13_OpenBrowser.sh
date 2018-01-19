#!/bin/bash
echo "Opening all the HTTP IP...Please wait..."

#iceweasel view
for word in $(cat ./results/Public/HTTP-IP.txt);
do /usr/bin/firefox -new-tab $word & done 
