#include <detpic32.h>

int main(void)
{
    // Configure Timer T3 (2 Hz with interrupts disabled)
    T3CONbits.TCKPS = 7;    // 1:256 prescaler 
    PR3 = 39062;            // Fout = 20MHz / (32 * (62499 + 1)) = 10 Hz 
    TMR3 = 0;               // Clear timer T2 count register 
    T3CONbits.TON = 1;      // Enable timer T2 (must be the last command of the timer configuration sequence) 

    // Configure Timer T3 with interrupts enabled 
    IPC3bits.T3IP = 2; // Interrupt priority (must be in range [1..6]) 
    IEC0bits.T3IE = 1; // Enable timer T2 interrupts 
    IFS0bits.T3IF = 0; // Reset timer T2 interrupt flag

    EnableInterrupts();
    while(1)
    {
        IdleMode(); // CPU enters Idle mode3 (CPU is halted, but peripherals continue to operate)
    }
    return 0;
}

void _int_(12) isr_T3(void) // Replace VECTOR by the timer T3 vector number 
{
    putChar('.');
    IFS0bits.T3IF = 0; // Reset T3 interrupt flag
}