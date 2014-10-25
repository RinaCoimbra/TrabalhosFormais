 # MAKEFILE 
all: compile run showresults

compile: t2.l
	flex t2.l
	gcc lex.yy.c -o extractor

run: extractor
	./extractor < in.in > output.out

showresults:
	cat output.out

clonegithub:
	git clone https://github.com/RinaCoimbra/TrabalhosFormais.git

gitadd: 
	git add t2.l Makefile

gitcommit:
	git commit