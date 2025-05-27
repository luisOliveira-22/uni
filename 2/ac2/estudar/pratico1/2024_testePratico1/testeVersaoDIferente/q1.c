#include <detpic32.h>

void delay(unsigned int ms);

int main(int argc, char const *argv[])
{
    TRISE = TRISE & 0xFFC3; // 1111 1111 1000 0011
    TRISEbits.TRISE7 = 0;   // LED RE7 saída
    LATEbits.LATE7 = 1;
    TRISB = TRISB & 0x000F;   // 0000 0000 0000 1111

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
            delay(434);        // 1/2.3 = 434 ms
        }
        else if (PORTBbits.RB1 == 1 && PORTBbits.RB2 == 1)
        {
            delay(181);         // 1/5.5 =  181 ms
        }
        else
        {
            delay(434);         // default
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