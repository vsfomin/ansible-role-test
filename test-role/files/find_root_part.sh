#!/bin/bash
root_partition=$(echo $(lsblk -P |  grep -E 'MOUNT.*="/"'  | awk '{print $1}' | grep -o '".*"' | sed s/\"//g))
root_disk=$(echo $root_partition | grep -o '[[:alpha:]]*')
readarray -t list_root_disk_parts <<< $(lsblk -P | grep $root_disk | awk '{print $1}' | grep -o '".*"' | sed s/\"//g)
index=-1
next_to_root=0
for i in "${!list_root_disk_parts[@]}"; do
    if [[ "${list_root_disk_parts[$i]}" == "$root_partition" ]]; then
        index=$i
        next_to_root=$((i+1))
        break
    fi
done
if [[ ${#list_root_disk_parts[@]} -le 2 ]]; then
    echo "There are no other partiton except root"
else
echo ${list_root_disk_parts[next_to_root]} | tr -d '\r\n'
fi