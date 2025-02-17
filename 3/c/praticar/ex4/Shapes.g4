grammar Shapes;

main:       stat* EOF;

stat:       expr;

distance:   'distance' point point;

point:      '(' expr ',' expr ')';

expr:       expr op=('*' | '/') expr    # ExprMulDiv
            | expr op=('+' | '-') expr  # ExprSumSub
            | '(' expr ')'              # ExprParentheses
            | distance                  # ExprDistance
            | NUM                       # ExprNUm
            ;

NUM: [0-9]+;
WS: [ \t\n\r]+ -> skip;