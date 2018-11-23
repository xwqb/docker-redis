docker run --name redis --privileged=true --net=host -d redis:5.0.2
docker exec redis /bin/bash /redis/cluster/trib-cluster.sh
