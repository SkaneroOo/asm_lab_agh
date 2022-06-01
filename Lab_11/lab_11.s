	.file	"lab_11.c"
	.text
	.p2align 4
	.globl	dgemm_naive
	.type	dgemm_naive, @function
dgemm_naive:
.LFB12:
	.cfi_startproc
	testl	%edi, %edi
	jle	.L15
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	%edi, %eax
	movl	%edi, %r15d
	movq	%rsi, %r11
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	andl	$-2, %eax
	shrl	%r15d
	movq	%rdx, %r10
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rsi, %r14
	movq	%rcx, %rdx
	salq	$4, %r15
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	xorl	%r9d, %r9d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movslq	%edi, %rbx
	leaq	0(,%rbx,8), %rsi
	salq	$4, %rbx
	movl	%eax, -20(%rsp)
	movl	%edi, %eax
	andl	$1, %eax
	movl	%eax, -24(%rsp)
	.p2align 4,,10
	.p2align 3
.L3:
	movq	%rdx, %rbp
	movq	%rdx, -16(%rsp)
	movq	%r10, %r12
	xorl	%ecx, %ecx
	movsd	0(%rbp), %xmm1
	xorl	%r13d, %r13d
	cmpl	$1, %edi
	je	.L8
	.p2align 4,,10
	.p2align 3
.L20:
	leaq	(%r15,%r12), %r8
	movq	%r14, %rdx
	movq	%r12, %rax
	.p2align 4,,10
	.p2align 3
.L5:
	movsd	(%rdx), %xmm0
	movupd	(%rax), %xmm3
	addq	$16, %rax
	movhpd	(%rdx,%rsi), %xmm0
	addq	%rbx, %rdx
	mulpd	%xmm3, %xmm0
	addsd	%xmm0, %xmm1
	unpckhpd	%xmm0, %xmm0
	addsd	%xmm0, %xmm1
	cmpq	%rax, %r8
	jne	.L5
	movl	-24(%rsp), %eax
	testl	%eax, %eax
	je	.L6
	movl	-20(%rsp), %eax
.L4:
	movl	%edi, %edx
	imull	%eax, %edx
	addl	%ecx, %eax
	cltq
	addl	%r9d, %edx
	movslq	%edx, %rdx
	movsd	(%r11,%rdx,8), %xmm0
	mulsd	(%r10,%rax,8), %xmm0
	addsd	%xmm0, %xmm1
.L6:
	leal	1(%r13), %eax
	movsd	%xmm1, 0(%rbp)
	addl	%edi, %ecx
	addq	%rsi, %rbp
	addq	%rsi, %r12
	cmpl	%eax, %edi
	je	.L19
	movsd	0(%rbp), %xmm1
	movl	%eax, %r13d
	cmpl	$1, %edi
	jne	.L20
.L8:
	xorl	%eax, %eax
	jmp	.L4
.L19:
	movq	-16(%rsp), %rdx
	leal	1(%r9), %eax
	addq	$8, %r14
	addq	$8, %rdx
	cmpl	%r9d, %r13d
	je	.L1
	movl	%eax, %r9d
	jmp	.L3
.L1:
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L15:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	ret
	.cfi_endproc
.LFE12:
	.size	dgemm_naive, .-dgemm_naive
	.p2align 4
	.globl	dgemm_unroll4
	.type	dgemm_unroll4, @function
dgemm_unroll4:
.LFB13:
	.cfi_startproc
	movl	%edi, %r9d
	testl	%edi, %edi
	jle	.L38
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdx, %rdi
	movl	%r9d, %edx
	leal	(%r9,%r9), %r10d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	shrl	%edx
	movq	%rsi, %r8
	movslq	%r10d, %r10
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	salq	$4, %rdx
	movq	%rcx, %rax
	salq	$3, %r10
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	xorl	%r14d, %r14d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%r9d, %ebx
	andl	$-2, %ebx
	movl	%ebx, -20(%rsp)
	movl	%r9d, %ebx
	andl	$1, %ebx
	movq	%rdx, -32(%rsp)
	movl	%ebx, -24(%rsp)
	movq	%rsi, -40(%rsp)
	movslq	%r9d, %rsi
	salq	$3, %rsi
	.p2align 4,,10
	.p2align 3
