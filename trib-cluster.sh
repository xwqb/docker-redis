#!/bin/bash
pfile=custom_params.conf
readParam(){
 if [ -f "$pfile" ];then
  for line in `cat $pfile|grep -v "#"`;do
    if [[ $line =~ host.* ]];then
     host=${line#*=}
     if [[ $host ]];then
      for port in `ls -l|grep ^d|awk '{print$9}'`;do
       cluster=$cluster" "$host:$port
      done
     fi
    fi
 
   if [[ $line =~ password.* ]];then
    password=${line#*=} 
   fi
  done
 if [[ $password ]];then
  password="-a $password"
 else
  echo "not found password"
 fi
  echo "yes" | redis-cli  --cluster create --cluster-replicas 1 $cluster $password
 else
  echo "not found file"
 fi
}
readParam

