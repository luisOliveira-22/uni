// antlr4-clean
// antlr4-build
// cat p1.txt | antlr4-test -gui
// antlr4-listener <Grammar> Execute <Type>
// antlr4-main <Grammar> <start-rule> -l <Visitor>

grammar Numbers;

file:   line* EOF;

line:   NUM ' - ' NAME NEWLINE;

NUM:        [0-9]+;
NAME:       [a-zA-Z]+;
NEWLINE:    '\r'? '\n';
WS:         [ \t]+ -> skip;