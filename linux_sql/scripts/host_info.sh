#!/bin/bash

hostname=$(hostname -f)
lscpu_out=`lscpu`
cpu_number=$(echo "$lscpu_out" | egrep "^CPU\(s\):" | awk '{print $2}' | xargs)
cpu_architecture=$(echo "$lscpu_out" | egrep "^Architecture:" | awk '{print $2}' | xargs)
cpu_model=$(echo "$lscpu_out" | egrep "^Model:" | awk '{print $2}' | xargs)
cpu_mhz=$(echo "$lscpu_out" | egrep "^CPU\sMHz:" | awk '{print $3}' | xargs)
l2_cache=$(echo "$lscpu_out" | egrep "^L2\scache:" | awk '{print $3}' | xargs)
total_mem=$(cat /proc/meminfo | egrep "MemTotal:" | awk '{print $2}' | xargs)
timestamp=$(date +"%Y-%m-%d %H:%M:%S")
echo $hostname
echo $cpu_number
echo $cpu_architecture
echo $cpu_model
echo $cpu_mhz
echo $l2_cache
echo $total_mem
echo $timestamp


