        .equ SFR_BASE_HI, 0xBF88

        .equ TRISE, 0x6100
        .equ PORTE, 0x6110
        .equ LATE, 0x6120

        .equ resetCoreTimer, 12
        .equ readCoreTimer, 11

        .data
        .text
        .globl main

main:   
        lui $t0, SFR_BASE_HI

        lw $t1, TRISE($t0)              # Read TRISE register  
        andi $t1, $t1, 0xFFE1           # Reset RE4-RE1 (1111 1111 1110 0001) 
        sw $t1, TRISE($t0)               # Update TRISE register 

        li $t2, 0                       # e.g. up counter (initial value is 0) 

loop:
        lw  $t1, LATE($t0)              # Read LATE register 
        andi $t1, $t1, 0xFFE1           # Reset RE4-RE1 (1111 1111 1110 0001) 
        sll $t3, $t2, 1                 # Shift counter value to "position" 1 
        or  $t1, $t1, $t3               # Merge counter w/ LATE value 
        sw  $t1, LATE($t0)              # Update LATE register 

        addi $t2, $t2, -1               # count++
        andi $t2, $t2, 0x000F           # up counter MOD 16

        li $a0, 250                     # 1/4 = 0.25s = 250ms
        jal delay                       # delay(1000)

        j loop

        jr $ra

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