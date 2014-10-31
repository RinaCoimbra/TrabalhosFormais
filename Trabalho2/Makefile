 # MAKEFILE 
all: clean compile run

compile: t2.l
	flex t2.l
	gcc lex.yy.c -o extractor

showresults:
	cat ./extraction.out

run:
	@./extractor 1 teste01.in
	@./extractor 2 teste02.in
	@./extractor 3 teste03.in
	@./extractor 4 teste04.in
	@./extractor 5 teste05.in
	@./extractor 6 teste06.in
	@./extractor 7 teste07.in
	@./extractor 8 teste08.in
	@./extractor 9 teste09.in
	@./extractor 10 teste10.in
	@./extractor 11 teste11.in
	@./extractor 12 teste12.in


clean:
	@rm -rf extractor
	@rm -rf extraction.out

clonegithub:
	git clone https://github.com/RinaCoimbra/TrabalhosFormais.git

gitupload: gitpull gitadd gitcommit gitpush

gitpull:
	git pull

gitadd: 
	git add t2.l

gitcommit:
	git commit

gitpush:
	git push

backup:
	mkdir -p backup
	zip ./"backup/"T2Formais_`date +"%d-%m-%Y_%H:%M"` ./Makefile ./*.c *.l *.in