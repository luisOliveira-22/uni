        .equ BASE, 0xBF88
        .equ TRISE, 0x6100
        .equ TRISD, 0x60C0
        .equ LATE, 0x6120
        .equ PORTD, 0x60D0
        .data
        .text
        .globl main

main:   lui $t0, BASE

        lw $t1, TRISD($t0)      # Defining
        ori $t1, $t1, 0x0100    # port RD8 as
        sw $t1, TRISD($t0)      # an input

        lw $t1, TRISE($t0)      # Defining
        andi $t1, $t1, 0xFFFE   # port RE0 as
        sw $t1, TRISE($t0)      # an output

loop:
        lw $t1, PORTD($t0)      # Read RD register
        xori $t1, $t1, 0x0100   # Reset all bits except bit 0 and invert it
        srl $t1, $t1, 8			# Move bit 8 to the first position

        lw $t2, LATE($t0)       # Read RE register
        andi $t2, $t2, 0xFFFE   # Reset bit 0

        or $t2, $t2, $t1        # Merge data
        sw $t2, LATE($t0)       # Write LATE register

        j loop