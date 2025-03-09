# include <detpic32.h>

void delay(int ms);

int main(void)
{
    // reset LATE[14] a LATE[8]
    LATB = LATB & 0x80FF; // reset 1000 0000 1111 1111
    
    // config para ver no display menos significativo
    LATDbits.LATD5 = 1;
    LATDbits.LATD6 = 0;
    
    // config TRISE[14] a TRISE[8] como saídas
    TRISB = TRISB & 0x80FF;

    // config display (LATD[5] A LATD[6]) como saídas
    TRISD = TRISD & 0xFF9F; // 1111 1111 1001 1111

    char c;
    while (1)
    {
        c = getChar();

        if (c >= 'a' && c <= 'g')
        {
            c = c - 'a'; // subtrair o caracter por a para obter o indice
            LATB = (LATB & 0x80FF) | 1 << (c + 8);
        }

        else
        {
            // reset
            LATB = LATB & 0x80FF;
        }
    }

    return 0;
}

void delay(int ms){
    resetCoreTimer();
    while(readCoreTimer() < 20000 * ms);
}