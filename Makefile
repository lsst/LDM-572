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
	generateAcronyms.py  -t "DM Gen"  $(TEX)

.FORCE:
# #https://docs.google.com/spreadsheets/d/1s2Ur1SkZFOXldlAETIa9UxAKVnafeF4qXLRMCEuTWEQ/edit?gid=1613792548#gid=1613792548
tables: .FORCE
	makeTablesFromGoogle.py 1s2Ur1SkZFOXldlAETIa9UxAKVnafeF4qXLRMCEuTWEQ LDM-572\!A1:M
