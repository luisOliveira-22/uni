# int main(void)
# {
#   char c;
#   int cnt = 0;
#   do
#   {
#       c = getChar();
#       putChar( c );
#       cnt++;
#   } while( c != '\n' );
#   printInt(cnt, 10);
#   return 0;
# } 


        .equ PUT_CHAR, 3
        .data
        .text
        .globl main

main:   li $t1, 0           # cnt = 0

do:     li $v0, PUT_CHAR    # putChar
        add $t1, $t1, 1     # cnt++
while:  bne  $a0, '\n', do  # while(c != '\n')
        la $a0, $t1
        li $v0, PRINT_STR
        syscall             # printInt(cnt, 10)
        li $v0,0
        jr $ra