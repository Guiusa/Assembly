# adds 1 in rcx till it's equal to 10, then returns the value
.section .data
.section .text
.globl _start
_start:
	movq $0, %rcx
	movq $10, %rdx
loop:
	cmpq %rdx, %rcx
	jge end_loop
	addq $10, %rcx
	jmp loop
end_loop:
	movq %rcx, %rdi
	movq $60, %rax
	syscall
