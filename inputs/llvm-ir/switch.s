	.text
	.file	"switch.c"
	.globl	wazza                           # -- Begin function wazza
	.p2align	4, 0x90
	.type	wazza,@function
wazza:                                  # @wazza
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -8(%rbp)
	xorl	%edi, %edi
	callq	time@PLT
	movl	%eax, %edi
	callq	srand@PLT
	callq	rand@PLT
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%eax, %ecx
	andl	$-2, %ecx
	subl	%ecx, %eax
	movl	%eax, -4(%rbp)
	je	.LBB0_2
# %bb.1:
	movl	-4(%rbp), %eax
	addl	-8(%rbp), %eax
	movl	%eax, -12(%rbp)
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB0_2:
	.cfi_def_cfa %rbp, 16
	xorl	%edi, %edi
	callq	exit@PLT
.Lfunc_end0:
	.size	wazza, .Lfunc_end0-wazza
	.cfi_endproc
                                        # -- End function
	.globl	bazza                           # -- Begin function bazza
	.p2align	4, 0x90
	.type	bazza,@function
bazza:                                  # @bazza
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf@PLT
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	bazza, .Lfunc_end1-bazza
	.cfi_endproc
                                        # -- End function
	.globl	mata                            # -- Begin function mata
	.p2align	4, 0x90
	.type	mata,@function
mata:                                   # @mata
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	$10, %edi
	callq	bazza
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	mata, .Lfunc_end2-mata
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset %rbx, -24
	movl	$0, -24(%rbp)
	leaq	-16(%rbp), %rsi
	movl	$.L.str.3, %edi
	xorl	%eax, %eax
	callq	__isoc99_scanf@PLT
	movslq	-16(%rbp), %rax
	movl	$1, -64(%rbp,%rax,4)
	movl	$10, -32(%rbp)
	movq	stdout@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	xorl	%esi, %esi
	movl	$2, %edx
	xorl	%ecx, %ecx
	callq	setvbuf@PLT
	movl	$10, -12(%rbp)
	leaq	-12(%rbp), %rbx
	jmp	.LBB3_1
	.p2align	4, 0x90
.LBB3_7:                                #   in Loop: Header=BB3_1 Depth=1
	movl	$5, %edi
	callq	bazza
.LBB3_1:                                # =>This Inner Loop Header: Depth=1
	cmpl	$0, -12(%rbp)
	je	.LBB3_9
# %bb.2:                                #   in Loop: Header=BB3_1 Depth=1
	movl	$.L.str.4, %edi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	$.L.str.3, %edi
	movq	%rbx, %rsi
	xorl	%eax, %eax
	callq	__isoc99_scanf@PLT
	movl	$.L.str.5, %edi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	-12(%rbp), %eax
	cmpl	$3, %eax
	je	.LBB3_7
# %bb.3:                                #   in Loop: Header=BB3_1 Depth=1
	cmpl	$2, %eax
	je	.LBB3_6
# %bb.4:                                #   in Loop: Header=BB3_1 Depth=1
	cmpl	$1, %eax
	jne	.LBB3_8
# %bb.5:                                #   in Loop: Header=BB3_1 Depth=1
	movl	-12(%rbp), %edi
	callq	wazza
	movl	%eax, -20(%rbp)
	movl	$.L.str.6, %edi
	movl	%eax, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	callq	mata
	jmp	.LBB3_1
	.p2align	4, 0x90
.LBB3_6:                                #   in Loop: Header=BB3_1 Depth=1
	movl	$10, %edi
	callq	bazza
	jmp	.LBB3_1
	.p2align	4, 0x90
.LBB3_8:                                #   in Loop: Header=BB3_1 Depth=1
	movl	$.L.str.7, %edi
	xorl	%eax, %eax
	callq	printf@PLT
	jmp	.LBB3_1
.LBB3_9:
	xorl	%eax, %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"bazza"
	.size	.L.str, 6

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"pula"
	.size	.L.str.1, 5

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"mata"
	.size	.L.str.2, 5

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"%d\n"
	.size	.L.str.3, 4

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"Enter a number: "
	.size	.L.str.4, 17

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"\n"
	.size	.L.str.5, 2

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"this shit is so stupid %d\n"
	.size	.L.str.6, 27

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"default as shit bruh\n"
	.size	.L.str.7, 22

	.ident	"Ubuntu clang version 17.0.6 (++20231209124227+6009708b4367-1~exp1~20231209124336.77)"
	.section	".note.GNU-stack","",@progbits
