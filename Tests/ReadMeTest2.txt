the purpose of this test is to sort an array of 8 words in an ascending order.

// array size
addi $2, $2, 7	1000 010 010 000 111	8487
add $7, $2, $0	0001 010 000 111 000	1438

//outer loop, xor to reset array index
OuterLoop:	
xor $1, $1, $1	0000 001 001 001 011	024b
beq $2, $1, 31	0100 010 001 011 111	445F
add $6, $0, $2	0001 000 010 110 000	10b0

//
InnerLoop:
beq $1, $2, 10	0100 001 010 001 010	428a
lw $7, 0($6)	0010 110 111 000 000	2dc0
lw $3, 0($1)	0010 001 011 000 000	22c0
slt $4, $3, $7	0001 011 111 100 010	17e2
blez $4, 3	1101 100 000 000 011	d803
addi $1, $1, 1	1000 001 001 000 001	8241
j 5	1001 000 000 000 110	9005

//To get the max number in the array in the last index of the array
UpdateMax:
add $6, $0, $1	0001 000 001 110 000	1070
addi $1, $1, 1	1000 001 001 000 001	8241
j 5	1001 000 000 000 110	9005

//To swap two element of the arrays
Swap:
lw $3, 0($2)	0010 010 011 000 000	24c0
lw $7, 0($6)	0010 110 111 000 000	2dc0
sw $7, 0($2)	0011 010 111 000 000	35c0
sw $3, 0($6)	0011 110 011 000 000	3cc0
addi $2, $2, -1	1000 010 010 111 111	84bf
j 2	1001 000 000 000 011 	9002