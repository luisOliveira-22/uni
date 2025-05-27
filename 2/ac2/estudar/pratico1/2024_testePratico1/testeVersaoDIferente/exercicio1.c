#include <detpic32.h>

void delay(unsigned int ms);
int main(int argc, char const *argv[])
{
    TRISE = TRISE & 0xFFC3; // 1111 1111 1100 0011 RE2 a RE5 como saídas
    TRISB = TRISB & 0x000F; // 0000 0000 0000 1111 bits switches como entrada
    TRISEbits.TRISE7 = 0;   // RE7 como saída para piscar 

    LATEbits.LATE7 = 1;     // começar aceso
    int counter = PORTB & 0x000F;
    while(1)
    {
        LATE = (LATE & 0xFFC3) | (counter << 2);

        printInt(counter, 10 | 2 << 16);
        putChar('\n');

        if(counter == 0)
        {
            counter = 12;
        }

        counter = counter - 1;

        if(PORTBbits.RB1 == 0 && PORTBbits.RB2 == 0)
        {
            delay(434);         // 2.3 Hz = 1/2.3 = 434 ms
        }
        else if(PORTBbits.RB1 == 1 && PORTBbits.RB2 == 1)
        {
            delay(181);         // 5.5 Hz = 1/5.5 = 181 ms
        }
        else{
            delay(434);
        }
        LATEbits.LATE7 = !LATEbits.LATE7;
    }

    return 0;
}

void delay(unsigned int ms)
{
    resetCoreTimer();
    while(readCoreTimer() < 20000 * ms);
}
