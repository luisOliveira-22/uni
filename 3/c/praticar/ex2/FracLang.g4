grammar FracLang;

main: (stat ';')* EOF;

stat: ID '<=' expr          # Assign
    |   'display' expr      # Display
    ;

expr: '(' expr ')'          # Parenthesis
    | OP2 expr              # Prefix
    | expr OP1 expr         # MultDiv
    | expr OP2 expr         # SumSub
    | NUMBER '/' NUMBER     # ExprFract
    | NUMBER                # ExprNum
    | ID                    # ExprId
    ;

OP1: ('*' | ':');
OP2: ('+' | '-');

ID: [a-z]+;
NUMBER: [0-9]+;
COMMENT: '--' .*? '\n' -> skip;
WS: [ \t\r\n] -> skip;