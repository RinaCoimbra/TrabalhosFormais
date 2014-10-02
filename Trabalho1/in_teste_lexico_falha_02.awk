BEGIN {

	i=0;

	while (i++<1000000)
	{
		x = int (rand()*100 + 0.5)
		y[x]""
	}

	for (i=0;i<=100;i++)
	{
		print y[i]
		print i
	}

	exit;
}