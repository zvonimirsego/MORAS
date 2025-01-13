@0
D = M

@n
M = D

@100
D = A

@i
M = D

@j
M = 0

$WHILE(n)
    @i
    D = M
    @j
    M = D + 1;
    @n
    D = M;
    @m
    M = D - 1
    $WHILE(m)
        @i
        A = M
        D = M
        @j
        A = M
        D = D - M
        @SWAP
        D; JGT

        @CONTINUE
        0; JMP

        (SWAP)
        @i
        A = M
        D = M
        @15
        M = D
        @j
        A = M
        D = M
        @i
        A = M
        M = D
        @15
        D = M
        @j
        A = M
        M = D
        (CONTINUE)
        @j
        M = M + 1
        @m
        M = M - 1
    $END
    @i
    M = M + 1;
    @n
    M = M - 1;
$END

(END)
@END
0;JMP