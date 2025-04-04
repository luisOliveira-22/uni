#include <detpic32.h>

void delay(unsigned int ms);
void send2disp(unsigned char value);

int main(int argc, char const *argv[])
{
    // config
    TRISBbits.TRISB4 = 1; // RBx digital output disconnected 
    AD1PCFGbits.PCFG4= 0; // RBx configured as analog input 
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

    TRISB = TRISB & 0x80FF;   // 14-8 -> 1000 0000 1111 1111
    TRISDbits.TRISD5 = 0;
    LATDbits.LATD5 = 1;
    
    TRISEbits.TRISE1 = 0;
    LATEbits.LATE1 = 1;

    int i;
    int voltage;
    int media;

    while(1)
    {
        voltage = 0;

        // BUSCAR NO GUIAO
        AD1CON1bits.ASAM = 1;   // Start conversion
        while( IFS1bits.AD1IF == 0 ); // Wait while conversion not done

        // DECORAR
        int *p = (int*)(&ADC1BUF0);

        for (i = 0; i < 2; i++)
        {
            // DECORAR
            voltage += (p[i*4] * 33 + 511) / 1023;
        }
        media = voltage/2;

        printInt(media, 16 | 3 << 16);
        putChar('\n');

        send2disp(media);

        delay(166); // 6 Hz = 1/6 = 166 ms

        LATEbits.LATE1 = !LATEbits.LATE1;

        IFS1bits.AD1IF = 0; // BUSCAR NO GUIAO
    }
    return 0;
}

delay(unsigned int ms)
{
    resetCoreTimer();
    while(readCoreTimer() < 20000 * ms);
}

void send2disp(unsigned char value)
{
    static const char disp7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
    //                                  0     1     2     3     4     5     6     7     8     9     A     B     C     D     E     F
    
    // DECORAR
    value = (value * (9-2) / 33) + 2;
    int displayLow = value & 0x0F;
    LATB = (LATB & 0x80FF) | (disp7Scodes[displayLow] << 8);
}