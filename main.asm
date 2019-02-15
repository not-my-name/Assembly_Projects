##
##	Program name:	main.asm

##
##	The function calling_functoin is just an 'interface' that is used to 
##	call other functions that have been written in Assembly.

#################################################
#                                               #
#               text segment                    #
#                                               #
#################################################

	.text
.globl __main
.extern sum_to_n.asm

__main:									# start execution of program
	
	# print input prompt to screen
	la $a0, input_string				# load the value that is going to be printed by the syscall
	li $v0, 4							# load the syscall instruction to print string
	syscall								# execute input prompt	

	# read the user's input
	li $v0, 5							# load the 'read_int' syscall instruction
	syscall								# execute read_int input, stores the value in $v0

	# call the external sum_to_n function 
	jal sum_to_n						# jump to the sum_to_n function and link this function as the calling function. sum_to_n stores result in $v0

	move $t0, $v0						# save the result of sum_to_n in $v0. $v0 needs to be used 

	# print the output_string
	la $a0, output_string				# load the address of variable 'output_string' into $a0 (this is the argument that is going to be used by the syscall)
	li $v0, 1							# load the syscall instruction
	syscall

	# print the result of sum_to_n
	move $a0, $t0						# move the 'saved' result into arg register to print to screen
	li $v0, 1							# load the 'print_int' syscall instruction
	syscall

	# print a new line
	la $a, new_line						# load the new_line_character variable's memory address into argument register for the syscall
	li $v0, 4							# load the syscall instruction
	syscall

	# end the program
	li $v0, 10							# load the exit instruction
	syscall

#################################################
#  						#
#               data segment			#           
#						#
#################################################
	.data
input_string:	.asciiz	"Enter an integer (N): "
output_string:		.asciiz	"The answer is: "
new_line:	.asciiz	"\n"

##
##	EoF