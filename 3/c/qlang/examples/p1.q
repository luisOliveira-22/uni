# programming skills questionnaire language
# in this first version this program corresponds to a single-user questionnaire

# special variable result keeps track of current questionnaire state
#    result.name: name of user (if any)
#    result.id: id of user (if any)
#    result.grade: current questionnaire grade (always a fraction, printed as a percentage)


q: question; # question type variable
g: fraction; # fraction type variable (an integer fraction)

# ; is a (required) statement separator

# define a question (no execution involved)
# question types: multi-choice, hole, open, code-hole, code-open, code-output
hole Question.q1 is
  println "A atribuição de valor em PIL usa o operador " ans->":=" "."
  # the text preceded with a label (ans in this example) is omitted from the user
  # (and provides information for automatic grading).
end; # automatic grading

q := new Question.q1;
g := execute q; # execute question stored in variable q
# executing a question impacts on overall (result) questionnaire grading
# g is the grade of this q execution

open OpenQuestion is
  println "Defina a estrutura de dados lista ligada."
end; # manual grading

q := new OpenQuestion;
execute q; # execute question stored in variable q (result would be: undefined)

code-open Question.Code1 is
   uses code from "even-odd.pil" end;
   println "Implemente um programa que, pedindo um número inteiro do utilizador com o texto 'Number: ', escreva na consola se este é par (even) ou ímpar (odd).";
end; # automatic grading

q := new Question.Code1;
g := execute q; # execute question stored in variable q

export result to "result.txt"; # export (to a file) current questionnaire results
# export command can be executed anywhere!

