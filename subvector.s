.section .data
	SUBV: 	.quad 7, 6, 5
	SUBN:	.quad 3
	V:		.quad 9, 7, 6, 7, 3, 4, 7, 7, 6, 5
	N:		.quad 10
	FOUND:	.quad 1
.section .text
.globl _start
_start:
	movq $0, %rdi
	movq $0, %rsi
	loop:
		movq V(, %rdi, 8), %rax
		movq SUBV(, %rsi, 8), %rbx
		cmpq %rax, %rbx
		je loop_found
		jmp not_found
		loop_found:
			movq %rdi, %rcx		# Saves the current value of rdi
			# Adds in indexes
			addq $1, %rsi
			addq $1, %rdi
			# if rsi passed last index of SUBV, it means subvector was found
			cmpq %rsi, SUBN
			je good_end
			# if rdi passed last index of V, than the subv wasn't found
			cmpq %rdi, N
			je fim_loop
			# moves and compares
			movq V(, %rdi, 8), %rax
			movq SUBV(, %rsi, 8), %rax
			cmpq %rax, %rbx
			# if values are equal, continue the inner loop, if not, breaks it
			je loop_found
			movq %rcx, %rdi # Retrieves rdi value if inner loop was stoped
			jmp not_found
			good_end:
				movq $0, FOUND
				jmp fim_loop
		not_found:
		addq $1, %rdi
		cmpq %rdi, N
		je fim_loop
		jmp loop
	fim_loop:
	movq FOUND, %rdi
	movq $60, %rax
	syscall
