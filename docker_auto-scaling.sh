#!/bin/bash/
changed=$(docker stats  --no-stream --format " {{.CPUPerc}}" ubuntu-node-login-1 | tr -dc //[^[:alnum:]])
CPU_PER=$(docker stats  --no-stream --format " {{.CPUPerc}}" ubuntu-node-login-1)
#echo $changed

if [ $changed -le 5000 ]; then
    echo "scaling start";
    docker-compose up -d --scale node-login=1 ;
elif [ $changed -gt 5000 ]; then
    echo "CPU utilization is" $CPU_PER ;
    docker-compose up -d --scale node-login=3
elif [ $changed -gt 7000 ]; then
    echo "CPU utilizati0on is" $CPU_PER ;
    docker-compose up -d --scale node-login=4 ;
elif [ $changed -gt 9000 ]; then
    echo "CPU utilization is" $CPU_PER ;
    docker-compose up -d --scale node-login=5 ;
elif [ $changed -gt 10000 ]; then
    echo "CPU utilization is" $CPU_PER ;
    docker-compose up -d --scale node-login=6 ;
else
    echo "CPU utilization is" $CPU_PER
    echo "instance working properly"
fi
