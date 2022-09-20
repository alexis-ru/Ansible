#!/bin/bash
hostname
echo "########## CPU  ##########"
lscpu | grep "Architecture:" \
&& lscpu | grep "^CPU(s):" \
&& lscpu | grep "Model name:" \
&& lscpu | grep "CPU MHz:" \
&& lscpu | grep "Hypervisor vendor:"

echo "########## Memory  ##########"
free -h

echo "########## HDD  ##########"
df -h -x tmpfs

echo "########## IP Stack  ##########"
ip a | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" | head -n 2 | grep -v 127
ip a | grep "inet " | head -n 2 | awk '{print $2}' | grep -v 127
