#include <detpic32.h>

void delay(unsigned int ms);

int main(void)
{
    T3CONbits.TCKPS = 2;    // 1:32 prescaler (i.e Fout_presc = 625 KHz) 
    PR3 = 41666;            // Fout = 20MHz / (32 * (62499 + 1)) = 10 Hz 
    TMR3 = 0;               // Reset timer T2 count register 
    T3CONbits.TON = 1;      // Enable timer T2 (must be the last command of the 
                            //  timer configuration sequence) 
    OC2CONbits.OCM = 6;     // PWM mode on OCx; fault pin disabled 
    OC2CONbits.OCTSEL = 1;  // Use timer T3 as the time base for PWM generation 
    OC2RS = 41666 * 0.75;   // Ton constant 
    OC2CONbits.ON = 1;      // Enable OC1 module

    TRISB = TRISB | 0x0005; // 0x 0000 0000 0000 0101

    while(1)
    {
        if(PORTBbits.RB2 == 0 && PORTBbits.RB0 == 0)
        {
            OC2RS = 41666 * 0.3;
        }
        if(PORTBbits.RB2 == 1 && PORTBbits.RB0 == 1)
        {
            OC2RS = 41666 * 0.55;
        }
        delay(0.36);
    }
    

    return 0;
}

void delay(unsigned int ms)
{
    resetCoreTimer();
    while(readCoreTimer() < 20000 * ms);
}