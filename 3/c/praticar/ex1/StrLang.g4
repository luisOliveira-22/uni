grammar StrLang;

main: op* EOF;

op: ID ':' expr                 # Assign
    | 'print' expr              # Print
    ;

expr: '(' expr ')'              # Parentesis
    | 'input(' STRING ')'       # Input
    | expr '+' expr             # Concat
    | expr '-' expr             # Rem
    | 'trim' expr               # Trim
    | expr '/' expr '/' expr    # Substitution
    | STRING                    # ExprString
    | ID                        # ExprId
    ;

ID: [a-zA-Z0-9]+;

STRING: '"' .*? '"';
COMMENT: '//' .*? '\n' -> skip;
WS: [ \t\r\n] -> skip;