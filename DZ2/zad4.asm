@SCREEN
D = A;

@i
M = D;

@j
M = 0;

@SCREEN
D = A;

@VRH
M = D;

(START_VERTICAL)
	//zavrsava kada j >= 128 tj. j - 128 >= 0
	@j
	D = M;
	@128
	D = D - A;
	@END_VERTICAL
	D; JGE
	
	@i
	A = M;
	M = 1;
	
	@32
	D = A;
	
	@i
	M = M + D;
	
	@j
	M = M + 1;
	
	@START_VERTICAL
	0; JMP
(END_VERTICAL)

@i
D = M;

@SJECISTE
M = D;

@j
M = 0;

(START_HORIZONTAL)
	//zavrsava kada j >= 8 tj. j - 8 >= 0
	@j
	D = M;
	@8
	D = D - A;
	@END_HORIZONTAL
	D; JGE
	
	@i
	A = M;
	M = -1;
	
	@i
	M = M + 1;
	
	@j
	M = M + 1;
	
	@START_HORIZONTAL
	0; JMP
(END_HORIZONTAL)
@SJECISTE
D = M;

@i
M = D;

@32
D = A;

@i
M = M - D;

@2
D = A;

@i
A = M;
M = D;

@i
M = M - 1;

@k
M = 0;

(END_ROW)
@i
M = M + 1;

@brojac
M = 1;

@j
M = 0;

(START_OKOMICA)
	@k
	D = M;
	@64
	D = D - A;
	@END_OKOMICA
	D; JGE
	
	@j
	D = M;
	@16
	D = D - A;
	@END_ROW
	D; JGE
	
	@brojac
	D = M;
	M = M + D;
	
	@i
	A = M;
	M = M + D;
	
	@j
	M = M + 1;
	
	@k
	M = M + 1;
	
	@32
	D = A;
	@i
	M = M - D;
	
	@START_OKOMICA
	0; JMP
	
(END_OKOMICA)

@k
M = 0;

@VRH
D = M;

@i
M = D;
M = M - 1;

@2
D = A;

@VRH
A = M;
M = D;

(END_ROWS)
@i
M = M + 1;

@brojac
M = 1;

@j
M = 0;

(START_HYPOTENUSE)
	@k
	D = M;
	@128
	D = D - A;
	@END_HYPOTENUSE
	D; JGE
	
	@j
	D = M;
	@16
	D = D - A;
	@END_ROWS
	D; JGE
	
	@brojac
	D = M;
	M = M + D;
	
	@i
	A = M;
	M = M + D;
	
	@j
	M = M + 1;
	
	@k
	M = M + 1;
	
	@32
	D = A;
	@i
	M = M + D;
	
	@START_HYPOTENUSE
	0; JMP
(END_HYPOTENUSE)

(END)
@END
0; JMP