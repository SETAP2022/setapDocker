FROM ubuntu:21.04

RUN apt-get update && \
    apt-get install -y pandoc && \
    apt-get texlive-base && \
    apt-get texlive-latex-recommended && \
    apt-get texlive && \
    apt-get texlive-latex-extra && \
    apt-get texlive-full  && \
    apt-get clean

#EXPOSE 6379

#CMD ["redis-server", "--protected-mode no"]