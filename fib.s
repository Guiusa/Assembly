.section .data
	N: .quad 15
.section .text
.globl _start
_start:
	movq N, %rax
	movq $0, %rbx
	movq $1, %rcx
	movq $1, %rsi
	
	cmpq %rsi, %rax
	jle um_menos
	movq N, %rdi
	jmp loop
	
	um_menos:
		movq %rax, %rbx
		jmp fim
	
	loop:
		movq %rcx, %rdx
		addq %rbx, %rcx
		movq %rdx, %rbx
		subq $1, %rdi
		cmpq %rdi, %rsi
		jl loop
		movq %rcx, %rbx
		jmp fim
	fim:
	movq %rbx, %rdi
	movq $60, %rax
	syscall
		
