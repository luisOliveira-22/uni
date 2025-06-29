        .equ BASE, 0xBF88

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
        lui $t0, BASE

        lw $t1, TRISE($t0)      # ler valor TRISE
        andi $t1, $t1, 0xFFE1   # reset RB4 a RB1
        sw $t1, TRISE($t0)      # carregar valor

        lw $t1, TRISB($t0)      # ler valor TRISB
        ori $t1, $t1, 0x0002    # reset RB1
        sw $t1, TRISB($t0)      # carregar valor

        li $t1, 1               # counter = 1

loop:
        lw $t2, LATE($t0)       # ler valor LATE
        andi $t2, $t2, 0xFFE1   # reset
        sll $t3, $t1, 1         # shift para bit1 
        or $t2, $t2, $t3        # merge com o counter
        sw $t2, LATE($t0)       # carregar valor

        lw $t2, PORTB($t0)      # ler valor PORTB
        andi $t2, $t2, 0x0002   # valor RB1 = 1

if:
        bne $t2, 0x0002, else   # if(RB1 = 1)
        sll $t1, $t1, 1         # shift para a esquerda
reset_esq:
        bne $t1, 16, endif      # Se virou 0000, reiniciar
        li $t1, 1
        j endif

else:                           # else
        srl $t1, $t1, 1         # shift para a direita
reset_dir:
        bnez $t1, endif         # Se virou 0000, reiniciar
        li $t1, 8

endif:
        li $a0, 333             # 1/3 = 0.333s = 333ms
        jal delay

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