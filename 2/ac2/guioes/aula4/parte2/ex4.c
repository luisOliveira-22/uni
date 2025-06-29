#include <detpic32.h>

void delay(int ms);

int main(void) 
{ 
    unsigned char segment;
    int i;

    // reset LATE[14] a LATE[8]
    LATB = LATB & 0x80FF; // reset 1000 0000 1111 1111
    
    // config para ver no display menos significativo
    LATD = (LATD & 0x0040) | 0x0040;    // 0000 0000 0100 0000
    
    // config TRISE[14] a TRISE[8] como saídas
    TRISB = TRISB & 0x80FF;

    // config display (LATD[5] A LATD[6]) como saídas
    TRISD = TRISD & 0xFF9F; // 1111 1111 1001 1111
    
    while(1)
    {
        segment = 1;
        
        for(i = 0; i < 7; i++)
        {
            // send "segment" value to display
            LATB = (LATB & 0x80FF) | segment << 8;
            
            // wait 0.5 second
            delay(500);
            
            segment = segment << 1;
        }
        
        // toggle display selection
        LATDbits.LATD5 = !LATDbits.LATD5;
        LATDbits.LATD6 = !LATDbits.LATD6;
    
    }
    return 0;
}

void delay(int ms){
    resetCoreTimer();
    while(readCoreTimer() < 20000 * ms);
}