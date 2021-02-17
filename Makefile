paper: ms.tex 
	latexmk -pdf ms.tex -shell-escape
clean:
	latexmk -C
