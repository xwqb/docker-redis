#!/bin/bash
path=$(cd `dirname $0`;pwd)

for dir in `seq 7000 7005`;do
 cd $path/$dir
 redis-server redis-cluster_$dir.conf
done
