#!/bin/sh

# Eingabe-Dialog
word=$(zenity --entry --title="Webcrawler Suche" --text="Wort eingeben:")

# Abbrechen abfangen
if [ -z "$word" ]; then
    exit 0
fi

data="/home/orvin/Dokumente/GitHub/REPO_WebCrawler/Webcrawler/data.json"
count1=$(wc -l < "$data")
count2=$(grep -iE "\"(title|summary)\": \"[^\"]*$word[^\"]*\"" "$data" | wc -l)
perc1=$(echo "scale=4; $count2 * 100 / $count1" | bc -l)


# Kreisdiagramm erstellen
python3 << EOF
import matplotlib.pyplot as plt

word = "$word"
match = $count2
total = $count1
perc = float($perc1)
count3 = total - match  

labels = [f'"{word}" gefunden ({match})', f'Nicht gefunden ({count3})']
sizes = [match, count3]
colors = ['#ff6666', '#cccccc']
explode = (0.05, 0)

plt.figure(figsize=(7, 7))
plt.pie(sizes, explode=explode, labels=labels, colors=['#ff6666', '#cccccc'],
        autopct='%1.2f%%', startangle=90)
plt.title(f'Vorkommen von "{word}" in Artikeln ({total})')
plt.tight_layout()
plt.show()
EOF

