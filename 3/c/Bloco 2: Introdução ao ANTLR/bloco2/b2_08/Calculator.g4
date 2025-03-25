// antlr4-clean
// antlr4-build
// cat p1.txt | antlr4-test -gui
// antlr4-visitor <Grammar> Execute <Type>
// antlr4-main <Grammar> <start-rule> -v <Visitor>

grammar Calculator;

program:    stat* EOF
            ;

stat:       expr                                #StatExpr
            | assignment                        #StatAssign
            ;

assignment: ID '=' expr;

expr:       op=('+' | '-') expr                 #ExprUnary
            | expr op=('*' | '/' | '%') expr    #ExprMultDivMod
            | expr op=('+' | '-') expr          #ExprAddSub
            | Integer                           #ExprInteger
            | ID                                #ExprID
            | '(' expr ')'                      #ExprParenthesis
            ;

Integer:    [0-9]+;
ID:         [a-zA-Z_];
NEWLINE:    '\r'? '\n';
WS:         [ \t]+ -> skip;
COMMENT:    '#' .*? '\n' -> skip;