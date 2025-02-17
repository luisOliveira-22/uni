-- line comments
-- ; is a mandatory command separator

set<integer> s1 := {1,2,3};

-- basic types: integer, real, text
-- set types: set<basic-type>

writeln "Set: " + s1;
integer i := 5;
writeln "Another: " + {i*3//2-3, i};

-- normal aritmetic operators (with standard precedences):
-- - real operations: *, /, +, -
-- - integer operations: *, //, \\, +, - (integer division: // and \\)
-- - unary aritmetic operators: +, -
-- - text operation: + (concatenation)
-- set operations: + (set union), - (set difference), & (set intersection),
--                 # (result: integer with then number of set elements)

set<text> st; -- st undefined
st := set<text>(read "set: ");
writeln "Set: " + st;