.L23:
	movl	$0, -48(%rsp)
	movq	%rdi, %r11
	movq	%rax, %rbp
	xorl	%ecx, %ecx
	movq	%rax, -16(%rsp)
	leal	1(%r14), %r13d
	leaq	(%rsi,%rax), %r12
	.p2align 4,,10
	.p2align 3
.L29:
	leal	(%rcx,%r9), %ebx
	cmpl	$1, %r9d
	je	.L30
	pxor	%xmm4, %xmm4
	movl	%ecx, -44(%rsp)
	movq	-40(%rsp), %rax
	xorl	%edx, %edx
	movq	-32(%rsp), %rcx
	leaq	(%rsi,%r11), %r15
	movapd	%xmm4, %xmm3
	movapd	%xmm4, %xmm2
	movapd	%xmm4, %xmm1
	.p2align 4,,10
	.p2align 3
.L25:
	movsd	(%rax), %xmm0
	movupd	(%r11,%rdx), %xmm5
	movupd	(%r15,%rdx), %xmm7
	movsd	8(%rax), %xmm6
	movhpd	(%rax,%rsi), %xmm0
	mulpd	%xmm0, %xmm5
	movhpd	8(%rsi,%rax), %xmm6
	addq	%r10, %rax
	mulpd	%xmm7, %xmm0
	addsd	%xmm5, %xmm1
	unpckhpd	%xmm5, %xmm5
	addsd	%xmm0, %xmm3
	unpckhpd	%xmm0, %xmm0
	addsd	%xmm5, %xmm1
	movupd	(%r11,%rdx), %xmm5
	addq	$16, %rdx
	addsd	%xmm0, %xmm3
	movapd	%xmm7, %xmm0
	mulpd	%xmm6, %xmm5
	mulpd	%xmm6, %xmm0
	addsd	%xmm5, %xmm2
	unpckhpd	%xmm5, %xmm5
	addsd	%xmm0, %xmm4
	unpckhpd	%xmm0, %xmm0
	addsd	%xmm5, %xmm2
	addsd	%xmm0, %xmm4
	cmpq	%rdx, %rcx
	jne	.L25
	movl	-24(%rsp), %eax
	movl	-44(%rsp), %ecx
	testl	%eax, %eax
	je	.L24
	movl	-20(%rsp), %eax
.L28:
	movl	%r9d, %edx
	addl	%eax, %ecx
	imull	%eax, %edx
	movslq	%ecx, %rcx
	addl	%ebx, %eax
	movsd	(%rdi,%rcx,8), %xmm0
	cltq
	leal	(%r14,%rdx), %r15d
	movapd	%xmm0, %xmm6
	addl	%r13d, %edx
	movslq	%r15d, %r15
	movslq	%edx, %rdx
	movsd	(%r8,%r15,8), %xmm5
	mulsd	%xmm5, %xmm6
	addsd	%xmm6, %xmm1
	movsd	(%r8,%rdx,8), %xmm6
	mulsd	%xmm6, %xmm0
	addsd	%xmm0, %xmm2
	movsd	(%rdi,%rax,8), %xmm0
	mulsd	%xmm0, %xmm5
	mulsd	%xmm6, %xmm0
	addsd	%xmm5, %xmm3
	addsd	%xmm0, %xmm4
