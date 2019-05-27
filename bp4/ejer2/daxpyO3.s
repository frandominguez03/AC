	.file	"daxpy.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Faltan no componentes del vector"
	.align 8
.LC8:
	.string	"Tiempo(seg.):%11.9f\t / Tama\303\261o Vectores:%u\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC9:
	.string	"A[0] = %f // A[N-1] = %f.\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB41:
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
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L29
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movl	%eax, %ebp
	movq	%rax, %r14
	salq	$3, %rbp
	movq	%rbp, %rdi
	call	malloc@PLT
	movq	%rbp, %rdi
	movq	%rax, %rbx
	call	malloc@PLT
	movq	%rbp, %rdi
	movq	%rax, %r12
	call	malloc@PLT
	testl	%r14d, %r14d
	movq	%rax, %r13
	je	.L3
	movq	%r12, %rdx
	leal	-1(%r14), %ebp
	shrq	$3, %rdx
	andl	$1, %edx
	cmpl	$2, %ebp
	jbe	.L17
	xorl	%edi, %edi
	testl	%edx, %edx
	je	.L5
	movq	.LC1(%rip), %rax
	movl	%edx, %edi
	movq	%rax, (%r12)
	movq	.LC2(%rip), %rax
	movq	%rax, 0(%r13)
.L5:
	movl	%r14d, %r9d
	movl	%edx, %r15d
	xorl	%eax, %eax
	leaq	0(,%r15,8), %rsi
	subl	%edx, %r9d
	xorl	%ecx, %ecx
	movl	%r9d, %r10d
	movapd	.LC3(%rip), %xmm1
	leaq	(%r12,%rsi), %r8
	shrl	%r10d
	addq	%r13, %rsi
	movapd	.LC4(%rip), %xmm0
	.p2align 4,,10
	.p2align 3
.L6:
	addl	$1, %ecx
	movaps	%xmm1, (%r8,%rax)
	movups	%xmm0, (%rsi,%rax)
	addq	$16, %rax
	cmpl	%r10d, %ecx
	jb	.L6
	movl	%r9d, %ecx
	andl	$-2, %ecx
	cmpl	%ecx, %r9d
	leal	(%rdi,%rcx), %eax
	je	.L30
.L4:
	movsd	.LC1(%rip), %xmm1
	movl	%eax, %ecx
	movsd	.LC2(%rip), %xmm0
	movsd	%xmm1, (%r12,%rcx,8)
	movsd	%xmm0, 0(%r13,%rcx,8)
	leal	1(%rax), %ecx
	cmpl	%ecx, %r14d
	jbe	.L8
	addl	$2, %eax
	movsd	%xmm1, (%r12,%rcx,8)
	cmpl	%eax, %r14d
	movsd	%xmm0, 0(%r13,%rcx,8)
	jbe	.L8
	movsd	%xmm1, (%r12,%rax,8)
	movsd	%xmm0, 0(%r13,%rax,8)
.L8:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	movl	%edx, 12(%rsp)
	call	clock_gettime@PLT
	movl	12(%rsp), %edx
	cmpl	$1, %edx
	sbbl	%eax, %eax
	addl	$2, %eax
	cmpl	%ebp, %eax
	ja	.L19
	movl	%edx, %r15d
.L15:
	xorl	%edi, %edi
	testl	%edx, %edx
	je	.L13
	movsd	.LC5(%rip), %xmm0
	movl	%edx, %edi
	mulsd	(%r12), %xmm0
	addsd	0(%r13), %xmm0
	movsd	%xmm0, (%rbx)
.L13:
	movl	%r14d, %r9d
	leaq	0(,%r15,8), %rsi
	xorl	%eax, %eax
	subl	%edx, %r9d
	xorl	%ecx, %ecx
	movl	%r9d, %r10d
	movapd	.LC6(%rip), %xmm1
	leaq	(%r12,%rsi), %r8
	leaq	0(%r13,%rsi), %rdx
	shrl	%r10d
	addq	%rbx, %rsi
	.p2align 4,,10
	.p2align 3
.L10:
	movapd	(%r8,%rax), %xmm0
	addl	$1, %ecx
	mulpd	%xmm1, %xmm0
	movupd	(%rdx,%rax), %xmm2
	addpd	%xmm2, %xmm0
	movups	%xmm0, (%rsi,%rax)
	addq	$16, %rax
	cmpl	%r10d, %ecx
	jb	.L10
	movl	%r9d, %eax
	andl	$-2, %eax
	addl	%eax, %edi
	cmpl	%eax, %r9d
	je	.L14
.L12:
	movl	%edi, %eax
	movsd	.LC5(%rip), %xmm0
	movsd	(%r12,%rax,8), %xmm1
	addl	$1, %edi
	cmpl	%r14d, %edi
	mulsd	%xmm0, %xmm1
	addsd	0(%r13,%rax,8), %xmm1
	movsd	%xmm1, (%rbx,%rax,8)
	jnb	.L14
	mulsd	(%r12,%rdi,8), %xmm0
	addsd	0(%r13,%rdi,8), %xmm0
	movsd	%xmm0, (%rbx,%rdi,8)
.L14:
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	leaq	.LC8(%rip), %rsi
	pxor	%xmm0, %xmm0
	movl	%r14d, %edx
	pxor	%xmm1, %xmm1
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	divsd	.LC7(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	movsd	(%rbx,%rbp,8), %xmm1
	leaq	.LC9(%rip), %rsi
	movsd	(%rbx), %xmm0
	movl	$1, %edi
	movl	$2, %eax
	call	__printf_chk@PLT
	movq	%r12, %rdi
	call	free@PLT
	movq	%r13, %rdi
	call	free@PLT
	movq	%rbx, %rdi
	call	free@PLT
	xorl	%eax, %eax
	movq	56(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L31
	addq	$72, %rsp
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
.L30:
	.cfi_restore_state
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	movl	%edx, 12(%rsp)
	call	clock_gettime@PLT
	movl	12(%rsp), %edx
	jmp	.L15
.L3:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	movl	$4294967295, %ebp
	call	clock_gettime@PLT
	jmp	.L14
.L17:
	xorl	%eax, %eax
	jmp	.L4
.L19:
	xorl	%edi, %edi
	jmp	.L12
.L31:
	call	__stack_chk_fail@PLT
.L29:
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	orl	$-1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE41:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1073741824
	.align 8
.LC2:
	.long	0
	.long	1074266112
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC3:
	.long	0
	.long	1073741824
	.long	0
	.long	1073741824
	.align 16
.LC4:
	.long	0
	.long	1074266112
	.long	0
	.long	1074266112
	.section	.rodata.cst8
	.align 8
.LC5:
	.long	0
	.long	1077968896
	.section	.rodata.cst16
	.align 16
.LC6:
	.long	0
	.long	1077968896
	.long	0
	.long	1077968896
	.section	.rodata.cst8
	.align 8
.LC7:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
