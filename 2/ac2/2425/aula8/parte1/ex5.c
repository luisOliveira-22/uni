#include <detpic32.h>

int main(void)
{
    // configurar RD0 e RD2 como saídas
    TRISDbits.TRISD0 = 0;
    TRISDbits.TRISD2 = 0;
    
    // iniciar RD0 e RD2 a 0
    LATDbits.LATD0 = 0;
    LATDbits.LATD2 = 0;

    // Configure Timers T1 and T3 with interrupts enabled)

    // Configure Timer T1 (5 Hz with interrupts disabled)
    T1CONbits.TCKPS = 2;    // 1:64 prescaler 
    PR1 = 62499;
    TMR1 = 0;               // Clear timer T2 count register
    T1CONbits.TON = 1;      // Enable timer T2 (must be the last command of the timer configuration sequence)

    // Configure Timer T3 with interrupts enabled 
    IPC1bits.T1IP = 2; // Interrupt priority (must be in range [1..6]) 
    IEC0bits.T1IE = 1; // Enable timer T2 interrupts 
    IFS0bits.T1IF = 0; // Reset timer T2 interrupt flag

    // Configure Timer T3 (25 Hz with interrupts disabled)
    T3CONbits.TCKPS = 4;    // 1:16 prescaler
    PR3 = 49999;
    TMR3 = 0;               // Clear timer T2 count register
    T3CONbits.TON = 1;      // Enable timer T2 (must be the last command of the timer configuration sequence)

    // Configure Timer T3 with interrupts enabled 
    IPC3bits.T3IP = 2; // Interrupt priority (must be in range [1..6]) 
    IEC0bits.T3IE = 1; // Enable timer T2 interrupts 
    IFS0bits.T3IF = 0; // Reset timer T2 interrupt flag

    // Reset T1IF and T3IF flags
    IFS0bits.T1IF = 0;  // Reset T1IF flag
    IFS0bits.T3IF = 0;  // Reset T3IF flag

    EnableInterrupts();
    while (1)
    {
        IdleMode();
    }
    
    return 0;
}

void _int_(4) isr_T1(void)
{
    LATDbits.LATD0 = !LATDbits.LATD0;   // toggle
    IFS0bits.T1IF = 0;                  // Reset T1IF flag
}

void _int_(12) isr_T3(void) 
{
    LATDbits.LATD2 = !LATDbits.LATD2;   // toggle
    IFS0bits.T3IF = 0;                  // Reset T3IF flag
}