.L24:
	addsd	0(%rbp), %xmm1
	addl	$2, -48(%rsp)
	leal	(%r9,%rbx), %ecx
	addq	%r10, %r11
	addsd	8(%rbp), %xmm2
	movl	-48(%rsp), %eax
	movsd	%xmm1, 0(%rbp)
	movsd	%xmm2, 8(%rbp)
	addsd	(%r12), %xmm3
	addsd	8(%r12), %xmm4
	addq	%r10, %rbp
	movsd	%xmm3, (%r12)
	movsd	%xmm4, 8(%r12)
	addq	%r10, %r12
	cmpl	%eax, %r9d
	jg	.L29
	movq	-16(%rsp), %rax
	addl	$2, %r14d
	addq	$16, -40(%rsp)
	addq	$16, %rax
	cmpl	%r14d, %r9d
	jg	.L23
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L30:
	.cfi_restore_state
	pxor	%xmm4, %xmm4
	xorl	%eax, %eax
	movapd	%xmm4, %xmm3
	movapd	%xmm4, %xmm2
	movapd	%xmm4, %xmm1
	jmp	.L28
.L38:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	ret
	.cfi_endproc
.LFE13:
	.size	dgemm_unroll4, .-dgemm_unroll4
	.p2align 4
	.globl	dgemm_blocked
	.type	dgemm_blocked, @function
dgemm_blocked:
.LFB14:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$32, %rsp
	.cfi_def_cfa_offset 88
	movq	%rsi, -56(%rsp)
	testl	%edi, %edi
	jle	.L41
	movl	nb(%rip), %r9d
	movl	%edi, %r14d
	movq	%rcx, %rsi
	movq	%rdx, %r13
	movl	$0, -16(%rsp)
	movl	%r14d, %r15d
	movl	%r9d, %eax
	movl	%r9d, -48(%rsp)
	imull	%edi, %eax
	movl	%eax, -12(%rsp)
	movslq	%edi, %rax
	leaq	0(,%rax,8), %rdi
	salq	$4, %rax
	movq	%rax, -80(%rsp)
	movq	%rdi, %rcx
.L43:
	movslq	-16(%rsp), %rdi
	movl	-48(%rsp), %ebx
	movl	$0, -60(%rsp)
	movl	%r9d, %r14d
	cmpl	%ebx, %edi
	jnb	.L53
	movl	-60(%rsp), %eax
	movq	%r13, %rbp
	movl	%r14d, %r13d
	movq	%rcx, %r14
.L55:
	cmpl	%r13d, %eax
	jnb	.L51
	imull	%r15d, %eax
	movl	%r9d, %ebx
	xorl	%edx, %edx
	xorl	%r12d, %r12d
	movslq	%eax, %rcx
	movl	%eax, -44(%rsp)
	leaq	(%rcx,%rdi), %rax
	leaq	(%rsi,%rax,8), %rax
	movq	%rax, -24(%rsp)
.L54:
	movq	-56(%rsp), %r11
	movslq	%edx, %rax
	movq	%rcx, -8(%rsp)
	addq	%rdi, %rax
	movl	%r9d, (%rsp)
	movl	-16(%rsp), %r8d
	leaq	(%r11,%rax,8), %rax
	movl	%ebx, %r11d
	movl	%edx, 4(%rsp)
	movq	%rax, -112(%rsp)
	movslq	%r12d, %rax
	subl	%r12d, %r11d
	addq	%rcx, %rax
	movl	%r11d, -100(%rsp)
	leaq	0(%rbp,%rax,8), %rax
	movq	%rsi, 8(%rsp)
	movq	%rax, -40(%rsp)
	movl	%r11d, %eax
	shrl	%eax
	movq	%rdi, 16(%rsp)
	salq	$4, %rax
	movq	%rax, -88(%rsp)
	movl	%r11d, %eax
	andl	$-2, %r11d
	movl	%r11d, %r10d
	addl	%r12d, %r10d
	cmpl	$1, %eax
	cmove	%r12d, %r10d
	andl	$1, %eax
	movl	%eax, -28(%rsp)
	movl	%r10d, %r11d
	imull	%r15d, %r11d
	movl	%r11d, -32(%rsp)
	movq	-24(%rsp), %r11
	.p2align 4,,10
	.p2align 3
