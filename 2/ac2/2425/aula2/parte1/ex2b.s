        .equ readCoreTimer, 11 
        .equ resetCoreTimer, 12 
        .equ putChar, 3
        .equ printInt, 6 

        .data
        .text
        .globl main

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

        li $a0, 10                  # 
        jal delay                   #   delay(ms)

        addi $t0, $t0, 1            #   counter++
        j while                     # }
        jr $ra                      # return 0


delay:                              # void delay(unsigned int ms) {
        li $v0, resetCoreTimer
        syscall                     #   resetCoreTimer()

        mulou $t1, $a0, 20000       #   ($t1 -> ms * k)

dlwhile:
        li $v0, readCoreTimer       #   while(
        syscall                     #   readCoreTimer()

        bleu $v0, $t1, dlwhile      #   < K * ms)

        jr $ra                      # }