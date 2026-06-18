# WebCrawler
Ein WebCrawler welcher alle Artikel von https://www.nbcnews.com in den letzen 24 sammelt und in eine Json datei speichert.
Zusätzlich gitb es zwei Skripte zum Visualiesieren des Datensatzes. 

# Installieren

## Lokal System
- python3 -m venv .venv
- source .venv/bin/activate
- pip3 install scrapy

- scrapy startproject Webcrawler

## Daten Crawlen

- cd  REPO_WebCrawler/Webcrawler
- scrapy crawl Webcrawler -o data.json 

oder Crawl.sh ausführen (daten werden in "data.json" gesichert



# Daten Visualiesierung

- Wort Anzahl			=	wc -w < data.json
- Zeilen Anzahl			=	wc -l < data.json

- Bestimtes Wort suchen		=	grep "deinWort" data.json -i
- Bestimtes Wort Anzahl		=	grep "deinWort" data.json -ic
- Wort im titel Suchen			grep -o '"title": "[^"]*deinWort[^"]*"' data.json 

## Mit output rechnen

count1=$(wc -l data.json)
count2=$(grep -o '"title": "[^"]*trump[^"]*"' data.json)

perc1=$(echo "$count2 / $count1 * 100 " | bc -l)
echo "$perc1"

## Visualiesierungs scripte

chmod +x Visu.sh
chmod +x Visu2.sh

- Visu.sh läst die nach Wörtern und Sätzen im Datensatz suchen
- Visu2.sh Zeigt an wann Artikel zum Datensatz hinzugefügt wurden und wie Viele 
