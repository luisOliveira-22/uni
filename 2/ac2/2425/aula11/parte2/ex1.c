#include <detpic32.h>

typedef struct{
    char mem[100];  // Storage area
    int nchar;      // Number of characters to be transmitted
    int posrd;      // Position of the next character to be transmitted
} t_buf;

volatile t_buf txbuf;
void putstrInt(char *s);

int main(void)
{
    
    return 0;
}

void putstrInt(char *s)
{
    while(txbuf.nchar > 0); // Wait while the buffer is not empty
    // Copy all characters of the string "s" to the buffer, and update "nchar"
    while(*s != '\0')
    {
        txbuf.mem[txbuf.nchar] = *s;
        s++;
        txbuf.nchar++;
    }
    // Initialize "posrd" variable with 0
    txbuf.posrd = 0;
    // Enable UART2 Tx interrupts
    IEC1bits.U2TXIE = 1;
}