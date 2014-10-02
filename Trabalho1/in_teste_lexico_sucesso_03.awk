{
	if (maxnf < NF)
        maxnf = NF
                 
    maxnr = NR
    for (x=1; x<=NF; x++)
        vector[x, NR] = $x
}

END {
	for (x=1; x<=maxnf; x++) {
		for (y=maxnr; y>=1; --y)
			print vector[x, y]
        }
    }
}