#Count Number Of Ones
This test's purpose is to count the number of ones of a given number in binary.


First adding the number to register $2 and the shift amount in $1
addi $2,$0,31
addi $1, $1, 1

then compare the value to less than zero in register $5 and start the loop label here
slt $5, $0, $2

then set the loop condi. to exit when the number equals 0
beq $5, $0 ,7

then see if the first bit is 1 or not by anding it with 1
andi $3,$2,0x01

and then add the result of anding to register $7
add $7,$3,$7

finally shift right logical of the number and jump back to loop 
srl $2,$2,1
j loop