#----------------------------------------------------------------
# Program lab_5.s - Architektury Komputer�w
#----------------------------------------------------------------
#
#  To compile&link: gcc -no-pie -o lab_5 lab_5.s
#  To run:     ./lab_5
#
#----------------------------------------------------------------




#----------------------------------------------------------------
# gcd - computes greatest common divisor
#	Arguments:	%rdi - first number
#			%rsi - second number
#	Returns:	%rax - gcd value
#----------------------------------------------------------------

	.type gcd, @function
	.global gcd

gcd:
	cmp %rdi, %rsi		# (a==b)?
	jz computed		# yes
	jb b_below_a		# if(b < a) goto b_below_a
	sub %rdi, %rsi		# else b=b-a
	jmp gcd
b_below_a:
	sub %rsi, %rdi		# a=a-b
	jmp gcd		
computed:
	mov %rdi, %rax		# result (a==b)
	ret

