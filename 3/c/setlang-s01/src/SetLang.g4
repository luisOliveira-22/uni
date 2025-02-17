grammar SetLang;

main: (stat? ';')* EOF;

stat: type ID ':=' expr                 # DeclareAssign
    | type ID                           # Declare
    | ID ':=' expr                      # Assign
    | 'writeln' expr                    # Write
    ;

expr returns [String varType, String var]:
      op=('+' | '-' | '#') expr                    # ExprUnary
    | expr op=('*'|'/'|'//'|'\\\\'|'&') expr       # ExprMulDiv
    | expr op=('+' | '-') expr                     # ExprAddSub
    | type '(' expr ')'                            # ExprCast
    | 'read' STRING                                # ExprRead
    | set                                          # ExprSet
    | REAL                                         # ExprReal
    | INTEGER                                      # ExprInteger
    | STRING                                       # ExprStr
    | ID                                           # ExprId
    ;

set returns [String varType, String var]: '{' expr (',' expr)* '}';

type: 'set' '<' BTYPE '>'
    | BTYPE
    ;

BTYPE: 'integer' | 'text' | 'real';

ID: [a-zA-Z_][a-zA-Z0-9_]*;
STRING: '"' .*? '"';
INTEGER: [0-9]+;
REAL: [0-9]+ '.' [0-9]+;
COMMENT: '--' ~[\r\n]* -> skip;
WS: [ \t\r\n]+ -> skip;
ERROR: .;
