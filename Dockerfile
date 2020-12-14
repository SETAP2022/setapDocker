FROM ubuntu:21.04
#FROM pandoc/latex:2.11.2

RUN apt update
RUN apt install -y tree
RUN apt install -y nano
# RUN apt-get install -y pandoc
# RUN apt-get install -y texlive-base
# RUN apt-get install -y texlive-latex-recommended
# RUN apt-get install -y texlive
# RUN apt-get install -y texlive-latex-extra
# RUN apt-get install -y texlive-full
RUN apt-get clean

#EXPOSE 6379

#CMD ["redis-server", "--protected-mode no"]