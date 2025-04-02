#include <detpic32.h>

void delay(unsigned int ms);

int main (void)
{
    TRISE = TRISE & 0xFFC3; // 1111 1111 1100 0011
    TRISBbits.TRISB2 = 1;

    int counter = 0;

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

        if(PORTBbits.RB2 == 0)
        {
            delay(434);
        }
        else
        {
            delay(181);
        }
    }

    return 0;
}

void delay(unsigned int ms)
{
    resetCoreTimer();
    while(readCoreTimer() < 20000 * ms);
}