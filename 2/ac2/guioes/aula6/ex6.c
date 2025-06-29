#include <detpic32.h>

void setup();
void delay(int ms);
void send2displays(unsigned char value);
unsigned char toBcd(unsigned char value);

int main(void)
{

    // config A/D module
    setup();

    // config ports
    TRISB = TRISB & 0x80FF;  // configurar TRISB[8] A TRISB[14] como saidas
    TRISD = TRISD & 0xFF9F;  // configurar displays high e low como saidas

    // desligar ambos os displays
    LATDbits.LATD5 = 0;
    LATDbits.LATD6 = 0;

    int i = 0;
    int counter = 0;
    int voltage, media;

    while(1)
    {
        if (counter % 20 == 0 && counter != 0)  // % 20 por causa de 5Hz
        {
            AD1CON1bits.ASAM = 1;               // Start conversion
            while(IFS1bits.AD1IF == 0);         // Wait while conversion not done
            
            int *p = (int *) (&ADC1BUF0);
            voltage = 0;
            for (i = 0; i < 4; i++) {
                voltage += (p[i*4] * 33 + 511) / 1023;
            }
            media = voltage/4;
            IFS1bits.AD1IF = 0;                 // Reset AD1IF
        }
        send2displays(toBcd(media));
        delay(10);
        counter++;
    }
    return 0;
}

void delay(int ms)
{
    resetCoreTimer();
    while(readCoreTimer() < 20000 * ms);
}

void send2displays(unsigned char value)
{
    static const char disp7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
    //                                  0     1     2     3     4     5     6     7     8     9     A     B     C     D     E     F
    
    static char displayFlag = 0;

    int dh = value >> 4;
    int dl = value & 0x0F;

    if(displayFlag == 0)
    {
        LATDbits.LATD5 = 1;
        LATDbits.LATD6 = 0;

        LATB = (LATB & 0x80FF) | (disp7Scodes[dl] << 8); // Clean the display and set the right value
    }
    else
    {
        LATDbits.LATD5 = 0;
        LATDbits.LATD6 = 1;

        LATB = (LATB & 0x80FF) | (disp7Scodes[dh] << 8); // Clean the display and set the right value
    }

    displayFlag = !displayFlag;
}

unsigned char toBcd(unsigned char value)
{
    return ((value / 10) << 4) + (value % 10);
}

void setup(){
    TRISBbits.TRISB4 = 1;       // RBx digital output disconnected
    AD1PCFGbits.PCFG4 = 0;      // RBx configured as analog input
    AD1CON1bits.SSRC = 7;       // Conversion trigger selection bits: in this
                                // mode an internal counter ends sampling and
                                // starts conversion
    AD1CON1bits.CLRASAM = 1;    // Stop conversions when the 1st A/D converter
                                // interrupt is generated. At the same time,
                                // hardware clears the ASAM bit
    AD1CON3bits.SAMC = 16;      // Sample time is 16 TAD (TAD = 100 ns)
    AD1CON2bits.SMPI = 4-1;     // Interrupt is generated after XX samples
                                // (replace XX by the desired number of
                                // consecutive samples)
    AD1CHSbits.CH0SA = 4;       // replace x by the desired input
                                // analog channel (0 to 15)
    AD1CON1bits.ON = 1;         // Enable A/D converter
                                // This must the last command of the A/D
                                // configuration sequence
}