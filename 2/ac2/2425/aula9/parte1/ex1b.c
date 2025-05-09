#include <detpic32.h>

void configureAll();
void send2displays(unsigned char value);
unsigned char toBcd(unsigned char value);

volatile int voltage = 0; // Global variable    

int main(void) 
{ 
    configureAll();     // Function to configure all (digital I/O, analog  
                        // input, A/D module, timers T1 and T3, interrupts) 
    
    // Reset AD1IF, T1IF and T3IF flags 
    EnableInterrupts();     // Global Interrupt Enable 
    
    while(1) 
    { 
        IdleMode(); 
    } 
    
    return 0; 
}

void configureAll()
{
    // I/O PORTS
    // reset
    LATB = (LATB & 0x80FF);     // 1000 0000 1111 1111 (14 a 8)
    LATD = (LATD & 0xFF9F);     // 1111 1111 1001 1111 (displays)
    // config
    TRISB = (LATB & 0x80FF);     // 1000 0000 1111 1111 (14 a 8)
    TRISD = (LATD & 0xFF9F);     // 1111 1111 1001 1111 (displays)

    // ADC
    TRISBbits.TRISB4 = 1;       // RBx digital output disconnected 
    AD1PCFGbits.PCFG4 = 0;      // RBx configured as analog input 
    AD1CON1bits.SSRC = 7;       // Conversion trigger selection bits: in this 
                                //  mode an internal counter ends sampling and 
                                //  starts conversion 
    AD1CON1bits.CLRASAM = 1;    // Stop conversions when the 1st A/D converter 
                                //  interrupt is generated. At the same time, 
                                //  hardware clears the ASAM bit 
    AD1CON3bits.SAMC = 16;      // Sample time is 16 TAD (TAD = 100 ns) 
    AD1CON2bits.SMPI = 8-1;     // Interrupt is generated after N samples 
                                //  (replace N by the desired number of 
                                //  consecutive samples) 
    AD1CHSbits.CH0SA = 4;       // replace x by the desired input  
                                //  analog channel (0 to 15) 
    AD1CON1bits.ON = 1;         // Enable A/D converter 
                                //  This must the last command of the A/D 
                                //  configuration sequence 

    // TIMERS
    // Configure Timer T1 (5 Hz with interrupts disabled)
    T1CONbits.TCKPS = 6;    // 1:64 prescaler 
    PR1 = 62499;
    TMR1 = 0;               // Clear timer T1 count register
    T1CONbits.TON = 1;      // Enable timer T1 (must be the last command of the timer configuration sequence)
    // Configure Timer T3 (100 Hz with interrupts disabled)
    T3CONbits.TCKPS = 2;    // 1:16 prescaler
    PR3 = 49999;
    TMR3 = 0;               // Clear timer T3 count register
    T3CONbits.TON = 1;      // Enable timer T3 (must be the last command of the timer configuration sequence)
    
    // ENABLE INTERRUPTS
    // Configure Timer T1 with interrupts enabled 
    IPC1bits.T1IP = 1;      // Interrupt priority (must be in range [1..6]) 
    IEC0bits.T1IE = 1;      // Enable timer T1 interrupts 
    IFS0bits.T1IF = 0;      // Reset timer T1 interrupt flag
    // Configure Timer T3 with interrupts enabled 
    IPC3bits.T3IP = 2;      // Interrupt priority (must be in range [1..6]) 
    IEC0bits.T3IE = 1;      // Enable timer T3 interrupts 
    IFS0bits.T3IF = 0;      // Reset timer T3 interrupt flag
    // ADC with interrupts enabled
    IPC6bits.AD1IP = 3;     // configure priority of A/D interrupts
    IEC1bits.AD1IE = 1;     // Enable A/D interrupts
    IFS1bits.AD1IF = 0;     // Reset timer AD interrupt flag 
       
}

void _int_(4) isr_T1(void) 
{ 
    // Start A/D conversion
    AD1CON1bits.ASAM = 1;

    // Reset T1IF flag
    IFS0bits.T1IF = 0;
}

void _int_(12) isr_T3(void) 
{ 
    // Send the value of the global variable "voltage" to the displays  using BCD (decimal) format
    send2displays(voltage);
 
    // Reset T3IF flag
    IFS0bits.T3IF = 0;
}

void _int_(27) isr_adc(void) 
{
    int *p = (int *)(&ADC1BUF0);
    int i;
    double average = 0;
    
    // Calculate buffer average (8 samples)
    for (i = 0; i < 8; i++){
        average += p[i * 4];
    }
    average = average / 8;

    // Calculate voltage amplitude and copy it to "voltage"
    voltage = (average * 33 + 511) / 1023;

    printInt10(voltage);
    voltage = toBcd(voltage);
    putChar('\r');

    IFS1bits.AD1IF = 0;  // Reset AD1IF flag 
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