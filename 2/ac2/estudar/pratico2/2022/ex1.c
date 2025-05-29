#include <detpic32.h>

void delay(unsigned int ms);

int main(void)
{
    
    return 0;
}

void delay(unsigned int ms)
{
    resetCoreTimer();
    while (readCoreTimer() < 20000 * ms);
}