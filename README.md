Dieses Projekt exitiert in einem Docker Container daher müssen die folgenden Schritte durchgeführt werden.
Docker install: https://docs.docker.com/engine/install/

Nach dem installieren von Docker einfach die Folgenden Befehle ausführen: 
-docker build -t webcrawler .
-docker RUN webcrawler


python3 -m venv .venv
source .venv/bin/activate
pip3 install scrapy

scrapy startproject Webcrawler


cd  REPO_WebCrawler/Webcrawler
scrapy crawl Webcrawler -o data.json 
