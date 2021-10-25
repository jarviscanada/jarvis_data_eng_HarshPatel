#!/bin/bash

hostname=$(hostname -f)
memory_free=$(vmstat --unit M |awk '{for(i=NF;i>0;i--)if($i=="free"){x=i;break}}END{print $x}' | xargs)
cpu_idle=$(vmstat --unit M |awk '{for(i=NF;i>0;i--)if($i=="id"){x=i;break}}END{print $x}' | xargs)
cpu_kernel=$(vmstat --unit M |awk '{for(i=NF;i>0;i--)if($i=="sy"){x=i;break}}END{print $x}' | xargs)
disk_io=$(vmstat -d |awk '{for(i=NF;i>0;i--)if($i=="cur"){x=i+1;break}}END{print $x}' | xargs)
disk_available=$(df -BM / |awk '{for(i=NF;i>0;i--)if($i=="Available"){x=i;break}}END{print $x}' | xargs)
timestamp=$(date +"%Y-%m-%d %H:%M:%S")
echo $hostname
echo $memory_free
echo $cpu_idle
echo $cpu_kernel
echo $disk_io
echo $disk_available
echo $timestamp
