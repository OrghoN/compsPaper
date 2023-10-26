#!/bin/sh

#build pdf
pdflatex main.tex
pdflatex main.tex

# build html
htlatex main.tex "" "" -ddocs/
htlatex main.tex "" "" -ddocs/

# remove intermediates and html output from main directory
rm *.html
rm *.css

rm *.aux
rm *.xref
rm *.tmp
rm *.lg
rm *.4tc
rm *.4ct
rm *.idv
rm *.dvi
rm *.bcf
rm *.run.xml
rm main.log
rm *.toc
rm *.out
rm *.lot
rm *.lof
rm *.blg
rm *.bbl

# remove emacs backup files
rm *~

# renamemain.html to index for github pages
mv docs/main.html docs/index.html

# move pdf output to pdf/ directory
mv main.pdf pdf/main.pdf

