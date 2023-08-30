# Finds the biggest element in V
.section .data
	I: .quad 0	# Mapeado em %rdi
	V: .quad 9, 1, 10, 2, 3, 5, 4, 7, 6, 8, 0 # Mapeado em %rax
.section .text
.globl _start
_start:
	movq I, %rdi
	movq V(, %rdi, 8), %rbx
	addq $1, %rdi

	loop:
		movq V(, %rdi, 8), %rax
		cmpq $0, %rax
		je fim_loop

		cmpq %rbx, %rax
			jle fim_if	
			movq %rax, %rbx
		fim_if:
		addq $1, %rdi
		jmp loop
	fim_loop:
		movq %rbx, %rdi
		movq $60, %rax
		syscall
