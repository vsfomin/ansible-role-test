#!/bin/bash
active_interface=$(ip route get 8.8.8.8 | awk 'NR==1 {print $5}')
readarray -t files <<< $(grep -rw $active_interface /etc/netplan)
length=${#files[@]}
for ((i=0; i<$length; i++))
do
  echo ${files[$i]}
done
