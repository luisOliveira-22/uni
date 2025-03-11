// antlr4-clean
// antlr4-build
// cat p1.txt | antlr4-test -gui
// antlr4-visitor <Grammar> Execute <Type>
// antlr4-main <Grammar> <start-rule> -v <Visitor>

grammar Calculator;

program:    stat* EOF
            ;

stat:       expr? NEWLINE
            ;

expr:       op=('+' | '-') expr                 #ExprUnary
            | expr op=('*' | '/' | '%') expr    #ExprMultDivMod
            | expr op=('+' | '-') expr          #ExprAddSub
            | Integer                           #ExprInteger
            | '(' expr ')'                      #ExprParenthesis
            ;

Integer:    [0-9]+;
NEWLINE:    '\r'? '\n';
WS:         [ \t]+ -> skip;
COMMENT:    '#' .*? '\n' -> skip;