#include <detpic32.h>

typedef struct{
    char mem[100];  // Storage area
    int nchar;      // Number of characters to be transmitted
    int posrd;      // Position of the next character to be transmitted
} t_buf;

volatile t_buf txbuf;

int main(void)
{

    return 0;
}

void _int_(32) isr_uart2(void) 
{
    if (IFS1bits.U2TXIF == 1)
    {
        if(txbuf.nchar > 0) // At least one character to be transmitted
        {
            // Read 1 character from the buffer and send it
            U2TXREG = txbuf.mem[txbuf.posrd];
            
            // Update buffer "posrd" and "nchar" variables
            txbuf.posrd++;
            txbuf.nchar--;
        } else
        {
            // Disable UART2 Tx interrupts
            IEC1bits.U2TXIE = 0; 
        }
        // Clear UART2 Tx interrupt flag
        IFS1bits.U2RXIF = 0;
    }
}