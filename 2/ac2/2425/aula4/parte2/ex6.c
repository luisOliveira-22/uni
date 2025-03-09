#include <detpic32.h>

void delay(int ms);

int main(int argc, char const *argv[])
{
    /* code */
    return 0;
}

void delay(int ms){
    resetCoreTimer();
    while(readCoreTimer() < 20000 * ms);
}