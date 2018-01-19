#!/bin/bash

echo Enum4Linux, may drop some errors

for word in $(cat ./results/Public/SMB-IP.txt);do enum4linux -a $word >./results/Public/$word/$word-enum4linux.txt  & done 
