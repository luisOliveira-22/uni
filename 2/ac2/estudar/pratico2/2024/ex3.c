#include <detpic32.h>

void putc(char byte);
void putstr(char *str);

int main(void)
{
    // config UART
    // (guião 10)
    U2BRG = 129;            // (FÓRMULA) (20Mhz / 16 * baudrate) - 1
    U2MODEbits.BRGH = 0;    // dividir por 16
    U2MODEbits.PDSEL = 2;   // Odd parity (se fosse N => PDSEL = 0) (se fosse E => PDSEL = 1)
    U2MODEbits.STSEL = 1;   // 2 stop bits (se for 1 stop bit => STSEL = 0)
    U2STAbits.UTXEN = 1;
    U2STAbits.URXEN = 1;
    U2MODEbits.ON = 1;
    // (guião 11)
    IEC1bits.U2RXIE = 1;
    IEC1bits.U2TXIE = 0;
    IPC8bits.U2IP = 2;
    IFS1bits.U2RXIF = 0;

    TRISB = TRISB | 0x000F;
    TRISEbits.TRISE7 = 0;
    LATEbits.LATE7 = 0;

    EnableInterrupts();

    while(1);
    
    return 0;
}

void _int_(32) UART(void)
{
    if(IFS1bits.U2RXIF == 1)
	{
		int value = PORTB & 0x000F;
        char c = U2RXREG;
        putstr("\n");
        putc(c);
        if(c == 'D')
        {
            int dezenas = value / 10;
            int unidades = value % 10;
            putstr("DSD=");
            putc(dezenas + '0');
            putc(unidades + '0');
        }
        LATEbits.LATE7 = !LATEbits.LATE7;
	}
	IFS1bits.U2RXIF = 0;
}

void putstr(char *str)
{
    while(*str)
    {
        putc(*str++);
    }
}

void putc(char byte)
{
    while(U2STAbits.UTXBF == 1);
	U2TXREG = byte;
}