#include <detpic32.h>

void delay(unsigned int ms);

int main(void)
{
    T2CONbits.TCKPS = 2; // prescaler = 4
    PR2 = 33332;   // Fout = 20MHz / (32 * (62499 + 1)) = 10 Hz 
    TMR2 = 0;    // Reset timer T2 count register 
    T2CONbits.TON = 1; // Enable timer T2 (must be the last command of the 
            //  timer configuration sequence) 
    OC2CONbits.OCM = 6;  // PWM mode on OCx; fault pin disabled 
    OC2CONbits.OCTSEL =0;// Use timer T2 as the time base for PWM generation 
    OC2RS = 8333;   // PR2 * 0.25 
    OC2CONbits.ON = 1; // Enable OC1 module

    TRISBbits.TRISB3 = 1;
    TRISBbits.TRISB0 = 1;

    while (1)
    {
        if(PORTBbits.RB3 == 0 && PORTBbits.RB0 == 1)
        {
            OC2RS = 33332 * 0.25;
        }
        else if(PORTBbits.RB3 == 1 && PORTBbits.RB0 == 0)
        {
            OC2RS = 33332 * 0.75;
        }
        delay(250000); // 250 micro = 250000 mili
    }
    

    return 0;
}

void delay(unsigned int ms)
{
    resetCoreTimer();
    while (readCoreTimer() < 20000 * ms);
}