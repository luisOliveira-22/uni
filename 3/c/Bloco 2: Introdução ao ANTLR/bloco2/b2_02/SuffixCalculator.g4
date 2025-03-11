// antlr4-clean
// antlr4-build
// cat p1.txt | antlr4-test -gui
// antlr4-visitor <Grammar> Execute <Type>
// antlr4-main <Grammar> <start-rule> -v <Visitor>

grammar SuffixCalculator;

program:    stat* EOF                                   // Zero or more repetitions of stat
            ;

stat:       expr? NEWLINE                               // Optative expr followed by an end−of−line
            ;

expr:       expr expr op=('*' | '/' | '+' | '-')        #ExprSuffix
            | Number                                    #ExprNumber
            ;

Number:     [0-9]+('.'[0-9]+)?;                        // fixed point real number
NEWLINE:    '\r'? '\n';
WS:         [ \t]+ -> skip;