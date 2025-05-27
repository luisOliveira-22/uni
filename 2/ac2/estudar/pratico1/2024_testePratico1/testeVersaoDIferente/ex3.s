    .equ BASE, 0xBF88
    .equ TRISE, 0x6100
    .equ LATE, 0x6120
    .equ putChar, 3
    .equ printInt, 6
    .equ resetCoreTimer, 12
    .equ readCoreTimer, 11

    .data
    .text
    .globl main

main:
    lui $t0, BASE

    lw $t1, TRISE($t0)
    andi $t1, $t1, 0xFF81
    sw $t1, TRISE($t0)

    lw $t1, LATE($t0)      # Ler LATE
    andi $t1, $t1, 0x0040  # RE6 (bit 6) a começar a 6
    sw $t1, LATE($t0)      # Escrever de volta em LATE

    li $t1, 1

while:
    lw $t2, LATE($t0)
    andi $t2, $t2, 0xFFC1
    sll $t3, $t1, 1
    or $t2, $t2, $t3
    sw $t2, LATE($t0)

    move $a0, $t1
    li $a1, 0x00050002
    li $v0, printInt
    syscall

    li $a0, '\n'
    li $v0, putChar
    syscall

    sll $t1, $t1, 1

if:
    bne $t1, 0x20, endif
    li $t1, 1

endif:
    li $v0, resetCoreTimer
    syscall

read:
    li $v0, readCoreTimer
    syscall
    blt $v0, 8695652, read

    lw $t3, LATE($t0)      # Ler LATE
    xori $t3, $t3, 0x0040  # toggle ao bit 6
    sw $t3, LATE($t0)      # Escrever de volta em LATE
    
    j while

    li $v0, 0
    jr $ra