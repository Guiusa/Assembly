# if C is 1, calc calls soma, otherise it calls subtrai
# This program hasd the purpose of understaining the asm stack, rsp and rbp regs
# unfortunally, i understood shit
.section .data
	A: .quad 0
	B: .quad 0
	C: .quad 1
.section .text
.globl _start

subtrai:
	push %rbp
	movq %rsp, %rbp
	movq A, %rax
	movq B, %rbx
	subq %rax, %rbx
	popq %rbp
	ret

soma:
	pushq %rbp
	movq %rsp, %rbp
	movq A, %rax
	movq B, %rbx
	addq %rax, %rbx
	popq %rbp
	ret

calc:
	pushq %rbp
	movq %rsp, %rbp
	movq C, %rcx
	cmpq $1, %rcx
	je if
	jmp else
	if:
		call soma
		jmp fim_if
	else:
		call subtrai
		jmp fim_if
	fim_if:
	popq %rbp
	ret

_start:
	movq $4, A
	movq $5, B
	call calc
	movq $60, %rax
	movq %rbx, %rdi
	syscall
