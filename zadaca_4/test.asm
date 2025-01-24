//push constant 2
@2
D=A
@SP
M=M+1
A=M-1
M=D

//push constant 5
@5
D=A
@SP
M=M+1
A=M-1
M=D

//call Sum.sum 2
@Sum.sum$ret0
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@7
D=A
@SP
D=M-D
@ARG
M=D
@SP
D=M
@LCL
M=D
@Sum.sum
0;JMP
(Sum.sum$ret0)
//pop static 0
@SP
AM=M-1
D=M
@Sum.0
M=D

//label END
($END)

//goto END
@$END
0;JMP

//function Sum.sum 2
(Sum.Sum.sum)
@SP
M=M+1
A=M-1
M=0
@SP
M=M+1
A=M-1
M=0
//push local 0
@0
D=A
@LCL
A=D+M
D=M
@SP
M=M+1
A=M-1
M=D

//push local 1
@1
D=A
@LCL
A=D+M
D=M
@SP
M=M+1
A=M-1
M=D

//push argument 0
@0
D=A
@ARG
A=D+M
D=M
@SP
M=M+1
A=M-1
M=D

//push argument 1
@1
D=A
@ARG
A=D+M
D=M
@SP
M=M+1
A=M-1
M=D

//add
@SP
AM=M-1
D=M
A=A-1
M=M+D

//return
@LCL
D=M
@R15
M=D
@5
D=A
@R15
A=M-D
D=M
@R14
M=D
@SP
AM=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R15
AM=M-1
D=M
@THAT
M=D
@R15
AM=M-1
D=M
@THIS
M=D
@R15
AM=M-1
D=M
@ARG
M=D
@R15
AM=M-1
D=M
@LCL
M=D
@R14
A=M
0;JMP
