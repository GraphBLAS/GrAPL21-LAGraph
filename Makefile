paper: gapBenchSC20.tex 
	latexmk -pdf gapBenchSC20.tex -shell-escape
clean:
	latexmk -C
