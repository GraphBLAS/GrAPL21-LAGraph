paper: ms.tex 
	latexmk -pdf ms.tex -shell-escape
	bibtex ms
	latexmk -pdf ms.tex -shell-escape
	latexmk -pdf ms.tex -shell-escape
clean:
	latexmk -C
