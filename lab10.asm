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

	# a lot more of your code



	# exit
	li	$v0,10
	syscall# ee109_palindrome.s
# Name:  _______________________
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

	# a lot more of your code



	# exit
	li	$v0,10
	syscall
