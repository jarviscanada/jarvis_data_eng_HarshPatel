#!/bin/bash

hostname=$(hostname -f)
lscpu_out=$(lscpu)
cpu_number=$(echo "$lscpu_out"  | egrep "^CPU\(s\):" | awk '{print $2}' | xargs)
cpu_architecture=$(echo "$lscpu_out"  | egrep "^Architecture:" | awk '{print $2}' | xargs)
cpu_model=$(echo "$lscpu_out"  | egrep 'Model name' | awk '{print $3 $4 $5 $6 $7 $8 $9 }' | xargs)
cpu_mhz=$(echo "$lscpu_out"  | egrep 'CPU MHz' | awk '{print $3 }' | xargs)
l2_cache=$(echo "$lscpu_out"  | egrep 'L2 cache' | awk '{print $3 }' | xargs)
total_mem=$(grep MemTotal /proc/meminfo | awk '{print $2 $3}'| xargs)
echo $hostname
echo $cpu_number
echo $cpu_architecture
echo $cpu_model
echo $cpu_mhz
echo $l2_cache
echo $total_mem


