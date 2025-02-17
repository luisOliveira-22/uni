%

:- [tpi1].

:- configure_search(tpi1,depth,no),
   search(cidades,braga,faro,Solution), 
   size_info(NumOpen,NumSolution,NumSkipped,NumClosed),
   writeln('depth':NumOpen-NumSolution-NumSkipped-NumClosed),
   writeln(Solution),
   solution_node(ID), node(ID,_,_,Data), writeln('Solution node data':Data), nl.

:- configure_search(tpi1,depth,yes),
   search(cidades,braga,faro,Solution), 
   size_info(NumOpen,NumSolution,NumSkipped,NumClosed),
   writeln('depth/improve':NumOpen-NumSolution-NumSkipped-NumClosed),
   writeln(Solution),
   solution_node(ID), node(ID,_,_,Data), writeln('Solution node data':Data), nl.

:- configure_search(tpi1,informeddepth,no),
   search(cidades,braga,faro,Solution), 
   size_info(NumOpen,NumSolution,NumSkipped,NumClosed),
   writeln('informeddepth':NumOpen-NumSolution-NumSkipped-NumClosed),
   writeln(Solution),
   solution_node(ID), node(ID,_,_,Data), writeln('Solution node data':Data), nl.

:- configure_search(tpi1,informeddepth,yes),
   search(cidades,braga,faro,Solution), 
   size_info(NumOpen,NumSolution,NumSkipped,NumClosed),
   writeln('informeddepth/improve':NumOpen-NumSolution-NumSkipped-NumClosed),
   writeln(Solution),
   solution_node(ID), node(ID,_,_,Data), writeln('Solution node data':Data), nl.

:- configure_search(tpi1,astar,no),
   search(cidades,braga,faro,Solution), 
   size_info(NumOpen,NumSolution,NumSkipped,NumClosed),
   writeln('astar':NumOpen-NumSolution-NumSkipped-NumClosed),
   writeln(Solution),
   solution_node(ID), node(ID,_,_,Data), writeln('Solution node data':Data),
   ( check_admissible(ID), writeln(admissible); writeln('not admissible') ), nl.


:- write('Special test with inflated heuristic:'),
   Nodes = [ node(156,faro,152,((beja,faro),8,706,0)),
             node(152,beja,64,((evora,beja),7,559,154)),
             node(64,evora,38,((santarem,evora),6,454,264)),
             node(38,santarem,12,((leiria,santarem),5,332,352)),
             node(12,leiria,9,((coimbra,leiria),4,254,414)),
             node(9,coimbra,6,((agueda,coimbra),3,181,463)),
             node(6,agueda,2,((porto,agueda),2,136,508)),
             node(2,porto,1,((braga,porto),1,57,580)),
             node(1,braga,none,(none,0,0,627)) ],
   retractall(node(_,_,_,_)),
   findall(_,( member(N,Nodes), assert(N) ), _),
   ( check_admissible(156), writeln(admissible); writeln('not admissible') ), nl.

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% STRIPS
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- IS = [ floor(a), floor(b),           %    _
          holds(e), on(c,d), free(a),   %   / \
          floor(d), free(c), free(b) ], %  |  (e)
                                        %  |
                                        %  |               |c|
                                        % _|___|a|___|b|___|d|_    
                                        % 

   GS = [ floor(c), on(d,c),            %    _
          on(e,d), on(a,e), floor(b) ], %   / \
   myHeuristic(_ ,IS,GS,H),             %  |  (?)           |a|
   writeln(heuristic=H),                %  |                |e|
   configure_search(tpi1,breadth,no),   %  |                |d|
   search(strips/blocksworld,IS,GS,_),  % _|__________|b|___|c|___    
   solution_node(ID), get_plan(ID,Plan),%
   writeln('breadth':Plan),
   ( check_admissible(ID), !, writeln(admissible); 
     writeln('not admissible') ),
   size_info(NumOpen,NumSolution,NumSkipped,NumClosed),
   writeln(NumOpen-NumSolution-NumSkipped-NumClosed), nl.

% same as above with A*