.L52:
	movl	-32(%rsp), %eax
	movq	-56(%rsp), %rsi
	movq	%r11, -72(%rsp)
	movq	-40(%rsp), %rdx
	movl	-44(%rsp), %ecx
	movl	%r8d, -64(%rsp)
	addl	%r8d, %eax
	cltq
	leaq	(%rsi,%rax,8), %r9
	movl	-60(%rsp), %esi
	movq	%r11, %rax
	.p2align 4,,10
	.p2align 3
.L49:
	movsd	(%rax), %xmm0
	cmpl	%ebx, %r12d
	jnb	.L44
	cmpl	$1, -100(%rsp)
	je	.L45
	movq	-88(%rsp), %rdi
	movq	-112(%rsp), %r8
	movq	%rax, -96(%rsp)
	leaq	(%rdi,%rdx), %r11
	movq	%rdx, %rdi
.L46:
	movsd	(%r8), %xmm2
	movupd	(%rdi), %xmm3
	addq	$16, %rdi
	movq	-80(%rsp), %rax
	movhpd	(%r8,%r14), %xmm2
	mulpd	%xmm3, %xmm2
	addq	%rax, %r8
	addsd	%xmm2, %xmm0
	unpckhpd	%xmm2, %xmm2
	addsd	%xmm2, %xmm0
	cmpq	%r11, %rdi
	jne	.L46
	movl	-28(%rsp), %edi
	movq	-96(%rsp), %rax
	testl	%edi, %edi
	je	.L44
.L45:
	leal	(%rcx,%r10), %edi
	movslq	%edi, %rdi
	movsd	0(%rbp,%rdi,8), %xmm1
	mulsd	(%r9), %xmm1
	addsd	%xmm1, %xmm0
.L44:
	addl	$1, %esi
	movsd	%xmm0, (%rax)
	addl	%r15d, %ecx
	addq	%r14, %rax
	addq	%r14, %rdx
	cmpl	%r13d, %esi
	jne	.L49
	movl	-64(%rsp), %r8d
	movq	-72(%rsp), %r11
	movl	-48(%rsp), %eax
	addq	$8, -112(%rsp)
	addl	$1, %r8d
	addq	$8, %r11
	cmpl	%eax, %r8d
	jne	.L52
	movl	(%rsp), %r9d
	movl	4(%rsp), %edx
	movl	-12(%rsp), %eax
	movq	-8(%rsp), %rcx
	addl	%r9d, %r12d
	movq	8(%rsp), %rsi
	movq	16(%rsp), %rdi
	addl	%r9d, %ebx
	addl	%eax, %edx
	cmpl	%r12d, %r15d
	jg	.L54
.L51:
	addl	%r9d, -60(%rsp)
	movl	-60(%rsp), %eax
	addl	%r9d, %r13d
	cmpl	%eax, %r15d
	jg	.L55
	movq	%r14, %rcx
	movq	%rbp, %r13
.L53:
	addl	%r9d, -16(%rsp)
	movl	-16(%rsp), %eax
	addl	%r9d, -48(%rsp)
	cmpl	%eax, %r15d
	jg	.L43
.L41:
	addq	$32, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE14:
	.size	dgemm_blocked, .-dgemm_blocked
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"%.3f\n"
.LC4:
	.string	"%.3lf\n"
.LC7:
	.string	"Error!"
