#include <detpic32.h>

void delay(unsigned int ms);
unsigned char toBcd(unsigned char value);
void sendtodisplay(unsigned char value);

volatile unsigned char voltage;

// esta é dada
unsigned char toBcd(unsigned char value)
{
    return ((value / 10) << 4) + (value % 10);
}

// esta é dada
void sendtodisplay(unsigned char value) {

    TRISD = (TRISD & 0x0000) | 0xFF9F;
    TRISB = (TRISB & 0x0000) | 0x80FF; 

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

void delay(unsigned int ms){
	resetCoreTimer();
	while(readCoreTimer() < 20000 * ms);
}

void _int_(12) isr_T3(void){
	sendtodisplay(toBcd(voltage));
	IFS0bits.T3IF = 0;
}

int main(void){
	
	T3CONbits.TCKPS = 1;	// (1 2 4 8 ...) -> 20 * 10^6 / 65536 * 250Hz = 1,... -> o expoente seguinte é 2
	PR3 = 39999;				// 20 * 10^6 / 2 = 10 * 10^6	// 10 * 10^6 / 250Hz = 40000
	TMR3 = 0;				// copiar
	T3CONbits.TON = 1; 			// copiar

	IPC3bits.T3IP = 2;			// (guiao 8 > C3 porque é T3)
	IEC0bits.T3IE = 1;			// 
	IFS0bits.T3IF = 0;			// 

	TRISBbits.TRISB4 = 1;			// copiar (guiao 6)
	AD1PCFGbits.PCFG4= 0;			// copiar
 	AD1CON1bits.SSRC = 7;			// copiar
 	AD1CON1bits.CLRASAM = 1;		// copiar
 	AD1CON3bits.SAMC = 16;			// copiar
 	AD1CON2bits.SMPI = 2-1;			// N = 2 amostras
 	AD1CHSbits.CH0SA = 4;			// x = 4 (vem do AN4)
 	AD1CON1bits.ON = 1;			// copiar

	EnableInterrupts();
	while(1){
		AD1CON1bits.ASAM = 1;			// copiar (guiao 6)
		while(IFS1bits.AD1IF == 0);		// copiar (guiao 6)
		int* p = (int *)(&ADC1BUF0);

		int avg = (p[0] + p[4])/2;
		voltage = (avg * 66 + 511) / 1023 + 7;

		IFS1bits.AD1IF = 0;
		delay(200);
	}
	
	return 0;
}