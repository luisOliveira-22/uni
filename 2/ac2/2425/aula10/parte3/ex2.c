#include <detpic32.h>

void putstr(char *str);
void putc(char byte);

int main(void)
{
    // Configure UART1 (19200,N,8,1):
    // 1 - Configure BaudRate Generator > (20Mhz / 16 * baudrate) - 1
    U2BRG = 64;             // (20000000 / 16 * 19200) - 1 ~= 10
    U2MODEbits.BRGH = 0;    // dividir por 16
    // 2 – Configure number of data bits, parity and number of stop bits (see U2MODE register)
    U2MODEbits.PDSEL = 0;   // 00 = 8-bit data, no parity
    U2MODEbits.STSEL = 0;   // 0 = 1 stop bit
    // 3 – Enable the trasmitter and receiver modules (see register U2STA)
    U2STAbits.UTXEN = 1;
    U2STAbits.URXEN = 1;
    // 4 – Enable UART2 (see register U1MODE)
    U2MODEbits.ON = 1;

    // config RD11 as output
    TRISDbits.TRISD11 = 0;

    while(1)
    {
        // Wait while TRMT == 0
        while(U2STAbits.TRMT == 0);

        // Set RD11
        LATDbits.LATD11 = 1;

        putstr("12345");

        // Reset RD11
        LATDbits.LATD11 = 0;
    }

    return 0;
}

void putstr(char *str)
{
    while(*str != '\0')
    {
        putc(*str);
        str++;
    }
}

void putc(char byte)
{
    while(U2STAbits.UTXBF == 1);
    U2TXREG = byte;
}