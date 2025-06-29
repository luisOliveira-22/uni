#include <detpic32.h>

void putc1(char byte);
void delay(int ms);

int main(void)
{
    // Configure UART1 (115200,N,8,1):
    // 1 - Configure BaudRate Generator > (20Mhz / 16 * baudrate) - 1
    U1BRG = 10;             // (20000000 / 16 * 115200) - 1 ~= 10
    U1MODEbits.BRGH = 0;    // dividir por 16
    // 2 – Configure number of data bits, parity and number of stop bits (see U1MODE register)
    U1MODEbits.PDSEL = 0;   // 00 = 8-bit data, no parity
    U1MODEbits.STSEL = 0;   // 0 = 1 stop bit
    // 3 – Enable the trasmitter and receiver modules (see register U1STA)
    U1STAbits.UTXEN = 1;
    U1STAbits.URXEN = 1;
    // 4 – Enable UART1 (see register U1MODE)
    U1MODEbits.ON = 1;

    while(1)
    {
        putc1(0x5A);
        delay(10);
    }
    
    return 0;
}

void putc1(char byte)
{
    // wait while UART1 UTXBF == 1
    while(U1STAbits.UTXBF == 1);
    // Copy "byte" to the U1TXREG register
    U1TXREG = byte;
}

void delay(int ms)
{
    resetCoreTimer();
    while(readCoreTimer() < 20000 * ms);
}