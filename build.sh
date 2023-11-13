#!/bin/sh
latexmk -shell-escape -synctex=1 -interaction=nonstopmode -file-line-error -pdf -outdir=build main.tex
