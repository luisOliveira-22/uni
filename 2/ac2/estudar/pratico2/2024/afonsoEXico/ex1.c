#include <detpic32.h>

void delay(unsigned int ms);

int main(void){

	T3CONbits.TCKPS = 2;	// (1 2 4 8 ...) -> 20 * 10^6 / 65536 * 130Hz = 2,... -> o expoente seguinte é 4
	PR3 = 38461;				// 20 * 10^6 / 4 = 5 * 10^6	// 5 * 10^6 / 130Hz = 38461,5
	TMR3 = 0;				// copiar
	T3CONbits.TON = 1; 			// copiar

	OC4CONbits.OCM = 6; 			// copiar
 	OC4CONbits.OCTSEL =0;			// copiar
 	OC4RS = 19231; 				// 38461*0,5
 	OC4CONbits.ON = 1;			// copiar

	TRISBbits.TRISB1 = 1;			// switch RB1 como entrada
	static int state = 0;			// alterar os duty cycles

	while(1){
		if(PORTBbits.RB1 == 0){
			if(state == 1){
				OC4RS = 38461 * 0.25;
			}else{
				OC4RS = 38461 * 0.75;
			}
		}
		state = !state;
		delay(1300);
	}

	return 0;
}

void delay(unsigned int ms){
	resetCoreTimer();
	while(readCoreTimer() < 20000 * ms);
}