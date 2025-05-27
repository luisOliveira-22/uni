#include <detpic32.h>

void putc(char byte);
void delay(int ms);
char getc(void);

int main(void)
{ 
    // Configure UART2 (115200,N,8,1):
    // 1 - Configure BaudRate Generator > (20Mhz / 16 * baudrate) - 1
    U2BRG = 10;             // (20000000 / 16 * 115200) - 1 ~= 10
    U2MODEbits.BRGH = 0;    // dividir por 16
    // 2 – Configure number of data bits, parity and number of stop bits (see U2MODE register) 
    U2MODEbits.PDSEL = 0;   // 00 = 8-bit data, no parity
    U2MODEbits.STSEL = 0;   // 0 = 1 stop bit
    // 3 – Enable the trasmitter and receiver modules (see register U2STA) 
    U2STAbits.URXEN = 1;    // Enable Receiver
    U2STAbits.UTXEN = 1;    // Enable Transmitter
    // 4 – Enable UART2 (see register U2MODE) 
    U2MODEbits.ON = 1;

    while(1)
    {
        // Read character using getc()
        // Send character using putc()
        putc(getc());
    }
    return 0;
}

void putc(char byte)
{
    // wait while UART2 UTXBF == 1
    while(U2STAbits.UTXBF == 1);
    // Copy "byte" to the U2TXREG register
    U2TXREG = byte;
}

void delay(int ms)
{
    resetCoreTimer();
    while(readCoreTimer() < 20000 * ms);
}

char getc(void) 
{ 
    // Wait while URXDA == 0
    while(U2STAbits.URXDA == 0);
    // Return U2RXREG
    return U2RXREG;
}