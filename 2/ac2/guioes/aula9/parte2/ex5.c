#include <detpic32.h>

void setPWM(unsigned int dutyCycle);

int main(void) 
{ 
    // Configure Timer T3 
    T3CONbits.TCKPS = 2;    // 1:4 prescaler
    PR3 = 49999;
    TMR3 = 0;               // Clear timer T3 count register
    T3CONbits.TON = 1;      // Enable timer T3 (must be the last command of the timer configuration sequence)
    IPC3bits.T3IP = 2;      // Interrupt priority 2
    IEC0bits.T3IE = 1;      // Enable timer T3 interrupts
    IFS0bits.T3IF = 0;      // Reset timer T3 interrupt flag

    // Configure Output Compare Module 1 (OC1)
    OC1CONbits.OCM = 6;     // PWM mode on OCx; fault pin disabled 
    OC1CONbits.OCTSEL = 1;  // Use timer T3 as the time base for PWM generation 
    OC1RS = 12500;          // Ton constant 
    OC1CONbits.ON = 1;      // Enable OC1 module 

    // alterando valores dutyCycle
    setPWM(65);

    // reset RC14
    LATCbits.LATC14 = 0;
    // config RC14
    TRISCbits.TRISC14 = 0;

    EnableInterrupts();

    while(1) 
    {
        // Read the value of port RD0 and write it on port RC14 
        // (CPU should not enter Idle Mode)
        LATCbits.LATC14 = PORTDbits.RD0;
    } 
    return 0; 
}

void _int_(12) isr_T3(void)
{
    IFS0bits.T3IF = 0;
}

void setPWM(unsigned int dutyCycle) 
{ 
    // duty_cycle must be in the range [0, 100]
    if(dutyCycle >= 0 && dutyCycle <= 100){
        OC1RS = (PR3 + 1) * dutyCycle / 100; // Determine OC1RS as a function of "dutyCycle"
    }
}