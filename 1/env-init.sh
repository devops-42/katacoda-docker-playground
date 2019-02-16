docker images | awk '{print $1}' | xargs -r docker rmi
docker pull busybox