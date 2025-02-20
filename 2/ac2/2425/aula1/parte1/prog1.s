# int main(void)
# {
#       printStr("AC2 – Aulas praticas\n"); // system call
#       return 0;
# }

        .equ printString, 8
        .data
msg:    .asciiz "AC2 – Aulas praticas\n"
        .text
        .globl main

main:   la $a0, msg
        li $v0, printString
        syscall                 # printStr("AC2 – Aulas praticas\n");
        li $v0, 0               # return 0;
        jr $ra