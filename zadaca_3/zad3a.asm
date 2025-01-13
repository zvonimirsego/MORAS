@2
M = 0

@1
D = M

@0
D = D - M

@n
M = D + 1

$WHILE(n)
	$ADD(0, 2, 2)
	@0
	M = M + 1
	@n
	M = M - 1;
$END

(END)
@END
0; JMP