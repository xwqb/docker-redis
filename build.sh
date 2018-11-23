#!/bin/bash
path=$(cd `dirname $0`;pwd)
pfile=custom_params.conf

if [ ! -f $pfile ];then
 echo "not found custom_params.conf!"
 exit
fi

for line in `cat $pfile|grep "password"`;do
 PASS="requirepass "${line#*=}
done

if [ ! "$PASS" ];then
 PASS="#requirepass foorbar" 
fi


for dir in `seq 7000 7005`;do
 mkdir -p $dir
 mkdir -p $dir/data
 echo "mkdir -p dir -> $dir"
 PORT=$dir PASS=$PASS envsubst < $path/redis-cluster.tmpl >  $dir/redis-cluster_$dir.conf
done


