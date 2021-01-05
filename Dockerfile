FROM ubuntu:21.04
#FROM pandoc/latex:2.11.2

RUN apt-get update
# Beware tzdata prompts for input
RUN export DEBIAN_FRONTEND=noninteractive && apt-get install tzdata

# ===== Tools======
RUN apt-get install -y gnupg2
RUN apt-get install -y tree
RUN apt-get install -y nano
RUN apt-get install -y git

# ====== GH CLI ======
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
RUN apt-add-repository https://cli.github.com/packages
RUN apt-get update
RUN apt-get install gh
# ====== Markdown lint ======
RUN gem install mdl
#RUN apt-get install -y git-all
# ====== Python ======
RUN apt-get install -y python3
RUN apt-get install -y pip
RUN pip install -U pytest
RUN apt-get install -y pep8

# 156mb
# ===== Pandoc Stuff ======
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
