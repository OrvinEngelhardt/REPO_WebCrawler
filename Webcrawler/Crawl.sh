#!/bin/sh
source /home/orvin/Dokumente/GitHub/REPO_WebCrawler/.venv/bin/activate
cd /home/orvin/Dokumente/GitHub/REPO_WebCrawler/Webcrawler
scrapy crawl Webcrawler -o data.json
