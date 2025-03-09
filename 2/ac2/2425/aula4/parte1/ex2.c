#include <detpic32.h>

void delay(int ms);

int main(void)
{

    // reset 6 a 3
    LATE = (LATE & 0xFF87); // 1111 1111 1000 0111

    // Configure ports
    TRISE = (TRISE & 0xFF87);

    int counter = 0;
    
    while (1)
    {
        // delay --> 1 / 4,6 = 217
        delay(217);

        LATE = (LATE & 0xFF87) | counter << 3;

        if (counter < 10)
        {
            counter = (counter + 1) % 10;
        }
        else
        {
            counter = 0;
        }
    }
    return 0;

return 0;
}

void delay(int ms){
    resetCoreTimer();
    while(readCoreTimer() < 20000 * ms);
}