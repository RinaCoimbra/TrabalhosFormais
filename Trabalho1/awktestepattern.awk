# awktest patterns
BEGIN{}
END{}
a, b, c{}
END{}
{}
{}
a b c d BEGIN{}

# Statement test
BEGIN{
	# Testes de for, if, else, while e dowhile
	for(a;b;c){
		a;
	}
	if(a){
		b++;
		toupper(a);
	}
	else{
		c--;
	}
	for(a in v){
		++x;
	}
	while(a < (x)){
		1 + 1;
		continue;
	}
	do{
		b = y+x;
		break;
	}while(cos(x))

}

# Teste expression
($a+b*(c++^4^4)&&g||++h == (a+=u)){}

# Teste de ifs aninhados
BEGIN{
	if(a){
		b++;
		if( x+="lalala")
			d++;
		if( z == 9 ){
			split(2, "banana");
			if( d != !2)
				sqrt(3);
		}
		else{
			d = length();
		}
	}
	else{
		c--;
	}
}
