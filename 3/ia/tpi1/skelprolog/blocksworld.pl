%

operator( blocksworld,
          stack(X,Y),
          [holds(X),free(Y)],
          [holds(X),free(Y)],
          [on(X,Y),handfree,free(X)]
).

operator( blocksworld,
          unstack(X,Y),
          [on(X,Y),handfree,free(X)],
          [on(X,Y),handfree,free(X)],
          [holds(X),free(Y)]
).

operator( blocksworld,
          putdown(X),
          [holds(X)],
          [holds(X)],
          [floor(X),handfree,free(X)]
).
    
operator( blocksworld,
          pickup(X),
          [floor(X),handfree,free(X)],
          [floor(X),handfree,free(X)],
          [holds(X)]
).


