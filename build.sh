#!/bin/sh

#build pdf
pdflatex -output-directory pdf main.tex
pdflatex -output-directory pdf main.tex

# build html
htlatex main.tex "" "" -ddocs/
htlatex main.tex "" "" -ddocs/

# remove intermediates and html output from main directory
rm *.html
rm *.css
rm docs/*.xref
rm docs/*.tmp
rm docs/*.lg
rm docs/*.4tc
rm docs/*.4ct
rm docs/*.idv

rm *~

# renamemain.html to index for github pages
mv docs/main.html docs/index.html