.LC8:
	.string	"Error at %d = %lf!\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB11:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leaq	a(%rip), %r8
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leaq	d(%rip), %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	leaq	b(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	leaq	c(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	$128, %ebx
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	movdqa	.LC2(%rip), %xmm6
	movdqa	.LC1(%rip), %xmm9
	movq	%fs:40, %rax
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	leaq	56(%rsp), %rax
	movl	$4, 24(%rsp)
	leaq	32(%rsp), %r15
	movq	%rax, 8(%rsp)
.L83:
	movl	%ebx, %r12d
	movd	%ebx, %xmm5
	movl	%ebx, %esi
	xorl	%r9d, %r9d
	pshufd	$0, %xmm5, %xmm5
	imull	%ebx, %r12d
	shrl	$2, %esi
	xorl	%edi, %edi
	movdqa	%xmm5, %xmm10
	salq	$5, %rsi
	psrlq	$32, %xmm10
	.p2align 4,,10
	.p2align 3
.L71:
	movd	%edi, %xmm3
	movl	%r9d, %edx
	movdqa	%xmm9, %xmm2
	xorl	%eax, %eax
	salq	$3, %rdx
	pshufd	$0, %xmm3, %xmm4
	movd	%r9d, %xmm3
	leaq	(%r8,%rdx), %rcx
	pshufd	$0, %xmm3, %xmm3
	addq	%r13, %rdx
	.p2align 4,,10
	.p2align 3
.L72:
	movdqa	%xmm2, %xmm1
	paddd	%xmm6, %xmm2
	movdqa	%xmm1, %xmm11
	movdqa	%xmm1, %xmm0
	paddd	%xmm3, %xmm1
	psrlq	$32, %xmm11
	pmuludq	%xmm5, %xmm0
	pmuludq	%xmm10, %xmm11
	pshufd	$8, %xmm0, %xmm0
	pshufd	$8, %xmm11, %xmm11
	punpckldq	%xmm11, %xmm0
	paddd	%xmm4, %xmm0
	cvtdq2pd	%xmm0, %xmm11
	pshufd	$238, %xmm0, %xmm0
	movaps	%xmm11, (%rcx,%rax)
	cvtdq2pd	%xmm0, %xmm0
	movaps	%xmm0, 16(%rcx,%rax)
	cvtdq2pd	%xmm1, %xmm0
	pshufd	$238, %xmm1, %xmm1
	movaps	%xmm0, (%rdx,%rax)
	cvtdq2pd	%xmm1, %xmm1
	movaps	%xmm1, 16(%rdx,%rax)
	addq	$32, %rax
	cmpq	%rsi, %rax
	jne	.L72
	addl	$1, %edi
	addl	%ebx, %r9d
	cmpl	%ebx, %edi
	jne	.L71
	xorl	%eax, %eax
	call	init_time@PLT
	movq	%rbp, %rcx
	movq	%r13, %rdx
	movl	%ebx, %edi
	leaq	a(%rip), %r8
	movq	%r8, %rsi
	call	dgemm_naive
	movq	%r15, %rdi
	call	read_time@PLT
	movsd	40(%rsp), %xmm0
	movl	$1, %eax
	leaq	.LC3(%rip), %rdi
	call	printf@PLT
	xorl	%eax, %eax
	call	init_time@PLT
	movq	%r14, %rcx
	movq	%r13, %rdx
	movl	%ebx, %edi
	leaq	a(%rip), %r8
	movq	%r8, %rsi
	call	dgemm_unroll4
	movq	8(%rsp), %rdi
	call	read_time@PLT
	movsd	64(%rsp), %xmm0
	movl	$1, %eax
	leaq	.LC4(%rip), %rdi
	call	printf@PLT
	movq	.LC6(%rip), %rdi
	xorl	%eax, %eax
	movq	.LC5(%rip), %xmm8
	movq	%rdi, %xmm7
	jmp	.L77
	.p2align 4,,10
	.p2align 3
.L93:
	addq	$1, %rax
	cmpl	%r12d, %eax
	jnb	.L96
.L77:
	movsd	0(%rbp,%rax,8), %xmm0
	subsd	(%r14,%rax,8), %xmm0
	andpd	%xmm8, %xmm0
	comisd	%xmm7, %xmm0
	jbe	.L93
	leaq	.LC7(%rip), %rdi
	call	puts@PLT
.L76:
	orl	$-1, %eax
.L70:
	movq	104(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L97
	addq	$120, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L96:
	.cfi_restore_state
	movl	$4, %r9d
	movl	$9, %r10d
	movq	%r15, 16(%rsp)
	movl	%ebx, %r15d
	movl	%r9d, %ebx
	movl	%r12d, %r9d
	movl	%r10d, %r12d
	jmp	.L82
	.p2align 4,,10
	.p2align 3
.L78:
	addl	%ebx, %ebx
	subl	$1, %r12d
	je	.L98
.L82:
	cmpl	%r15d, %ebx
	jnb	.L78
	xorl	%eax, %eax
	movl	%r9d, 28(%rsp)
	movl	%ebx, nb(%rip)
	call	init_time@PLT
	leaq	a(%rip), %r8
	movq	%r13, %rdx
	movl	%r15d, %edi
	leaq	e(%rip), %rcx
	movq	%r8, %rsi
	call	dgemm_blocked
	leaq	80(%rsp), %rdi
	call	read_time@PLT
	movsd	88(%rsp), %xmm0
	movl	$1, %eax
	leaq	.LC4(%rip), %rdi
	call	printf@PLT
	movq	.LC6(%rip), %rax
	xorl	%esi, %esi
	movl	28(%rsp), %r9d
	movq	.LC5(%rip), %xmm8
	leaq	e(%rip), %rcx
	movq	%rax, %xmm7
	jmp	.L81
	.p2align 4,,10
	.p2align 3
.L94:
	movq	$0x000000000, (%rcx,%rsi,8)
	addq	$1, %rsi
	cmpl	%r9d, %esi
	jnb	.L78
.L81:
	movsd	0(%rbp,%rsi,8), %xmm0
	subsd	(%rcx,%rsi,8), %xmm0
	andpd	%xmm8, %xmm0
	comisd	%xmm7, %xmm0
	jbe	.L94
	leaq	.LC8(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	jmp	.L76
.L98:
	movl	%r9d, %edx
	movl	$8, %eax
	movq	%rbp, %rdi
	movl	%r15d, %ebx
	movq	%rdx, %r12
	salq	$3, %rdx
	movq	16(%rsp), %r15
	testl	%r12d, %r12d
	cmove	%rax, %rdx
	xorl	%esi, %esi
	addl	%ebx, %ebx
	movq	%rdx, 16(%rsp)
	call	memset@PLT
	movq	16(%rsp), %rdx
	xorl	%esi, %esi
	movq	%r14, %rdi
	call	memset@PLT
	subl	$1, 24(%rsp)
	movdqa	.LC1(%rip), %xmm9
	leaq	a(%rip), %r8
	movdqa	.LC2(%rip), %xmm6
	jne	.L83
	xorl	%eax, %eax
	jmp	.L70
.L97:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE11:
	.size	main, .-main
	.text
	.p2align 4
	.globl	block
	.type	block, @function
block:
.LFB15:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edi, %ebx
	movl	nb(%rip), %edi
	leal	(%rsi,%rdi), %eax
	movl	%edx, -20(%rsp)
	movl	%ecx, -72(%rsp)
	movq	%r8, -16(%rsp)
	movl	%edi, -68(%rsp)
	movl	%eax, -36(%rsp)
	cmpl	%eax, %esi
	jnb	.L99
	leal	(%rdi,%rdx), %r14d
	movl	%ecx, %ebp
	leal	(%rdi,%rcx), %r15d
	cmpl	%r14d, %edx
	jnb	.L99
	imull	%ebx, %edx
	movq	56(%rsp), %rax
	movl	%esi, %r10d
	movslq	%esi, %rsi
	movslq	%ebx, %r11
	movslq	%edx, %rcx
	movl	%edx, -24(%rsp)
	leaq	(%rcx,%rsi), %rdx
	leaq	(%rax,%rdx,8), %rdx
	movl	%ebp, %eax
	imull	%ebx, %eax
	cltq
	addq	%rsi, %rax
	leaq	0(,%r11,8), %rsi
	salq	$4, %r11
	leaq	(%r8,%rax,8), %rax
	movq	%rax, -80(%rsp)
	movslq	%ebp, %rax
	addq	%rcx, %rax
	leaq	(%r9,%rax,8), %rax
	movq	%rax, -32(%rsp)
	movl	%edi, %eax
	shrl	%eax
	salq	$4, %rax
	movq	%rax, -64(%rsp)
	movl	%edi, %eax
	andl	$-2, %edi
	movl	%edi, %r8d
	movl	%eax, %edi
	addl	%ebp, %r8d
	cmpl	$1, %eax
	cmove	%ebp, %r8d
	andl	$1, %edi
	movl	%edi, -48(%rsp)
	movl	%r8d, %eax
	imull	%ebx, %eax
	movl	%eax, -40(%rsp)
	.p2align 4,,10
	.p2align 3
.L101:
	movl	-40(%rsp), %eax
	movq	-16(%rsp), %rdi
	movq	%rdx, -56(%rsp)
	movq	%rdx, %rbp
	movq	-32(%rsp), %r12
	movl	-24(%rsp), %ecx
	movl	%r10d, -44(%rsp)
	addl	%r10d, %eax
	movl	-20(%rsp), %r13d
	cltq
	leaq	(%rdi,%rax,8), %rdi
	.p2align 4,,10
	.p2align 3
.L106:
	movsd	0(%rbp), %xmm1
	cmpl	%r15d, -72(%rsp)
	jnb	.L102
	cmpl	$1, -68(%rsp)
	je	.L103
	movq	-64(%rsp), %rax
	movq	-80(%rsp), %rdx
	leaq	(%rax,%r12), %r10
	movq	%r12, %rax
	.p2align 4,,10
	.p2align 3
.L104:
	movsd	(%rdx), %xmm0
	movupd	(%rax), %xmm3
	addq	$16, %rax
	movhpd	(%rdx,%rsi), %xmm0
	addq	%r11, %rdx
	mulpd	%xmm3, %xmm0
	addsd	%xmm0, %xmm1
	unpckhpd	%xmm0, %xmm0
	addsd	%xmm0, %xmm1
	cmpq	%r10, %rax
	jne	.L104
	movl	-48(%rsp), %eax
	testl	%eax, %eax
	je	.L102
.L103:
	leal	(%rcx,%r8), %eax
	cltq
	movsd	(%r9,%rax,8), %xmm0
	mulsd	(%rdi), %xmm0
	addsd	%xmm0, %xmm1
.L102:
	addl	$1, %r13d
	movsd	%xmm1, 0(%rbp)
	addl	%ebx, %ecx
	addq	%rsi, %rbp
	addq	%rsi, %r12
	cmpl	%r14d, %r13d
	jne	.L106
	movl	-44(%rsp), %r10d
	movq	-56(%rsp), %rdx
	movl	-36(%rsp), %eax
	addq	$8, -80(%rsp)
	addl	$1, %r10d
	addq	$8, %rdx
	cmpl	%eax, %r10d
	jne	.L101
.L99:
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE15:
	.size	block, .-block
	.globl	nb
	.bss
	.align 4
	.type	nb, @object
	.size	nb, 4
nb:
	.zero	4
	.local	e
	.comm	e,2097152,32
	.local	d
	.comm	d,2097152,32
	.local	c
	.comm	c,2097152,32
	.local	b
	.comm	b,2097152,32
	.local	a
	.comm	a,2097152,32
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC2:
	.long	4
	.long	4
	.long	4
	.long	4
	.align 16
.LC5:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC6:
	.long	-400107883
	.long	1041313291
	.ident	"GCC: (GNU) 12.1.0"
	.section	.note.GNU-stack,"",@progbits
