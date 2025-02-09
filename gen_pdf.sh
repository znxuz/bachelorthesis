#!/usr/bin/env bash

# 1. Generiert das Dokument mit Fragezeichen anstelle von Zitaten
pdflatex --shell-escape Hauptdatei.tex
# 2. Dies wird die .bib Datei verarbeiten, und das Dokument mit Zitatinformationen anreichern – Die .bib Datei kann anders heißen, dann muss der Befehl Hauptdatei entsprechend angepasst werden.
bibtex Hauptdatei
# 3. aktualisiert den Index
makeindex Hauptdatei.nlo -s latex_einstellungen/abkuezungen/nomencl.ist -o Hauptdatei.nls
# 4. Verarbeitet die Dateien nochmals und inkludiert die Zitate
pdflatex --shell-escape Hauptdatei.tex
# 5. nochmal, um sicher zu gehen, u.a. falls sich durch die Zitate die Seitennummerierung geändert hat
pdflatex --shell-escape Hauptdatei.tex

## Aufräumen...
rm -f *.aux *.dvi *.log *.lot *.lol *.lof *.nls *.ilg *.nlo *.idx *.out *.toc *.ist *.glo *.blg
rm -f latex_einstellungen/*.aux
