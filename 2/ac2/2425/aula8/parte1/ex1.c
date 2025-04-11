#include <detpic32.h>

int main(void) 
{
    // Configure Timer T3 (2 Hz with interrupts disabled)
    T3CONbits.TCKPS = 7;    // 1:256 prescaler 
    PR3 = 39062;            // Fout = 20MHz / (32 * (62499 + 1)) = 10 Hz 
    TMR3 = 0;               // Clear timer T2 count register 
    T3CONbits.TON = 1;      // Enable timer T2 (must be the last command of the timer configuration sequence) 
    
    IFS0bits.T3IF = 0;
    while(1)
    {
        // Wait while T3IF = 0
        while(IFS0bits.T3IF == 0);
        IFS0bits.T3IF = 0; // Reset T3IF
        putChar('.');
    }
    return 0; 
}



// Exemplo Timers

// quero um timer de 10hz. logo fout = 10
// primeiro calculo o valor do prescaler (é o valor que inicialmente vai dividir o pbclk)
// Kprescaler = PBCLK / ((65535 + 1) * fout), onde o PBCLK é 20*10⁶
// substituindo fout por 10, vai dar 30.51; isto quer dizer que o valor para usar nos prescalers vai ter que ser no minimo 30.51; logo pode se usar 32,64 ou 256. vamos usar 32.
// Kprescaler = 32;

// depois calcula-se o valor de PRx(o próprio valor armazenado no timer(16 bits)):
// PRx = (PBCLK / Kprescaler / fout) - 1 e vai dar 62499.
// Metemos o timer a contar 1 vez, a cada 32 clocks da pbclk, até 62499. isto produz uma frequencia de 10hz