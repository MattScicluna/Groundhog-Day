import urllib.request
from bs4 import BeautifulSoup
import csv
import time

uri='http://statistics.about.com/od/Applications/a/Groundhog-Day-Statistics.htm'

g = csv.writer(open("Groundhog Day" + ".csv", "w", newline=''), dialect='excel')

# Write column headers as the first line
g.writerow(["Year", "Saw Shadow"])

urllines = urllib.request.urlopen(uri)
pagedat = urllines.read()
urllines.close()
soup = BeautifulSoup(pagedat)
allrows = soup.find_all("tr")
for row in allrows:
    tds = row.find_all("td")
    try:
        Year = str(tds[0].get_text())
        Shadow = str(tds[1].get_text())
        print("good string")
        data=[Year, Shadow]
        g.writerow(data)
    except Exception:
        print("bad string")
        time.sleep(.1)
        continue
