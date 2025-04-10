#include <detpic32.h>;

unsigned char toBcd(unsigned char value);
void send2displays(unsigned char value);
void delay(int ms);

int main(void)
{
    // configs
    // configure RB8-RB14 as outputs
    // 1) reset LATE[14] a LATE[8]
    LATB = LATB & 0x80FF; // reset 1000 0000 1111 1111
    // 2) config TRISE[14] a TRISE[8] como saídas
    TRISB = TRISB & 0x80FF;
    
    // configure RD5-RD6 as outputs
    // 1) config para ver no display menos significativo
    LATDbits.LATD5 = 1;
    LATDbits.LATD6 = 0;
    // 2) config display (LATD[5] A LATD[6]) como saídas
    TRISD = TRISD & 0xFF9F; // 1111 1111 1001 1111

    // configure RE0-7 as outputs
    // 1) reset LATE[7] a LATE[0]
    LATE = LATB & 0xFF00; // reset 1111 1111 0000 0000
    // 2) config TRISE[7] a TRISE[0] como saídas
    TRISE = TRISB & 0xFF00;
    
    int i = 0;
    unsigned char counter = 0;
    while(1)
    {
        send2displays(toBcd(counter));
        LATE = (LATE & 0xFF00) | toBcd(counter);
        delay(10);
        i++;
        if (i % 50 == 0)
        {
            counter++;
            if (counter == 60)
            {
                counter = 0;
            }
        }    
    }
}

void send2displays(unsigned char value)
{
    static const char disp7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
    //                                  0     1     2     3     4     5     6     7     8     9     A     B     C     D     E     F
    
    static char displayFlag = 0;

    int dh = value >> 4;
    int dl = value & 0x0F;

    if(displayFlag == 0)
    {
        LATDbits.LATD5 = 1;
        LATDbits.LATD6 = 0;

        LATB = (LATB & 0x80FF) | (disp7Scodes[dl] << 8); // Clean the display and set the right value
    }
    else
    {
        LATDbits.LATD5 = 0;
        LATDbits.LATD6 = 1;

        LATB = (LATB & 0x80FF) | (disp7Scodes[dh] << 8); // Clean the display and set the right value
    }

    displayFlag = !displayFlag;
}

unsigned char toBcd(unsigned char value)
{
    return ((value / 10) << 4) + (value % 10);
}

void delay(int ms)
{
    resetCoreTimer();
    while(readCoreTimer() < 20000 * ms);
}