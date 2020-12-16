FROM ubuntu:21.04
#FROM pandoc/latex:2.11.2

RUN apt-get update
RUN export DEBIAN_FRONTEND=noninteractive && apt-get install tzdata
RUN apt-get install -y tree
RUN apt-get install -y nano
RUN apt-get install -y git
#RUN apt-get install -y git-all
RUN apt-get install -y python3
# RUN apt-get install -y pandoc
# RUN apt-get install -y texlive-base
# RUN apt-get install -y texlive-latex-recommended
# RUN apt-get install -y texlive
# RUN apt-get install -y texlive-latex-extra
# RUN apt-get install -y texlive-full
RUN apt-get clean

#EXPOSE 6379

#CMD ["redis-server", "--protected-mode no"]