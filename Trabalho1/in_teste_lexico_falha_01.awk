BEGIN {

	mystring="How are you doing today?"

	print length(mystring)
	
	print index(mystring,"you")
	
	print tolower(mystring)
	
	print toupper(mystring)
	
	mysub=substr(mystr,startpos,maxlen)
	
	print substr(mystring,9,@a)
	
	print match(mystring,/you/), RSTART, RLENGTH
}