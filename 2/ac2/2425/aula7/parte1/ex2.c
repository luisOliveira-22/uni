#include <detpic32.h>

void send2displays(unsigned char value);
unsigned char toBcd(unsigned char value);
void delay(int ms);

volatile unsigned char voltage = 0; // Global variable

int main(void) 
{ 
    // Configure all (digital I/O, analog input, A/D module) 
    TRISB = TRISB & 0x80FF;                 // configurar TRISB[14] A TRISB[8] como saídas
    TRISD = TRISD & 0xFF9F;                 // configurar displays high e low como saídas

    TRISBbits.TRISB4 = 1;                   // RBx digital output disconnected 
    AD1PCFGbits.PCFG4 = 0;                  // RBx configured as analog input 
    AD1CON1bits.SSRC = 7;                   // Conversion trigger selection bits: in this 
                                            //  mode an internal counter ends sampling and 
                                            //  starts conversion 
    AD1CON1bits.CLRASAM = 1;                // Stop conversions when the 1st A/D converter 
                                            //  interrupt is generated. At the same time, 
                                            //  hardware clears the ASAM bit 
    AD1CON3bits.SAMC = 16;                  // Sample time is 16 TAD (TAD = 100 ns) 
    AD1CON2bits.SMPI = 8-1;                 // Interrupt is generated after N samples 
                                            //  (replace N by the desired number of 
                                            //  consecutive samples) 
    AD1CHSbits.CH0SA = 4;                   // replace x by the desired input  
                                            //  analog channel (0 to 15) 
    AD1CON1bits.ON = 1;                     // Enable A/D converter 
                                            //  This must the last command of the A/D 
                                            //  configuration sequence

    // Configure interrupt system
    IPC6bits.AD1IP = 2;                     // configure priority of A/D interrupts
    IFS1bits.AD1IF = 0;                     // clear A/D interrupt flag
    IEC1bits.AD1IE = 1;                     // enable A/D interrupts
    EnableInterrupts();                     // Global Interrupt Enable 

    // Start A/D conversion 
    AD1CON1bits.ASAM = 1;                   // Start conversion

    int cnt = 0;

    while(1) 
    { 
        if (cnt % 20 == 0 && cnt != 0) {    // efetuar 5 sequências de conversão A/D por segundo (frequência de amostragem de 5 Hz)
            AD1CON1bits.ASAM = 1;           // Start conversion
        }
        send2displays(voltage);             // Send "voltage" value to displays
        delay(10);                          // enviar informação para o sistema de visualização a cada 10 ms (frequência de refrescamento de 100 Hz)
        cnt++;
    } 
    
    return 0; 
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

void delay(int ms)
{
    resetCoreTimer();
    while(readCoreTimer() < 20000 * ms);
}

// Interrupt Handler 
void _int_(27) isr_adc(void)        // Replace VECTOR by the A/D vector 
{                                   // number - see "PIC32 family data  
                                    // sheet" (pages 74-76) 
 
    int i;
    int val = 0;

    int *p = (int *)(&ADC1BUF0);
    for (i = 0; i < 8; i++) {
        val += (p[i * 4] * 33 + 511) / 1023;
    }
    voltage = val / 8;              // Calculate voltage amplitude

    voltage = toBcd(voltage);       // Convert voltage amplitude to decimal and store the result in the global variable "voltage"

    IFS1bits.AD1IF = 0;             // Reset AD1IF flag 
}