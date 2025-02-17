# programming skills questionnaire language
# in this first version this program corresponds to a single-user questionnaire

# special variable result keeps track of current questionnaire state
#    result.name: name of user (if any)
#    result.id: id of user (if any)
#    result.grade: current questionnaire grade (always a fraction, printed as a percentage)

# conditional and loop instructions with similar syntax as PIL
# arithmetic, logical and boolean expressions similar to PIL

name: text;
id: integer;
result.name := read "Nome: "; # ask user for a text (with a prompt)
id := integer(read "ID: ");

# ; is a (required) statement separator

println "Nome: " name ", id: " text(id); # text concatenation!
# conversion between type similar to PIL

# define code (inline) (no execution involved); not a question!
code PIL.Example1 is # default is code of PIL type (the only one to be implemented)
"[
   -- PIL code from here
   n := integer(read);
   i := 1;
   loop until i = n do
      if i % 2 = 0 then
         write i
      end;
      i := i + 1
   end
   -- PIL code to here
]"
end;
# "[ ... ]", "{ ... }", "< ... >", '[ ... ]', '{ ... }', '< ... >' are (alternative) verbatim strings

# define a question (no execution involved)
multi-choice Algorithm.Cond1 is # Define types: Algorithm (if not already defined) and Algorithm.Cond1 (Algorithm.Cond1 is a subtype of Algorithm)
  uses code PIL.Example1 end; # link question to code (necessary for automatically setting inputs/outputs/testing)
  println PIL.Example1;
  println "Dada a entrada " "10"|program ", este programa vai escrever no standard output:"; # |program defines stdin text to code execution
  # no grading required (it is optional), automatic grading
  choice "123456789\n" end;
  choice 2/10,'246810' end; # ' ... ' also defines a string (as in python) # overides automatic (0) grading with a grade of 20%
  choice "2468" end
end; # prompt

# question types: multi-choice, hole, open, code-hole, code-open, code-output

code PIL.Example2 is # include hole definitions (identified by labels)
"{
   n := integer("Number: "); -- read [<prompt>]
   write "Number ",n, " is ";
   if }" l1->"n % 2 = 0" "{ then
      writeln "even"
   }" l2->"else" "{
      writeln "odd"
   end;
}"
end;

code-hole Algorithm.Code1 is
   println "Complete o seguinte código.";
   uses code PIL.Example2
      10,l1; # grade 10
      5,l2  # grade 5
   end;
end; # total points defined in question: 10+5=15, final grade: sum-correct-points / total-points

hole Question.q1 is
  println "A atribuição de valor em PIL usa o operador " ans->":=" "."
end;

code-hole Algorithm.Code2 is
   println "Complete o seguinte código.";
   uses code from "even-odd.pil" # definition of holes outside code:
      10,"n % 2 = 0"; # grade 10, first match for text
      5,"else" line 2 # grade 5, first match starting at line 2 for text
      # syntax (comma separated): [grade] [match-count] text
   end
end; # total points defined in question: 10+5=15, final grade: sum-correct-points / total-points

code Example3 is # PIL is not required (type names are the programmers choice)
"<
  name := read "Nome: ";
  writeln name
>"
end;

c1: code; # code type variable
c1 := new Example3;
res: text;
res := execute c1; # standard output stored in res
res := "10" | execute c1; # uses "10" as standard input
execute c1; # output goes to standard output

# code execution outside a question has no impact on questionnaire grading

composed Q1 is # composed question (involving one, or more questions)
   execute 1/2,Algorithm; # grade, question (random choice between all Algorithm.* questions)
   execute 1/4,Algorithm;
   execute 1/4,Algorithm
   # relative grades could have been defined as 2 1 1 (same result)
end;

q1: question; # question type variable
q1 := new Q1;
g: fraction; # fraction type variable (an integer fraction)
g := execute q1; # execute question stored in variable q1
# executing a question impacts on overall (result) questionnaire grading
# g is the grade of Q1 execution

composed Q2 is
   g: fraction; # fraction variable g (grade in %); grade type is a fraction (INTEGER/INTEGER or INTEGER)
   g := execute 1,Algorithm; # g stores this questionnaire result grade
   if g = 1 then
      execute 10,Q1 # execute question Q1
   elseif g > 50 then
      execute Algorithm # default grade is 1 point
   else
      execute 10,Q2 # repeat question Q2 (recursive)
   end
end;

export result to "result.txt"; # export (to a file) current questionnaire results
# export command can be executed anywhere!

