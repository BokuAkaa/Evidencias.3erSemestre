#! /bin/bash

if type -t wevtutil &> /dev/null
then
	OS=MSWin
elif type -t scutil &> /dev/null
then
	OS=macOS
else
	OS=Linux
fi
echo "El sistema operativo es" $OS > ArchivoPC.txt
function is_alive_ping() { 
	ping -c 1 $1 > /dev/null 2>&1 
	[ $? -eq 0 ] && echo "Node with IP: $i is up." >>ArchivoPC.txt
} 
for i in 192.168.0.{1..255}
do 
	is_alive_ping $i & disown 
done 

host=$1
firstport=$2 
lastport=$3
function portscan {
for ((counter=$firstport; counter<=$lastport; counter++)) 
do 
(echo >/dev/tcp/$host/$counter) > /dev/null 2>&1 && echo "$counter open" >>ArchivoPC.txt
done 
} 
portscan 
