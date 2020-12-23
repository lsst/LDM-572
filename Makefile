#
#

SRC=$(wildcard LDM-*.tex)
TEX=$(SRC) body.tex  products.tex

OBJ=$(SRC:.tex=.pdf)

all: $(TEX)
	latexmk -bibtex -xelatex -f $(SRC)

clean :
	latexmk -c
	rm *.pdf

acronyms.tex :$(TEX) myacronyms.txt
	generateAcronyms.py  -g -t "DM Gen"  $(TEX)

