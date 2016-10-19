FROM ubuntu:14.04

RUN sudo apt-get update --fix-missing
RUN sudo apt-get install -y \
    python \
    python-pip \
    python-dev \
    libxml2-dev \
    libxslt-dev \
    libffi-dev \
    libssl-dev \
    git

RUN sudo pip install pycparser==2.13
RUN sudo pip install -U pip
RUN sudo pip install \
    scrapy
RUN sudo pip install frontera[distributed,zeromq,sql]

RUN git clone https://github.com/scrapinghub/frontera.git

RUN sudo pip install -r frontera/requirements/examples.txt

CMD ping 8.8.8.8
