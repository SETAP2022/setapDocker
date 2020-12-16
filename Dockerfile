FROM ubuntu:21.04
#FROM pandoc/latex:2.11.2

RUN apt-get update
# Beware tzdata prompts for imput
RUN export DEBIAN_FRONTEND=noninteractive && apt-get install tzdata
RUN apt-get install -y tree
RUN apt-get install -y nano
RUN apt-get install -y git
RUN apt-get install -y pip
RUN pip install -U pytest
# ====== GH CLI ======
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
RUN apt-add-repository https://cli.github.com/packages
RUN apt-get update
RUN apt-get install gh
# ====== ======
#RUN apt-get install -y git-all
RUN apt-get install -y python3
# 156mb
RUN apt-get install -y pandoc
# RUN apt-get install -y texlive-base
# RUN apt-get install -y texlive-latex-recommended
# RUN apt-get install -y texlive
# RUN apt-get install -y texlive-latex-extra
# RUN apt-get install -y texlive-full
RUN apt-get clean

#EXPOSE 6379

#CMD ["redis-server", "--protected-mode no"]
CMD ["/bin/bash"]