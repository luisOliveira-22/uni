#include <detpic32.h>

void delay(unsigned int ms);

int main(int argc, char const *argv[])
{
    TRISE = TRISE & 0xFFC3;
    TRISEbits.TRISE7 = 0;
    TRISB = TRISB & 0x000F;

    LATEbits.LATE7 = 1; 
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
            delay(434); // 2.3 Hz
        }
        else if(PORTBbits.RB1 == 1 && PORTBbits.RB2 == 1)
        {
            delay(181); // 5.5 Hz
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