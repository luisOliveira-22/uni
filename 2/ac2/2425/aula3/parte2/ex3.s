        .equ SFR_BASE_HI, 0xBF88

        .equ TRISE, 0x6100
        .equ PORTE, 0x6110
        .equ LATE, 0x6120

        .equ TRISB, 0x6040
        .equ PORTB, 0x6050
        .equ LATB, 0x6060

        .equ resetCoreTimer, 12
        .equ readCoreTimer, 11

        .data
        .text
        .globl main

main:   
        lui $t0, SFR_BASE_HI

        lw $t1, TRISE($t0)              # Read TRISE register  
        andi $t1, $t1, 0xFFE1           # Reset RE4-RE1 (1111 1111 1110 0001) 
        sw $t1, TRISE($t0)              # Update TRISE register 

        lw $t1, TRISB($t0)              # READ TRISB VALUE
        ori $t1, $t1, 0x0008            # RESET RB3
        sw $t1, TRISB($t0)              # UPDATE TRISB VALUE

        li $t2, 0                       # counter 

loop:
        lw  $t1, LATE($t0)              # Read LATE register 
        andi $t1, $t1, 0xFFE1           # Reset RE4-RE1 (1111 1111 1110 0001) 
        sll $t3, $t2, 1                 # Shift counter value to "position" 1 
        or  $t1, $t1, $t3               # Merge counter w/ LATE value 
        sw  $t1, LATE($t0)              # Update LATE register 

        lw $t3, PORTB($t0)
        andi $t3, $t3, 0x0008

if:
        bne $t3, 0x0008, else
        addi $t2, $t2, 1                # counter++
        j endif

else:
        addi $t2, $t2, -1               # counter--

endif:
        andi $t2, $t2, 0x000F           # up counter MOD 16

        li $a0, 500                     # 1/2 = 0.5s = 500ms
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