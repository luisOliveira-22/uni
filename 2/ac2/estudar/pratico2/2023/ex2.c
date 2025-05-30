#include <detpic32.h>

void delay(unsigned int ms);
char tobcd(char val);
void send2displays(unsigned char value);

volatile unsigned char voltage;

int main(void)
{
    TRISBbits.TRISB4 = 1;
    AD1PCFGbits.PCFG4= 0;
    AD1CON1bits.SSRC = 7;
    AD1CON1bits.CLRASAM = 1;
    AD1CON3bits.SAMC = 16;
    AD1CON2bits.SMPI = 2-1;
    AD1CHSbits.CH0SA = 4;
    AD1CON1bits.ON = 1;

    T3CONbits.TCKPS = 2;
    PR3 = 35713;
    TMR3 = 0;
    T3CONbits.TON = 1;
    IPC3bits.T3IP = 2;
    IEC0bits.T3IE = 1;
    IFS0bits.T3IF = 0;

    TRISD = TRISD & 0xFF9F;
    TRISB = TRISB & 0x80FF;

    EnableInterrupts();

    while(1)
    {
        AD1CON1bits.ASAM = 1;
        while( IFS1bits.AD1IF == 0 );

        int *p = (int *)(&ADC1BUF0);
        int aux = (p[0] + p[4]) / 2;            // 2 conversões
        voltage = (aux * 65 + 511) / 1023 + 10; // 75ºC - 10ºC = 65ºC

        IFS1bits.AD1IF = 0;
        delay(200);
    }

    return 0;
}

void _int_(12) isr_T3(void)
{
    send2displays(tobcd(voltage));
    IFS0bits.T3IF = 0;
}

void delay(unsigned int ms)
{
    resetCoreTimer();
    while(readCoreTimer() < 20000 * ms);
}

char tobcd(char val)
{
    return (val / 10 << 4) | val % 10;
}

void send2displays(unsigned char value) {

    static const char disp7Scodes[] = {
        0x3F, 0x06, 0x5B, 0x4F,
        0x66, 0x6D, 0x7D, 0x07,
        0x7F, 0x6F, 0x77, 0x7C,
        0x39, 0x5E, 0x79, 0x71
    };
    static char displayFlag = 1; // 1 for HI-D, 0 for LO-D

    if (displayFlag) {
        LATD = ( LATD & 0x0000 ) | 0x0040; // Activate HI-D, disable LO-D
        LATB = ( LATB & 0x0000 ) | disp7Scodes[value >> 4] << 8; // Write the values of RB8-RB14
        displayFlag = 0;
    } else {
        LATD = ( LATD & 0x0000 ) | 0x0020; // Disable HI-D, activate LO-D
        LATB = ( LATB & 0x0000 ) | disp7Scodes[value & 0x0F] << 8; // Write the values of RB8-RB14
        displayFlag = 1;
    }
}