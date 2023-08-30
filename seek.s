# seeks for an element in V equals to value O till the Sth element
# O stores 0 if found element, 7 otherwise
.section .data
	I: .quad 0 																		# %rdi
	B: .quad 7																		# %rbx
	O: .quad 2																		# %rcx
	S: .quad 10																		# %rdx
	V: .quad 1, 2, 9, 10, 2, 7, 8, 6, 3, 4				# %rax = V[%rdi]
.section .text
.globl _start
_start:
	movq O, %rcx
	movq B, %rbx
	movq S, %rdx
	movq I, %rdi

	loop:
	cmpq %rdx, %rdi	#| If I has passed limit
	je fim_loop			#| estabilished by S
	
	movq V(, %rdi, 8), %rax 
	cmpq %rcx, %rax # If current element is equal to O declared
		jne fim_if
		movq $0, %rbx
		jmp fim_loop
	fim_if:
	addq $1, %rdi
	jmp loop

	fim_loop:
	movq %rbx, %rdi
	movq $60, %rax
	syscall
