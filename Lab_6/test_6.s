	.file	"test_6.c"
	.text
	.p2align 4
	.globl	func
	.type	func, @function
func:
.LFB11:
	.cfi_startproc
	movl	%edi, %eax
	cmpl	$2, %edi
	je	.L2
	jle	.L16
	cmpl	$3, %edi
	je	.L2
	cmpl	$400, %edi
	jne	.L5
	movl	$4, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L16:
	testl	%edi, %edi
	je	.L2
	cmpl	$1, %edi
	jne	.L5
.L2:
	ret
.L5:
	orl	$-1, %eax
	ret
	.cfi_endproc
.LFE11:
	.size	func, .-func
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Number: "
.LC1:
	.string	"%d"
.LC2:
	.string	"\nTest function:"
.LC3:
	.string	"Function returned %d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB12:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	leaq	.LC0(%rip), %rdi
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	call	printf@PLT
	leaq	4(%rsp), %rsi
	leaq	.LC1(%rip), %rdi
	xorl	%eax, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	movl	4(%rsp), %esi
	cmpl	$2, %esi
	je	.L18
	jle	.L33
	cmpl	$3, %esi
	je	.L18
	cmpl	$400, %esi
	jne	.L22
	movl	$4, %esi
.L18:
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rdi
	call	printf@PLT
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L34
	xorl	%eax, %eax
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L33:
	.cfi_restore_state
	testl	%esi, %esi
	je	.L18
	cmpl	$1, %esi
	je	.L18
.L22:
	orl	$-1, %esi
	jmp	.L18
.L34:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE12:
	.size	main, .-main
	.ident	"GCC: (GNU) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
