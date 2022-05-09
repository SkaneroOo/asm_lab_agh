#----------------------------------------------------------------
# Program lab_2.s - Architektury komputer�w
#----------------------------------------------------------------
#
#  To compile: as -o lab_2.o lab_2.s
#  To link:    ld -o lab_2 lab_2.o
#  To run:     ./lab_2
#
#----------------------------------------------------------------

	.equ	write_64, 0x01	# write data to file function
	.equ	exit_64, 0x3C	# exit program function
	.equ	stdout, 0x01	# handle to stdout


	.data
	
hex_str:
	.ascii	"00 "		# hex code string
new_line:
	.ascii	"\n"		# new line
tmp:
	.byte	0		# tmp variable


	.text
	.global _start

	.macro disp_str_64 file_id, address, length
	mov $write_64, %rax
	mov \file_id, %rdi
	mov \address, %rsi
	mov \length, %rdx
	syscall
	.endm

	.macro exit_prog_64 exit_code
	mov $exit_64, %rax
	mov \exit_code, %rdi
	syscall
	.endm
	
_start:
	mov $256, %r15		# loop counter = 256;
	xor %r14, %r14		# number = 0;

again:
 	mov %r14b, %al
	mov $1, %cl
	mov hex_str,%rdi
    call num2hex		# ax = hex_code( al );
 	movw %ax,hex_str

	disp_str_64 $stdout, $hex_str, $3

	inc %r14		# number++;

 	mov %r14, %rax		# if( !(number % 16) ) newline();
	and $15, %rax
	jnz skip
	disp_str_64 $stdout, $new_line, $1
skip:

#	inc %r14		# number++;

	dec %r15		# counter--;
	jnz again

theend:
	exit_prog_64 $0		# exit program


#----------------------------------------------------------------
# num2hex - converts byte to hexadecimal number
#----------------------------------------------------------------

	.type num2hex,@function

num2hex:
	MOV %rax,%rdi

next_byte:
	call byte2hex
	MOVW %ax, (%rdi)
	SUB $2,%rdi
	shr $8,%rdx
	mov %rdx,%rax
	dec %cl
	jnz next_byte

	ret


	.type byte2hex,@function

byte2hex:
	MOVB	%al,tmp

	ANDB	$0x0F,%al
	ADDB	$'0',%al
	CMPB	$'9',%al
#	JNBE	over91
	JLE		insert1
over91:
	ADDB	$('A'-'9'-1),%al
insert1:
	MOVB	%al,%ah

	SHRB	$4,tmp
	MOVB	tmp,%al		# second nibble
	ADDB	$'0',%al
	CMPB	$'9',%al
	JLE		insert2
over92:
	ADDB	$('A'-'9'-1),%al
insert2:
	RET
	
