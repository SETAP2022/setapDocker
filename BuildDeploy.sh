#/bin/bash

#docker build .

# LOGIN
docker login ghcr.io -u ossonts
#Build and tag # --not-cache (force)
#https://docs.docker.com/develop/develop-images/build_enhancements/
DOCKER_BUILDKIT=1 docker build -t ghcr.io/setap2021/setapdocker .

# TESTING
# docker run -it  ghcr.io/setap2021/setapdocker
# Sent to github
docker push ghcr.io/setap2021/setapdocker
