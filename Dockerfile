FROM ubuntu:20.04

RUN export DEBIAN_FRONTEND=noninteractive
# Updates
RUN apt-get update
RUN apt-get -y upgrade
# Core tools
# Beware tzdata prompts for input
RUN apt-get install -y tzdata
RUN apt-get install -y apt-utils
RUN apt-get install -y software-properties-common rsync


# ===== Tools======
RUN apt-get install -y gnupg2
RUN apt-get install -y tree
RUN apt-get install -y nano
RUN apt-get install -y git
RUN apt-get install -y wget
RUN apt-get install -y curl
RUN apt-get install -y pdftk

# ====== GH CLI ======
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
RUN apt-add-repository https://cli.github.com/packages
RUN apt-get update
RUN apt-get install -y gh

#==========github==============
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
RUN apt-get install -y git-lfs
RUN git lfs install

# ====== Markdown lint ======
RUN apt-get install -y ruby
RUN gem install mdl

# ====== Python ======
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN pip3 install -U pytest
RUN apt-get install -y pep8

# == Java===
RUN apt-get install -y openjdk-14-jdk-headless

#======NPM=====
RUN apt-get install -y npm
#RUN npm i --save-dev eslint eslint-config-portsoc
RUN npm i eslint eslint-config-portsoc
RUN npm install log4js

# ===== Pandoc Stuff ======
RUN apt-get install -y texlive-xetex
RUN apt-get install -y pandoc
RUN wget https://github.com/jgm/pandoc/releases/download/2.11.3.2/pandoc-2.11.3.2-1-amd64.deb
RUN dpkg -i pandoc-2.11.3.2-1-amd64.deb
# For svg files
RUN apt-get install -y librsvg2-bin

#=========GO - Singularity=========
RUN wget https://dl.google.com/go/go1.15.11.linux-amd64.tar.gz
RUN tar -C /usr/local -xzvf go1.15.11.linux-amd64.tar.gz
RUN rm go1.15.11.linux-amd64.tar.gz
RUN echo 'export GOPATH=${HOME}/go' >> ~/.bashrc
ENV GOPATH=${HOME}/go
RUN echo 'export PATH=/usr/local/go/bin:${PATH}:${GOPATH}/bin' >> ~/.bashrc
ENV PATH=/usr/local/go/bin:${PATH}:${GOPATH}/bin
RUN go version

#========== Singularity===========
RUN wget https://github.com/hpcng/singularity/releases/download/v3.7.3/singularity-3.7.3.tar.gz
RUN tar -xzf singularity-3.7.3.tar.gz
RUN rm -f singularity-3.7.3.tar.gz
RUN cd singularity && \
./mconfig && \
make -C ./builddir  && \
make -C ./builddir install
RUN rm -rf singularity/
RUN singularity --version

# Clean up a bit
RUN apt-get clean

CMD ["/bin/bash"]
