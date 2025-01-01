@i
M = 0;

@5
M = 0;

(LOOP_START)
	//petlja zavrsava kada je i - 4 > 0 tj. i > 4
	@i
	D = M;
	@4
	D = D - A;
	@LOOP_END
	D; JGT
	
	@i
	A = M;
	D = M;
	@NOT_POS
	D; JLE

	@5
	D = M;
	@RAM5_0
	D; JEQ
	
	@i
	A = M;
	D = M;
	
	@5
	D = D - M;
	@NOT_MIN
	D; JGE
	
	@5
	M = D;
	
	
	
	(RAM5_0)
	@i
	A = M;
	D = M;
	@5
	M = D;
	
	(NOT_POS)
	(NOT_MIN)
	@i
	M = M + 1;
	@LOOP_START
	0; JMP
(LOOP_END)

(END)
@END
0; JMP
