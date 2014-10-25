 # MAKEFILE 
all: compile run showresults

compile: t2.l
	flex t2.l
	gcc lex.yy.c -o extractor

run: extractor
	./extractor < in.in > output.out

showresults:
	cat output.out