#include <detpic32.h>;

void send2displays(unsigned char value);
void delay(int ms);

int main(void) 
{
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
    
    while(1)
    {
        send2displays(0x15);
        
        // aumentar para 100Hz: 1/100 = 0.01s = 10ms
        delay(10);
    }
}

void send2displays(unsigned char value)
{
    static const char disp7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
    //                                     0     1     2     3     4     5     6     7     8     9     A     B     C     D     E     F
    
    static char displayFlag = 0;    // static variable: doesn't loose its 
                                    // value between calls to function

    int dh = value >> 4;
    int dl = value & 0x0F;

    // if "displayFlag" is 0 then send "digit_low" to display_low
    if(displayFlag == 0)
    {
        // select display low
        LATDbits.LATD5 = 1;
        LATDbits.LATD6 = 0;

        // send digit_low (dl) to display:
        LATB = (LATB & 0x80FF) | (disp7Scodes[dl] << 8); // Clean the display and set the right value

    }
    // else send "digit_high" to didplay_high
    else{
        // select display high
        LATDbits.LATD5 = 0;
        LATDbits.LATD6 = 1;

        // send digit_high (dh) to display:
        LATB = (LATB & 0x80FF) | (disp7Scodes[dh] << 8); // Clean the display and set the right value
    }

    // toggle "displayFlag" variable
    displayFlag = !displayFlag;
}


void delay(int ms)
{
    resetCoreTimer();
    while(readCoreTimer() < 20000 * ms);
}