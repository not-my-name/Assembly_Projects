##
##	Program name:	sum_to_n.asm 

##
##	The function "sum_to_n" will calculate the sum of 
##	the integers from 1 to N (N will be passed to
##	the function "sum_to_n" in register $a0, and 
##	the sum will be returned in $v0).

##
##	The program will print out the final result sum.
##		
##		v0 - reads in an integer
##		t0 - holds the sum 
## 		a0 - points to strings to be printed 
##		   - also used to pass N to "sumup" 

#################################################
#                                               #
#               text segment                    #
#                                               #
#################################################

	.text
.globl __sum_to_n								# Global variable to indicate the start of the program

__sum_to_n:										# The start of the program execution

	li $v0, 0									# Initialize the sum to 0

	loop:
		add $v0, $v0, $a0						# $v0 = $v0 + $a0
		addi $a0, $a0, -1						# $a0 = $a0 - 1
		bnez $a0, loop							# branch to loop if $a0 != 0

		jr $ra									# return to the calling function (jump to return address $ra, stored by jal instruction)


#################################################
#  						#
#               data segment			#           
#						#
#################################################

        .data
	
	input_prompt:	.asciiz "Please enter an integer (N):  "
	ans1:			.asciiz "The sum is: "
	endl:			.asciiz "\n"	   

## EOF