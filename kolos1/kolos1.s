	.file	"kolos1.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Suma = %d,  elementow <0 = %d\n"
	.align 8
.LC1:
	.string	"Krzysztof Majerczyk-Marchewka nr %d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB11:
	.cfi_startproc
	subq	$88, %rsp
	.cfi_def_cfa_offset 96
	movl	$6, %esi
	xorl	%r8d, %r8d
	movq	%fs:40, %rax
	movq	%rax, 72(%rsp)
	movabsq	$-12884901884, %rax
	leaq	60(%rsp), %rcx
	movq	%rax, 4(%rsp)
	movabsq	$-21474836477, %rax
	movq	%rax, 12(%rsp)
	movabsq	$30064771081, %rax
	movq	%rax, 20(%rsp)
	movabsq	$-8589934591, %rax
	movq	%rax, 28(%rsp)
	movabsq	$-12884901880, %rax
	movq	%rax, 36(%rsp)
	movabsq	$38654705669, %rax
	movq	%rax, 44(%rsp)
	movabsq	$12884901887, %rax
	movq	%rax, 52(%rsp)
	leaq	4(%rsp), %rax
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L4:
	movl	(%rax), %edx
	addl	%edx, %esi
	cmpl	$-2147483648, %edx
	sbbl	$-1, %r8d
	addq	$4, %rax
.L2:
	cmpq	%rax, %rcx
	jne	.L4
	leaq	.LC0(%rip), %rdi
	xorl	%eax, %eax
	movl	%r8d, %edx
	call	printf@PLT
	xorl	%eax, %eax
	movl	$410066, %esi
	leaq	.LC1(%rip), %rdi
	call	printf@PLT
	movq	72(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L8
	xorl	%eax, %eax
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L8:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE11:
	.size	main, .-main
	.ident	"GCC: (GNU) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
