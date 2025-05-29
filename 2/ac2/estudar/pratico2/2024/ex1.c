#include <detpic32.h>

void delay(unsigned int ms);

int main(void)
{
    // config (guião 9)
    T3CONbits.TCKPS = 2;
    PR3 = 38461;
    TMR3 = 0;
    T3CONbits.TON = 1;
    OC4CONbits.OCM = 6;
    OC4CONbits.OCTSEL = 1;  // (timer3) OCTSEL = 1, (timer2) OCTSEL = 0
    OC4RS = 19231;
    OC4CONbits.ON = 1;

    TRISBbits.TRISB1 = 1;
    int flag = 0;
    
    while(1)
    {
        if(PORTBbits.RB1 == 0)
        {
            if(flag == 0)
            {
                OC4RS = 38461 * 0.25;
            }
            else
            {
                OC4RS = 38461 * 0.75;
            }
        }
        flag = !flag;
        delay(1300);
    }

    return 0;
}

void delay(unsigned int ms)
{
    resetCoreTimer();
    while(readCoreTimer() < 20000 * ms);
}


// primeiro, vamos calcular o Kprescaler
// fout = 130 Hz
// (FÓRMULA): Kprescaler = 20*10⁶ / ((65535 + 1) * fout)
// Kprescaler = 2,348
// isto quer dizer que o valor para usar nos
// prescalers vai ter que ser no minimo 2,348;
// logo, pode-se usar 4, 8, 16, 32, 64 ou 256. vamos usar 4
// Kprescaler = 4;
// portanto, TCKPS = 2, pela tabela (1 2 4 8 ...)

// segundo, vamos calcular o PRx
// (FÓRMULA) PRx = (20*10⁶ / Kprescaler * fout) - 1
// PRx ~= 38461

// terceiro, calcular o OCxRS
// (FÓRMULA) OCxRS = PRx * dutycycleInicial
// OCxRS ~= 19231