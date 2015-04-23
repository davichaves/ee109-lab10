# ee109_palindrome.s
# Name:  Davi Rodrigues Chaves
#  

	.data
buf1:   .space  22                 # receive original input in this buffer
counts: .byte 0,0,0,0,0,0,0,0,0,0  # array of counts for digits 0-9
                                   # useful for finding the mode digit

# the following are constant strings that you can use
# for your prompts and messages... use syscall with $v0=4
msgin:  .asciiz "Enter up to 20 digits without spaces: "
msg1:   .asciiz "Your string: "
msg2:   .asciiz " IS a palindrome\n"
msg3:   .asciiz " IS NOT a palindrome\n"
msg4:   .asciiz "The mode digit is: "

# print this string for a newline character
nline:  .asciiz "\n"


	.text
main:
	li	$v0, 4		# Print the prompt
	la	$a0, msgin
	syscall
	li	$v0, 8		# Get the string from the user
	la	$a0, buf1
	li	$a1, 22
	syscall

	# this syscall will keep the newline character on the end of the string
	# so we will know we're at the end of a string when we hit the newline
	# newline = '\n' = 0x0a

	addi	$t1, $zero, 0x0a	# Set $t1 = '\n' = 0x0a
	add	$t2, $zero, $zero	# Set $t2 = 0 
	la	$a0, buf1
	la	$a1, counts
	la	$a3, buf1
L1:	lb	$t0, 0($a0)	# load buf1[i]
	beq	$t0, $t1, L2	# stop when you load the newline (=0x0a)
	addi 	$t0, $t0, -48
	add 	$t0, $t0, $a1
	lb	$a2, 0($t0)
	addi	$a2, $a2, 1
	sb	$a2, 0($t0)
	addiu	$t2, $t2, 1	# increment counter by 1
	addi	$a0, $a0, 1	# increment pointer to next byte
	b	L1
	
# checking if it's a palindrome
L2:	addi	$a0, $a0, -1
L5:	lb	$t5, 0($a0)
	lb	$t4, 0($a3)
	bne 	$t4, $t5, L3 	# branch if not a palindrome
	addi	$a0, $a0, -1
	addi	$a3, $a3, 1
	blt 	$a0, $a3, L4
	b 	L5
	
#not a palindrome
L3:     li	$v0, 4		# print the STRING
	la	$a0, buf1
	syscall
	li	$v0, 4		# print out message
	la	$a0, msg3
	syscall
	
	b 	L8
	
#is a palindrome
L4:	li	$v0, 4		# print the STRING
	la	$a0, buf1
	syscall
	li	$v0, 4		# print out message
	la	$a0, msg2
	syscall

L8:	# exit
	add	$t2, $zero, $zero # t2 is the counter
	add	$t3, $zero, $zero # t3 is the mode
	add	$s1, $zero, $zero
L6:	lb	$t4, 0($a1)
	blt 	$t4, $t3, L7
	add	$t3, $t4, $zero
	add	$s1, $t2, $zero		
L7:	addi	$t2, $t2, 1
	addi	$a1, $a1, 1
	blt 	$t2, 10, L6
	li	$v0, 4		# print out message
	la	$a0, msg4
	syscall
	li	$v0, 1		# print out message
	add	$a0, $s1, $zero
	syscall
	li	$v0, 10
	syscall