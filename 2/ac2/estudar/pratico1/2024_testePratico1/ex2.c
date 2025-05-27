#include <detpic32.h>

void delay(unsigned int ms);
void send2display(unsigned char val);

int main(void)
{
    // config ADC
    TRISBbits.TRISB4 = 1;       // RBx digital output disconnected
    AD1PCFGbits.PCFG4 = 0;      // RBx configured as analog input
    AD1CON1bits.SSRC = 7;       // Conversion trigger selection bits: in this
                                // mode an internal counter ends sampling and
                                // starts conversion
    AD1CON1bits.CLRASAM = 1;    // Stop conversions when the 1st A/D converter
                                // interrupt is generated. At the same time,
                                // hardware clears the ASAM bit
    AD1CON3bits.SAMC = 16;      // Sample time is 16 TAD (TAD = 100 ns)
    AD1CON2bits.SMPI = 2-1;     // Interrupt is generated after XX samples
                                // (replace XX by the desired number of
                                // consecutive samples)
    AD1CHSbits.CH0SA = 4;       // replace x by the desired input
                                // analog channel (0 to 15)
    AD1CON1bits.ON = 1;         // Enable A/D converter
                                // This must the last command of the A/D
                                // configuration sequence
    
    // config ports 
    TRISEbits.TRISE1 = 0;       // configurar LED
    LATEbits.LATE1 = 0;         // iniciar com LED desligado

    TRISDbits.TRISD5 = 0;       // display menos significativo como saída
    TRISB = TRISB & 0x80FF;     // RE14 a RE8 -> 1000 0000 1111 1111

    // variables
    int i;
    int media;
    int voltage;

    while(1)
    {
        voltage = 0;
        AD1CON1bits.ASAM = 1;       // Start conversion
        while(IFS1bits.AD1IF == 0); // Wait while conversion not done

        int* p = (int*) (&ADC1BUF0);
        
        for(i = 0; i < 2; i++)
        {
            voltage += (p[i*4] * 33 + 511) / 1023;
        }
        media = voltage / 2;

        printInt(media, 16 | 3 << 16);
        putChar('\n');
        send2display(media);

        LATEbits.LATE1 = !LATEbits.LATE1;
        delay(166);

        IFS1bits.AD1IF = 0;         // Reset AD1IF
    }
    return 0;
}

void delay(unsigned int ms)
{
    resetCoreTimer();
    while(readCoreTimer() < 20000 * ms);
}

void send2display(unsigned char val){
    static const char disp7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
    //                                  0     1     2     3     4     5     6     7     8     9     A     B     C     D     E     F
    
    val = (val * (9-0) / 33) + 0;
    int displayLow = val & 0x0F;

    LATDbits.LATD5 = 1;
    LATB = (LATB & 0x80FF) | (disp7Scodes[displayLow] << 8);
}