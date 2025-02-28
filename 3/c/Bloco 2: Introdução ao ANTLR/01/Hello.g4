// antlr4-clean
// antlr4-build
// cat p1.txt | antlr4-test -gui
// antlr4-visitor <Grammar> Execute String
// antlr4-main <Grammar> <start-rule> -v <Visitor>

grammar Hello;                      // Define a grammar called Hello
main        : (bye | greetings)+;
bye         : 'bye' name;
greetings   : 'hello' name;         // match keyword hello followed by an identifier
name        : word+;
word        : ID;
ID          : [a-zA-Z]+;               // match lower−case identifiers
WS          : [ \t\r\n]+ -> skip;   // skip spaces, tabs, newlines, \r (Windows)