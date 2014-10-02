{
    line = $0;
    while (substr (line, length (line),1) == "\\") {

        line = substr (line, 1, length (line) - 1);
        1ºi = getline;
        if (i > 0) {
            line = line $0;
    }

    print line;
}