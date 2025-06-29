        .equ BASE, 0xBF88
        .equ TRISE, 0x6100
        .equ TRISB, 0x6040
        .equ LATE, 0x6120
        .equ PORTB, 0x6050
        .data
        .text
        .globl main

main:   lui $t0, BASE

        lw $t1, TRISB($t0)      # Defining
        ori $t1, $t1, 0x0001    # port RB0 as
        sw $t1, TRISB($t0)      # an input

        lw $t1, TRISE($t0)      # Defining
        andi $t1, $t1, 0xFFFE   # port RE0 as
        sw $t1, TRISE($t0)      # an output

loop:
        lw $t1, PORTB($t0)      # Read RB register
        xori $t1, $t1, 0x0001   # Reset all bits except bit 0 and invert it

        lw $t2, LATE($t0)       # Read RE register
        andi $t2, $t2, 0xFFFE   # Reset bit 0

        or $t2, $t2, $t1        # Merge data
        sw $t2, LATE($t0)       # Write LATE register

        j loop