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
    andi $t1, $t1, 0xFFC1
    sw $t1, TRISE($t0)

    li $t1, 1                   # counter = 1

while:
    lw $t2, LATE($t0)
    andi $t2, $t2, 0xFFC1
    sll $t3, $t1, 1             # shift para meter no LED1
    or $t2, $t2, $t3
    sw $t2, LATE($t0)

    move $a0, $t1
    li $a1, 0x00050002
    li $v0, printInt        
    syscall                     # printInt(counter, 2 | 5 << 16)

    li $a0, '\n'
    li $v0, putChar
    syscall

    sll $t1, $t1, 1

if:
    bne $t1, 0x20, endif        # 0000 0000 0010 0000
    li $t1, 1

endif:
    li $v0, resetCoreTimer
    syscall

while2:
    li $v0, readCoreTimer
    syscall
    blt $v0, 8695652, while2    # 20000 * 1/2.3Hz

    j while
    li $v0, 0
    jr $ra