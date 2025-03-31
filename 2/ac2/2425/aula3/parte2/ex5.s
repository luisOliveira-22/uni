        .equ BASE, 0xBF88

        .equ TRISE, 0x6100
        .equ PORTE, 0x6110
        .equ LATE, 0x6120

        .equ resetCoreTimer, 12
        .equ readCoreTimer, 11

        .data
        .text
        .globl main

main:
        lui $t0, BASE

        lw $t1, TRISE($t0)
        andi $t1, 0xFFE1
        sw $t1, TRISE($t0)

        li $t1, 0

loop:
        lw $t2, LATE($t0)
        andi $t2, 0xFFE1
        sll $t3, $t1, 1
        or $t2, $t2, $t3
        sw $t2, LATE($t0)

        # lógica para o contador

        li $a0, 666
        jal delay

        j loop

delay:
        li $v0, resetCoreTimer
        syscall
wait:
        li $v0, readCoreTimer
        syscall
        li $t4, 20000
        mul $t4, $a0, $t4
        blt $v0, $t4, wait
        jr $ra