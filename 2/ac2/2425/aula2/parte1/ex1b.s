        .equ readCoreTimer, 11 
        .equ resetCoreTimer, 12 
        .equ putChar, 3
        .equ printInt, 6 
        .data
        .text
        .globl  main

main:   li  $t0, 0                  # counter = 0

while:                              # while(1) {
        la $a0, '\r'
        li $v0, putChar
        syscall                     #   putChar('\r')

        move $a0, $t0               #   (counter,   

        li    $a1, 4                #
        sll   $a1, $a1, 16          #
        ori   $a1, $a1, 10          #   10 | 4 << 16)

        syscall                     #   printInt(counter, 10 | 4 << 16)

        li $v0, resetCoreTimer
        syscall                     #   resetCoreTimer()

while2:                             #   while(
        li $v0, readCoreTimer
        syscall                     #   readCoreTimer()
        blt $v0, 200000, while2     #   < 200 000)

        addi $t0, $t0, 1            #   counter++
        j while                     # }
        jr $ra                      # return 0