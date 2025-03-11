#include <detpic32.h>

void delay(int ms);

int main(int argc, char const *argv[])
{
    static const char display7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
    //                                     0     1     2     3     4     5     6     7     8     9     A     B     C     D     E     F

    // reset LATE[14] a LATE[8]
    LATB = LATB & 0x80FF; // reset 1000 0000 1111 1111

    // config para ver no display menos significativo
    LATDbits.LATD5 = 1;
    LATDbits.LATD6 = 0;

    // config TRISE[14] a TRISE[8] como saídas
    TRISB = TRISB & 0x80FF;

    // config display (LATD[5] A LATD[6]) como saídas
    TRISD = TRISD & 0xFF9F; // 1111 1111 1001 1111
    
    while(1)
    {
        LATB = (LATB & 0x80FF) | (display7Scodes[PORTB & 0x000F] << 8);
    }

    return 0;
}