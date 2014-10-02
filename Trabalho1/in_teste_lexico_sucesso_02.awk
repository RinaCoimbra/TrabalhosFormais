BEGIN
{
	a = 1
	b = 2
	c = 3
	d = 4
	e = 5
	f = 1000
	i = 0


	while(i < 20)
	{

		resultado += (cos(e) * (a+b-c)/d) - i + f
		i++
		f--
	}

	print resultado
}