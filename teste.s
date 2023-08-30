.section .text
.globl _start
_start:
	movq $16, %rdi
	movq $60, %rax
	syscall
