#/bin/bash

wget https://dl.google.com/go/go1.15.11.linux-arm64.tar.gz  && \
tar -C /usr/local -xzvf go1.15.11.linux-arm64.tar.gz  && \
rm go1.15.11.linux-arm64.tar.gz 