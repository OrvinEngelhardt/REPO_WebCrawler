FROM debian
RUN apt update
RUN apt install -y python3 python3-venv python3-pip
RUN python3 -m venv .venv 
RUN .venv/bin/pip install Scrapy
