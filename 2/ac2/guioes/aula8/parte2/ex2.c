#include <detpic32.h>

int main(void)
{
    // Configure ports, Timer T2, interrupts and external interrupt INT1
    // Ports
    TRISEbits.TRISE0 = 0;
    TRISDbits.TRISD8 = 1;
    // Iniciar RE0 a 0
    LATEbits.LATE0 = 0;
    // Configure Timer T2 (f = 1/3seg = 0.33 Hz)
    T3CONbits.TCKPS = 7;    // 1:256 prescaler
    PR2 = 65519; // NAO SEI
    TMR3 = 0;               // Clear timer T3 count register
    T3CONbits.TON = 1;      // Enable timer T3 (must be the last command of the timer configuration sequence)

    // Configure Timer T3 with interrupts enabled 
    IPC3bits.T3IP = 2; // Interrupt priority (must be in range [1..6]) 
    IEC0bits.T3IE = 1; // Enable timer T3 interrupts 
    IFS0bits.T3IF = 0; // Reset timer T3 interrupt flag
    // Reset T2IF flag
    IFS0bits.T2IF = 0;

    EnableInterrupts();
    while(1)
    {
        IdleMode();
    }
    return 0;
}

void _int_(8) isr_T2(void)
{

}

void _int_(7) isr_INT1(void)
{

}

// quero um timer de 10hz. logo fout = 10
// primeiro calculo o valor do prescaler (é o valor que inicialmente vai dividir o pbclk)
// Kprescaler = PBCLK / ((65535 + 1) * fout), onde o PBCLK é 20*10⁶
// substituindo fout por 10, vai dar 30.51; isto quer dizer que o valor para usar nos prescalers vai ter que ser no minimo 30.51; logo pode se usar 32,64 ou 256. vamos usar 32.
// Kprescaler = 32;

// depois calcula-se o valor de PRx(o próprio valor armazenado no timer(16 bits)):
// PRx = (PBCLK / Kprescaler / fout) - 1 e vai dar 62499.
// Metemos o timer a contar 1 vez, a cada 32 clocks da pbclk, até 62499. isto produz uma frequencia de 10hz