FROM debian
RUN apt update
RUN apt install -y python3 python3-scrapy
COPY ./Webcrawler .
CMD bash -c "echo 'Webcrawler Läuft. Speichert Daten zu data.json' && scrapy crawl Webcrawler -o data.json"

#sudo docker run -it webcrawler
#strg + d to quit 
#RUN python3 -m venv .venv
#RUN .venv/bin/pip install Scrapy
