#/bin/bash

#docker build .

# LOGIN
docker login ghcr.io -u ossonts
#Build and tag
docker build -t ghcr.io/m30819-2020/setapdocker .

# TESTING
# docker run -it  ghcr.io/m30819-2020/setapdocker
# Sent to github
docker push ghcr.io/m30819-2020/setapdocker