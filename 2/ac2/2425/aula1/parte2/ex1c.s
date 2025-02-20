                .equ printString, 8
                .equ printInt, 6
                .equ printInt10, 7
                .equ readInt10, 5
        
                .data

msg:            .asciiz "\nIntroduza um inteiro (sinal e módulo): "
base10:         .asciiz "\nValor em base 10 (signed): "
base2:          .asciiz "\nValor em base 2: "
base16:         .asciiz "\nValor em base 16: "
base10un:       .asciiz "\nValor em base 10 (unsigned): "
base10un_form:  .asciiz "\nValor em base 10 (unsigned), formatado: "

                .text
                .globl main

main:           la $a0, msg
                li $v0, printString
                syscall                 # printStr("\nIntroduza um inteiro (sinal e módulo): ");

                li $v0, readInt10
                syscall
                move $t0, $v0           # value = readInt10()

                la $a0, base10
                li $v0, printString
                syscall                 # printStr("\nValor em base 10 (signed): ");

                move $a0, $t0
                li $v0, printInt10
                syscall                 # printInt10(value);

                la $a0, base2
                li $v0, printString
                syscall                 # printStr("\nValor em base 2: ");

                move $a0, $t0
                li $a1, 2
                li $v0, printInt
                syscall                 # printInt(value, 2);

                la $a0, base16
                li $v0, printString
                syscall                 # printStr("\nValor em base 16: ");

                move $a0, $t0
                li $a1, 16
                li $v0, printInt
                syscall                 # printInt(value, 16);

                la $a0, base10un
                li $v0, printString
                syscall                 # printStr("\nValor em base 10 (unsigned): ");

                move $a0, $t0
                li $a1, 10
                li $v0, printInt
                syscall                 # printInt(value, 10);

                la $a0, base10un
                li $v0, printString
                syscall                 # printStr("\nValor em base 10 (unsigned), formatado: ");

                move $a0, $t0
                li $t1, 5
                sll $t1, $t1, 16
                ori $t1, $t1, 10
                move $a1, $t1
                li $a1, 10
                li $v0, printInt
                syscall                 # printInt(value, 10);

                j main