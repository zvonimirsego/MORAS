@0
M = M - 1;

(BROJAC)
@0
M = M + 1;

@SCREEN
D = A;
@15
D = D + A;
@ADRESA
M = D;

@i
M = 0;

@j
M = 0;

@brojac
M = 1;

(start_citanje_pisanje_broja)
	//petlja staje kada i - 16 >= 0
	@i
	D = M;
	@16
	D = D - A;
	@end_citanje_pisanje_broja
	D; JGE
	
	@0
	D = M;
	@brojac
	D = D & M;
	@ZERO
	D; JEQ
	
	@ONE
	0; JMP
	
	(ZERO)
	@j
	M = 0;
	
	@ADRESA
	D = M;
	@k
	M = D;
	(ZERO_LOOP)
		@j
		D = M;
		@16
		D = D - A;
		@END_ZERO_LOOP
		D; JGE
		
		@16383
		D = A;
		@k
		A = M;
		M = D;
		
		@32
		D = A;
		@k
		M = M + D;
		
		@j
		M = M + 1;
		@ZERO_LOOP
		0; JMP
	(END_ZERO_LOOP)
	@ADRESA
	M = M - 1;
	
	@i
	M = M + 1;
	@brojac
	D = M;
	M = M + D;
	
	@start_citanje_pisanje_broja
	0; JMP
	
	(ONE)
	@j
	M = 0;
	
	@ADRESA
	D = M;
	@k
	M = D;
	(ONE_LOOP)
		@j
		D = M;
		@16
		D = D - A;
		@END_ONE_LOOP
		D; JGE
		
		@15903
		D = A;
		@k
		A = M;
		M = D;
		
		@32
		D = A;
		@k
		M = M + D;
		
		@j
		M = M + 1;
		@ONE_LOOP
		0; JMP
	(END_ONE_LOOP)
	@ADRESA
	M = M - 1;
	
	@i
	M = M + 1;
	@brojac
	D = M;
	M = M + D;
	
	@start_citanje_pisanje_broja
	0; JMP
(end_citanje_pisanje_broja)

(POOL)
@KBD
D = M;
@BROJAC
D; JNE
@POOL
0; JMP

(END)
@END
0; JMP