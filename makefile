zadanie.pdf : zadanie.tex books.bib
	        xelatex zadanie.tex && bibtex zadanie && xelatex zadanie.tex && xelatex zadanie.tex

presentation.pdf : presentation_2.tex
	        xelatex presentation_2.tex

all : presentation.pdf zadanie.pdf

clean :
	        -rm -f *.aux *.log *.nav *.out *.snm *.pdf *.toc *.vrb *.bbl *.blg

.PHONY : clean all
