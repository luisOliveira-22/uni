#include <detpic32.h>

void delay(unsigned int ms);
char tobcd(char val);
void send2displays(unsigned char value);

volatile unsigned int voltage;

int main(void)
{
    TRISBbits.TRISB4 = 1; // RBx digital output disconnected 
    AD1PCFGbits.PCFG4 = 0; // RBx configured as analog input 
    AD1CON1bits.SSRC = 7; // Conversion trigger selection bits: in this 
            //  mode an internal counter ends sampling and 
            //  starts conversion 
    AD1CON1bits.CLRASAM = 1;  // Stop conversions when the 1st A/D converter 
            //  interrupt is generated. At the same time, 
            //  hardware clears the ASAM bit 
    AD1CON3bits.SAMC = 16;    // Sample time is 16 TAD (TAD = 100 ns) 
    AD1CON2bits.SMPI = 2-1; // Interrupt is generated after N samples 
            //  (replace N by the desired number of 
            //  consecutive samples) 
    AD1CHSbits.CH0SA = 4;   // replace x by the desired input  
            //  analog channel (0 to 15) 
    AD1CON1bits.ON = 1;     // Enable A/D converter 
            //  This must the last command of the A/D 
            //  configuration sequence 

    T2CONbits.TCKPS = 2; // 1:32 prescaler (i.e. fout_presc = 625 KHz) 
    PR2 = 41666;   // Fout = 20MHz / (32 * (62499 + 1)) = 10 Hz 
    TMR2 = 0;    // Clear timer T2 count register 
    T2CONbits.TON = 1; // Enable timer T2 (must be the last command of the 
                        //  timer configuration sequence)
    IPC2bits.T2IP = 2; // Interrupt priority (must be in range [1..6]) 
    IEC0bits.T2IE = 1; // Enable timer T2 interrupts 
    IFS0bits.T2IF = 0; // Reset timer T2 interrupt flag

    TRISD = TRISD & 0xFF9F; // 1111 1111 1001 1111
    TRISB = TRISB & 0x80FF;

    EnableInterrupts();

    while (1)
    {
        AD1CON1bits.ASAM = 1;   // Start conversion
        while( IFS1bits.AD1IF == 0 ); // Wait while conversion not done

        int *p = (int *)(&ADC1BUF0);
        int aux = (p[0] + p[4])/2;
        voltage = (aux * 50 + 511) / 1023 + 15;

        IFS1bits.AD1IF = 0;
        delay(100);
    }
    

    return 0;
}

void _int_(8) isr_T2(void)
{
    send2displays(tobcd(voltage));
    IFS0bits.T2IF = 0;
}

void delay(unsigned int ms)
{
    resetCoreTimer();
    while(readCoreTimer() < 20000 * ms);
}

// fornecida pelo enunciado
char tobcd(char val)
{
    return (val / 10 << 4) | val % 10;
}

// fornecida pelo enunciado
void send2displays(unsigned char value)
{

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