#include <detpic32.h>

void delay(unsigned int ms);
void putc(char byte);
void putstr(char *str);

volatile int count = 15;

int main(void)
{
    U2BRG = 129;            // 20*10⁶ / (baudrate * 16) - 1
    U2MODEbits.BRGH = 0;    // dividir por 16
    U2MODEbits.PDSEL = 2;   // O parity
    U2MODEbits.STSEL = 1;   // 2 stop bits
    U2STAbits.UTXEN = 1;
    U2STAbits.URXEN = 1;

    IEC1bits.U2RXIE = 1;
    IEC1bits.U2TXIE = 0;
    IPC8bits.U2IP = 2;
    IFS1bits.U2RXIF = 0;

    U2MODEbits.ON = 1;

    TRISE = TRISE & 0xFFE1;                 // 0x 1111 1111 1110 0001
    LATE = (LATE & 0xFFE1) | count << 1;    // meter o valor do counter
                                            // e shift esquerda porque
                                            // começa no RE1

    EnableInterrupts();

    while (1);
    
    return 0;
}

void _int_(32) UART(void)
{
    if(IFS1bits.U2RXIF == 1)
    {
        char c = U2RXREG;
        if(c == 'U')
        {
            count++;
            if(count == 16)
            {
                count = 0;
            }
        }
        else if(c == 'R')
        {
            count = 0;
            putstr("RESET\n");
        }
        LATE = (LATE & 0xFFE1) | count << 1;
        IFS1bits.U2RXIF = 0;
    }
}

void putc(char byte)
{
    while (U2STAbits.UTXBF == 1);
    U2TXREG = byte;
}

void putstr(char *str)
{
    while (*str)
    {
        putc(*str++);
    }
}

void delay(unsigned int ms)
{
    resetCoreTimer();
    while(readCoreTimer() < 20000 * ms);
}