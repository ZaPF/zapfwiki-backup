#!/bin/bash

# ### Über dieses Skript
# Dieses Script dient dem Zweck, die Inhalte des ZaPF-Wikis
# Dazu wird ein Skript des Projekts wikiteam genutzt, das automatisch alle Inhalte sichert.
#
# Mehr Informationen gibt es in der Datei README.md

## Zum Debuggen diese Zeile einkommentieren:
set -x

## ----- Konfiguration:
BASE_URL="https://vmp.ethz.ch"
#EXPORT_URL=$BASE_URL"/w/index.php5?title=Spezial:Exportieren"
API_URL=$BASE_URL"/zapfwiki/api.php"
BACKUP_FOLDER="zapfwiki-$(date +%Y-%m-%d)"
DUMPGENERATOR_TOOL_URL="https://raw.githubusercontent.com/WikiTeam/wikiteam/master/dumpgenerator.py"
DUMPGENERATOR_TOOL="dumpgenerator.py"

## ----- Befehle:
#svn checkout http://wikiteam.googlecode.com/svn/trunk/ wikiteam
#wget $DUMGENERATOR_TOOL_URL
curl -O $DUMPGENERATOR_TOOL_URL
## Hier passiert die eigentliche Arbeit, das Backup des Wikis:
python $DUMPGENERATOR_TOOL --api=$API_URL --xml --images --path=$BACKUP_FOLDER
tar czvf $BACKUP_FOLDER.tar.gz $BACKUP_FOLDER/* $DUMPGENERATOR_TOOL
## Nach dem erstellen der gepackten Datei können wir den Ordner löschen:
rm -rf $BACKUP_FOLDER
