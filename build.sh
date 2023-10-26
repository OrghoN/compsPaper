#!/bin/sh

#build pdf
pdflatex -output-directory pdf main.tex
pdflatex -output-directory pdf main.tex

# build html
htlatex main.tex "" "" -dhtml/
htlatex main.tex "" "" -dhtml/

# remove intermediates and html output from main directory
rm *.html
rm *.css
rm html/*.xref
rm html/*.tmp
rm html/*.lg
rm html/*.4tc
rm html/*.4ct
rm html/*.idv

# renamemain.html to index for github pages
mv html/main.html html/index.html
