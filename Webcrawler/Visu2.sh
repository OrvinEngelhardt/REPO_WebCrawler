#!/bin/bash
data="/home/orvin/Dokumente/GitHub/REPO_WebCrawler/Webcrawler/data.json"
grep -o '"date": "[^"]*"' "$data" | sed 's/T.*/\"/' | sort | uniq -c | sort -n > /tmp/dates.txt

python3 << 'PYEOF'
import matplotlib.pyplot as plt

dates = []
counts = []
with open('/tmp/dates.txt') as f:
    for line in f:
        parts = line.strip().split()
        if len(parts) >= 3:
            count = int(parts[0])
            date = parts[2].replace('"', '')
            dates.append(date)
            counts.append(count)

fig, ax = plt.subplots(figsize=(12, len(dates) * 0.6 + 2))
bars = ax.barh(dates, counts, color='#4a90d9', height=0.6)

for bar, count in zip(bars, counts):
    ax.text(bar.get_width() + 0.2, bar.get_y() + bar.get_height() / 2,
            str(count), va='center', fontsize=9)

ax.set_xlabel('Anzahl Artikel')
ax.set_title('Artikel pro Datum')
ax.margins(y=0.01)
plt.subplots_adjust(left=0.15)
plt.tight_layout()
plt.show()
PYEOF
