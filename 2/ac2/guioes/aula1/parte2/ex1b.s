        .equ inkey, 1
        .equ putChar, 3
        .equ printInt, 6

        .data
        .text
        .globl main

main:   li $t0, 0           # cnt = 0

do:                         # do {
        li $v0, inkey
        syscall
        move $t1, $v0       #   c = inkey()

if:     
        bne $t1, 0, else    #   if( c != 0 )
        move $a0, $t1
        li $v0, putChar
        syscall             #       putChar(c)
        j endif

else:                       #   else
        li $a0, '.'
        li $v0, putChar
        syscall             #       putChar('.')

endif:  
        addi $t0, $t0, 1    #   cnt++

        bne $t1, '\n', do   # }while(c != '\n')

        move $a0, $t0
        move $a1, 10
        li $v0, printInt
        syscall             # printInt(cnt, 10)

        jr $ra              # return 0