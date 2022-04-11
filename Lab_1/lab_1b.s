#----------------------------------------------------------------
# Program lab_1b.s - Architektury Komputer�w
#----------------------------------------------------------------
#
#  To compile: as -o lab_1b.o lab_1b.s
#  To link:    ld -o lab_1b lab_1b.o
#  To run:     ./lab_1b
#
#----------------------------------------------------------------

	.equ	write_64,0x01	# write data to file function
	.equ	exit_64,0x3C	# exit program function

	.equ	stdout, 0x01	# handle to stdout
	.data
	
txt_A:
	.ascii	"A\n"		# first message

counter:
	.byte 0

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
	# mov $5, %r15
	movb $26, counter

again:
	disp_str_64 $stdout, $txt_A, $2

	incb txt_A
	decb counter
	jnz again

theend:
	exit_prog_64 $0		# exit program

