#include <detpic32.h>

void putstr(char *str);
void putc(char byte);

volatile int count;

int main(void)
{
    // config UART
    U2BRG = 519;            // (20*10⁶ / 16 * baudrate) - 1 = 519
    U2MODEbits.BRGH = 0;    // dividir por 16
    U2MODEbits.PDSEL = 0;   // even parity
    U2MODEbits.STSEL = 1;   // 2 stop bits
    U2STAbits.UTXEN = 1;
    U2STAbits.URXEN = 1;
    U2MODEbits.ON = 1;
    //
    IEC1bits.U2RXIE = 1;
    IEC1bits.U2TXIE = 0;
    IPC8bits.U2IP = 2;
    IFS1bits.U2RXIF = 0;

    TRISE = TRISE & 0xFFF0; // 0x 1111 1111 1111 0000
    LATE = (LATE & 0xFFF0) | count;
    
    EnableInterrupts();

    while(1);

    return 0;
}

void _int_(32) UART(void)
{
    if(IFS1bits.U2RXIF == 1)
    {
        char c = U2RXREG;
        if(c == 'F')
        {
            count++;
            if(count > 9)
            {
                count = 0;
            }
        }
        else if(c == 'C')
        {
            count = 0;
            putstr("\nVALOR MINIMO\n");
        }
    }
    LATE = (LATE & 0xFFF0) | count;
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
    U2RXREG = byte;
}