:- IS = [ floor(a), floor(b), holds(e), on(c,d), free(a),
          floor(d), free(c), free(b) ],
   GS = [ floor(c), on(d,c), on(e,d), on(a,e), floor(b) ], 
   myHeuristic(_ ,IS,GS,H), writeln(heuristic=H),
   configure_search(tpi1,astar,no),
   search(strips/blocksworld,IS,GS,_),
   solution_node(ID), get_plan(ID,Plan), writeln('A*':Plan),
   ( check_admissible(ID), !, writeln(admissible); 
     writeln('not admissible') ),
   size_info(NumOpen,NumSolution,NumSkipped,NumClosed),
   writeln(NumOpen-NumSolution-NumSkipped-NumClosed), nl.


:- IS = [ floor(a), floor(b),           %    _
          floor(d), holds(e), on(c,d),  %   / \
          free(a), free(b), on(f,c),    %  |  (e)             |g|        
          on(g,f), free(g) ],           %  |                  |f|
                                        %  |                  |c|
                                        % _|___|a|____|b|_____|d|_    
                                        % 

   GS = [ floor(c), on(d,c),            %    _
          on(e,d), on(a,e), floor(b),   %   / \
          on(f,g), on(g,b) ],           %  |  (?)           |a|
   myHeuristic(_ ,IS,GS,H),             %  |          |f|   |e|
   writeln(heuristic=H),                %  |          |g|   |d|
   configure_search(tpi1,astar,no),     % _|__________|b|___|c|___    
   search(strips/blocksworld,IS,GS,_),  %
   solution_node(ID), get_plan(ID,Plan), 
   writeln('A*':Plan),
   ( check_admissible(ID), !, writeln(admissible); 
     writeln('not admissible') ),
   size_info(NumOpen,NumSolution,NumSkipped,NumClosed),
   writeln(NumOpen-NumSolution-NumSkipped-NumClosed), nl.

:- IS = [ floor(a), floor(b),          %    _
          floor(d), holds(e), on(c,d), %   / \               |h|
          free(a), free(b), on(f,c),   %  |  (e)             |g|
          on(g,f), on(h,g), free(h) ], %  |                  |f|
                                       %  |                  |c|
                                       % _|___|a|____|b|_____|d|_    
                                       % 

   GS = [ floor(d), floor(b),          %    _
          on(f,g), on(g,b), free(d),   %   / \
          free(f) ],                   %  |  (?)
   myHeuristic(_ ,IS,GS,H),            %  |          |f|
   writeln(heuristic=H),               %  |          |g|
   configure_search(tpi1,astar,no),    % _|__________|b|___|d|___    
   search(strips/blocksworld,IS,GS,_), %
   solution_node(ID), get_plan(ID,Plan), 
   writeln('A*':Plan),
   ( check_admissible(ID), !, writeln(admissible); 
     writeln('not admissible') ),
   size_info(NumOpen,NumSolution,NumSkipped,NumClosed),
   writeln(NumOpen-NumSolution-NumSkipped-NumClosed), nl.


:- IS = [ floor(a), floor(b),           %    _
          floor(d), holds(e), on(c,d),  %   / \               |h|
          free(a), free(b), on(f,c),    %  |  (e)             |g|
          on(g,f), on(h,g), free(h) ],  %  |                  |f|
                                        %  |                  |c|
                                        % _|___|a|____|b|_____|d|_    
                                        % 

   GS = [ floor(d), floor(b),           %    _
          free(d), free(b) ],           %   / \
   myHeuristic(_ ,IS,GS,H),             %  |  (?)
   writeln(heuristic=H),                %  |
   configure_search(tpi1,astar,no),     %  |
   search(strips/blocksworld,IS,GS,_),  % _|__________|b|___|d|___  
   solution_node(ID), get_plan(ID,Plan),%
   writeln('A*':Plan),
   ( check_admissible(ID), !, writeln(admissible); 
     writeln('not admissible') ),
   size_info(NumOpen,NumSolution,NumSkipped,NumClosed),
   writeln(NumOpen-NumSolution-NumSkipped-NumClosed), nl.

