	.equ	write_64, 0x01	# write data to file function
	.equ	exit_64, 0x3C	# exit program function
	.equ	stdout, 0x01	# handle to stdout

	.data

name:
    .ascii "Krzysztof\n"

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
    movb name,%r15b
    subb $('A'-1),%r15b

print_imie:
    disp_str_64 $stdout, $name, $10
    dec %r15b
    jnz print_imie
    exit_prog_64 $0
