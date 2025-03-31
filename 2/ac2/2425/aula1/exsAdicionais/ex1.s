        .equ inKey, 1
        .equ putChar, 3
        .equ printInt, 6
        .equ exit, 10

        .equ UP, 1
	    .equ DOWN, 0

        .data
        .text
        .globl main

main:
        li $t0, 0           # int state = 0
        li $t1, 0           # int cnt = 0

do:
        li $a0, '\r'
        li $v0, putChar
        syscall             # putChar('\r'); 

        move $a0, $t1
        li $a1, 3
        sll $a1, $a1, 16
        ori	$a1, $a1, 10
        li $v0, printInt
        syscall             # printInt( cnt, 10 | 3 << 16 );

        li $a0, '\t'
        li $v0, putChar
        syscall             # putChar('\t');

        move $a0, $t1
        li $a1, 8
        sll $a1, $a1, 16
        ori $a1, $a1, 2
        li $v0, printInt
        syscall             # printInt( cnt, 2 | 8 << 16 );

        # prologo
        addi $sp, $sp, -16
        sw $ra, 0($sp)
        sw $t0, 4($sp)
        sw $t1, 8($sp)
        sw $t2, 12($sp)

        li	$a0, 5
	    jal	wait            # wait(5)

        # epilogo
        lw $ra, 0($sp)
        lw $t0, 4($sp)
        lw $t1, 8($sp)
        lw $t2, 12($sp)
        addi $sp, $sp, 16

        li $v0, inKey
        syscall
        move $t2, $v0       # c = inkey()

ifs:
        bne $t2, 's', ifr   # IF(C = 'S')
        li $v0, exit
        syscall             # STOP

ifr:
        bne $t2, 'r', if    # IF(C = R)
        li $t1, 0           # CNT = 0 

if:
        bne $t2, '+', if2   # if( c == '+' )
        li $t3, UP          # state = UP
        j if3

if2:
        bne $t2, '-', if3   # if( c == '-' )
        li $t3, DOWN        # state = DOWN

if3:
        bne $t3, UP, if4    # if( state == UP )
        addi $t1, $t1, 1
        andi $t1, $t1, 0xFF # cnt = (cnt + 1) & 0xFF
        j endif

if4:                        # else
        addi $t1, $t1, -1
        andi $t1, $t1, 0xFF # cnt = (cnt - 1) & 0xFF

endif:
        bne $t2, 'q', do
        jr $ra



wait:
	    li $t0, 0
	    mul	$t1, $a0, 515000

wait_loop:
	    bge	$t0, $t1, wait_return
	    addi $t0, $t0, 1
	    j wait_loop

wait_return:
	    jr $ra