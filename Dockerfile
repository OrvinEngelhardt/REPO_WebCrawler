FROM debian
RUN apt update
RUN apt install -y python3
RUN python3 -m venv .venv 
RUN source .venv/bin/activate
RUN pip3 install Scrapy
