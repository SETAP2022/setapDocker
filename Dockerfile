FROM ubuntu:20.04
#DEBIAN_FRONTEND=noninteractive apt-get -y --quiet --no-install-recommends

    # DEBIAN_FRONTEND=noninteractive apt-get -y --quiet --no-install-recommends  && \
    # Updates
RUN apt-get update  && \
    apt-get -y upgrade  && \
    # Core tools
    # Beware tzdata prompts for input
    apt-get install -y tzdata  && \
    apt-get install -y apt-utils  && \
    apt-get install -y software-properties-common rsync  && \
    # ===== Tools======
    apt-get install -y gnupg2  && \
    apt-get install -y tree  && \
    apt-get install -y nano  && \
    apt-get install -y git  && \
    apt-get install -y wget  && \
    apt-get install -y curl  && \
    apt-get install -y pdftk  && \
    # Clean up a bit
    pt-get -y autoremove && \
    pt-get clean autoclean && \
    rm -fr /var/lib/apt/lists/{apt,dpkg,cache,log} /tmp/* /var/tmp/* && \
    rm -rf /var/lib/apt/lists/* 
    # ====== GH CLI ======
RUN apt-get update  && \
    apt-get -y upgrade  && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0  && \
    apt-add-repository https://cli.github.com/packages  && \
    apt-get update  && \
    apt-get install -y gh && \
    #==========github==============
    curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash && \
    apt-get install -y git-lfs && \
    git lfs install && \
    # Clean up a bit
    rm -rf /var/lib/apt/lists/* 
RUN apt-get update  && \
    apt-get -y upgrade  && \
    # ====== Markdown lint ======
    apt-get install -y ruby && \
    gem install mdl && \
    # Clean up a bit
    rm -rf /var/lib/apt/lists/* 
RUN apt-get update  && \
    apt-get -y upgrade  && \
    # ====== Python ======
    apt-get install -y python3 && \
    apt-get install -y python3-pip && \
    pip3 install -U pytest && \
    apt-get install -y pep8 && \
    # Clean up a bit
    rm -rf /var/lib/apt/lists/* 
RUN apt-get update  && \
    apt-get -y upgrade  && \
    # == Java===
    apt-get install -y openjdk-14-jdk-headless && \
    # Clean up a bit
    rm -rf /var/lib/apt/lists/* 
RUN apt-get update  && \
    apt-get -y upgrade  && \
    #======NPM=====
    apt-get install -y npm && \
    # RUN npm i --save-dev eslint eslint-config-portsoc
    npm i eslint eslint-config-portsoc && \
    npm install log4js && \
    # Clean up a bit
    rm -rf /var/lib/apt/lists/* 
RUN apt-get update  && \
    apt-get -y upgrade  && \
    # ===== Pandoc Stuff ======
    apt-get install -y texlive-xetex  && \
    apt-get install -y pandoc  && \
    wget https://github.com/jgm/pandoc/releases/download/2.11.3.2/pandoc-2.11.3.2-1-amd64.deb  && \
    dpkg -i pandoc-2.11.3.2-1-amd64.deb  && \
    rm pandoc-2.11.3.2-1-amd64.deb && \
    # For svg files
    apt-get install -y librsvg2-bin  && \
    # Clean up a bit
    rm -rf /var/lib/apt/lists/* 
RUN apt-get update  && \
    apt-get -y upgrade  && \
    #=========GO - Singularity=========
    wget https://dl.google.com/go/go1.15.11.linux-amd64.tar.gz  && \
    tar -C /usr/local -xzvf go1.15.11.linux-amd64.tar.gz  && \
    rm go1.15.11.linux-amd64.tar.gz  && \
    echo 'export GOPATH=${HOME}/go' >> ~/.bashrc  && \
    export GOPATH=${HOME}/go  && \
    echo 'export PATH=/usr/local/go/bin:${PATH}:${GOPATH}/bin' >> ~/.bashrc  && \
    export PATH=/usr/local/go/bin:${PATH}:${GOPATH}/bin  && \
    #RUN go version
    # ========== Singularity===========
    wget https://github.com/hpcng/singularity/releases/download/v3.7.3/singularity-3.7.3.tar.gz  && \
    tar -xzf singularity-3.7.3.tar.gz && \
    rm -f singularity-3.7.3.tar.gz && \
    cd singularity && \
    ./mconfig && \
    make -C ./builddir  && \
    make -C ./builddir install && \
    rm -rf singularity/  && \
    singularity --version && \
    # Clean up a bit
    rm -rf /var/lib/apt/lists/* 

CMD ["/bin/bash"]
