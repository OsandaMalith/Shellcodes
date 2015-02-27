/*
# Title: Simple write() syscall on a Linux ARM architecture
# OS: armv6l GNU/Linux 
# Tested on a Raspberry pi 
# Author: Osanda Malith Jayathissa
# E-mail: osanda[cat]unseen.is

Disassembly of section .text:

00008054 <_start>:
    8054:       e28f6001        add     r6, pc, #1
    8058:       e12fff16        bx      r6
    805c:       2207            movs    r2, #7
    805e:       4679            mov     r1, pc
    8060:       310e            adds    r1, #14
    8062:       2001            movs    r0, #1
    8064:       2704            movs    r7, #4
    8066:       df01            svc     1
    8068:       1b24            subs    r4, r4, r4
    806a:       1c20            adds    r0, r4, #0
    806c:       2701            movs    r7, #1
    806e:       df01            svc     1
    8070:       6e61734f        cdpvs   3, 6, cr7, cr1, cr15, {2}
    8074:       000a6164        andeq   r6, sl, r4, ror #2
*/
#include <stdio.h>
#include <string.h>

char *shellcode =  "\x01\x60\x8f\xe2"
        "\x16\xff\x2f\xe1"
        "\x07\x22"
        "\x79\x46"
        "\x0e\x31"
        "\x01\x20"
        "\x04\x27"
        "\x01\xdf"        
	"\x24\x1b"
        "\x20\x1c"
        "\x01\x27"
	"\x01\xdf"
	"\x4f\x73\x61\x6e"
	"\x64\x61\x0a";

int main(void) {
    fprintf(stdout,"Length: %d\n",strlen(shellcode));
    (*(void(*)()) SC)();
return 0;
}
