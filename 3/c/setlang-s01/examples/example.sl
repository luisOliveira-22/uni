text t := "123";
writeln real(t);
writeln integer(t);
integer idz := 5;
real d := real(idz);
writeln idz + integer(d);
writeln text(idz) + " " + text(d);

set<integer> s1 :=  set<integer>("1,2,3,4,5,6");
writeln "Set: " + s1;

set<integer> s2 := {1,2,3};

writeln "Set: " + s2;
integer id := 5;

writeln "Another: " + {id*3//2-3, id};

set<integer> i := {1,2,3} + {4,5,6};
writeln {1,2,7} + i;

writeln i;
writeln {1,5,3} & {4,5,6} + "test" + read "Enter a number: ";
writeln -5 + #{4,5,6};
writeln +5;
writeln 1+3 + 2*3 + 4//2 + 5//2 + 6\\2 + 7-2;
writeln -1.0+1.9;
writeln "Hello" + " " + "World";
