grammar Vector;

main: (stat ';')* EOF;

stat: expr '->' ID                  # Assign
    | 'show' expr                   # Display
    ;

expr: '[' NUMBER (',' NUMBER)* ']'  # exprVector
	| ID							# exprId
    | NUMBER                        # exprNum
    ;

NUMBER: [0-9]+ ('.' [0-9]+)*;
ID: [a-z][a-z0-9]*;
COMMENT: '#' .*? '\n' -> skip;
WS: [ \t\r\n] -> skip;