	.file	"linked_list.c"
	.text
	.globl	enqueue
	.type	enqueue, @function
enqueue:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movl	$16, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	-36(%rbp), %edx
	movl	%edx, (%rax)
	movq	-24(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L4
	movq	-32(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
	nop
.L4:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	enqueue, .-enqueue
	.globl	dequeue
	.type	dequeue, @function
dequeue:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L10
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	.L8
.L9:
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -16(%rbp)
.L8:
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L9
	movq	-16(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-32(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	jmp	.L5
.L10:
	nop
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	dequeue, .-dequeue
	.section	.rodata
.LC0:
	.string	"w"
.LC1:
	.string	"../data/enqueue.dat"
.LC2:
	.string	"../data/dequeue.dat"
.LC3:
	.string	"%llu \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$3936, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -12096(%rbp)
	leaq	.LC0(%rip), %rsi
	leaq	.LC2(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -12088(%rbp)
	movq	$0, -12112(%rbp)
	movq	$0, -12104(%rbp)
	leaq	-12080(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	clock_gettime@PLT
	movq	-12080(%rbp), %rax
	imulq	$1000000000, %rax, %rdx
	movq	-12072(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -8016(%rbp)
	movq	-8016(%rbp), %rdx
	movq	-12096(%rbp), %rax
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, -12120(%rbp)
	jmp	.L12
.L13:
	leaq	-12064(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	clock_gettime@PLT
	movl	-12120(%rbp), %edx
	leaq	-12104(%rbp), %rcx
	leaq	-12112(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	enqueue
	leaq	-12048(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	clock_gettime@PLT
	movq	-12048(%rbp), %rdx
	movq	-12064(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	imulq	$1000000000, %rax, %rdx
	movq	-12040(%rbp), %rax
	addq	%rax, %rdx
	movq	-12056(%rbp), %rax
	subq	%rax, %rdx
	movl	-12120(%rbp), %eax
	addl	$1, %eax
	cltq
	movq	%rdx, -8016(%rbp,%rax,8)
	movl	-12120(%rbp), %eax
	addl	$1, %eax
	cltq
	movq	-8016(%rbp,%rax,8), %rdx
	movq	-12096(%rbp), %rax
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	addl	$1, -12120(%rbp)
.L12:
	cmpl	$999, -12120(%rbp)
	jle	.L13
	leaq	-12080(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	clock_gettime@PLT
	movq	-12080(%rbp), %rax
	imulq	$1000000000, %rax, %rdx
	movq	-12072(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -12032(%rbp)
	movq	-12032(%rbp), %rdx
	movq	-12088(%rbp), %rax
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, -12116(%rbp)
	jmp	.L14
.L15:
	leaq	-12064(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	clock_gettime@PLT
	leaq	-12104(%rbp), %rdx
	leaq	-12112(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	dequeue
	leaq	-12048(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	clock_gettime@PLT
	movq	-12048(%rbp), %rdx
	movq	-12064(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	imulq	$1000000000, %rax, %rdx
	movq	-12040(%rbp), %rax
	addq	%rax, %rdx
	movq	-12056(%rbp), %rax
	subq	%rax, %rdx
	movl	-12116(%rbp), %eax
	addl	$1, %eax
	cltq
	movq	%rdx, -12032(%rbp,%rax,8)
	movl	-12116(%rbp), %eax
	addl	$1, %eax
	cltq
	movq	-12032(%rbp,%rax,8), %rdx
	movq	-12088(%rbp), %rax
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	addl	$1, -12116(%rbp)
.L14:
	cmpl	$499, -12116(%rbp)
	jle	.L15
	movq	-12096(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movq	-12088(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
