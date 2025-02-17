set<integer> s1 := set<integer>(read "set: ");

if s1 = {} then
  writeln "empty set"
else
   writeln "Set: " + s1
end;

-- normal relational operators (with standard precedences):
--   = (equal), /= (not equal), >, <, >=, <= (the last four only for basic types)
-- normal boolean operators (with standard precedences):
--   not, and, or



integer i := 1;
loop
   write "Set["+text(i)+"]:"; -- without '\n' output
   s1 := set<integer>(read);
until s1 = {} do -- while should also be accepted
   writeln "Set: " + s1
end

-- loop variants (... is a sequence of zero or more commands):
-- - loop until <cond> do ... end;       -- 'do' keyword required
-- - loop ... until <cond> do ... end;   -- 'do' keyword required
-- - loop ... until <cond> end;          -- 'do' keyword not required
-- - loop while <cond> do ... end;       -- 'do' keyword required
-- - loop ... while <cond> do ... end;   -- 'do' keyword required
-- - loop ... while <cond> end;          -- 'do' keyword not required
