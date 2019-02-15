	.globl main
	.data									# Variable declarations follow this line
my_var:	.word	12
Z:		.word	0

	.text									# All program code is placed after this .text assembler directive

main:
	li $t2, 10								# Load immediate value (10) into register $t2
	lw $t3, my_var							# Load the word stored in the var 'my_var' (see the variables above in '.data')
	add $a0, $t2, $t3						# Sum the values stored in t2 and t3, save the result in $a0. Storing in a0 so as to print the result to console

	# Print the result of the addition
	li $v0, 1								# Load the 'printInt' syscall into the register used for syscall arguments
	syscall
	
	# Exit the program
	li $v0, 10								# Loads the number 10 into register V0, when calling syscall, ends the program 
	syscall