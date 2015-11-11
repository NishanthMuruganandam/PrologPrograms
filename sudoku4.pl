:- use_module(library(clpfd)).

sudoku(Rows) :-  
  append(Rows, Vs), Vs ins 1..6,
  maplist(all_distinct, Rows),
  transpose(Rows, Columns),     
  maplist(all_distinct, Columns),     
  Rows = [A,B,C,D,E,F],     
  blocks(A, B), blocks(C, D), blocks(E, F),     
  maplist(label, Rows).      
 
blocks([], []).       
blocks([A,B,C|Bs1], [D,E,F|Bs2]) :-     
  all_distinct([A,B,C,D,E,F]),      
  blocks(Bs1, Bs2).


problem(1, [[2,1,_,_,4,3],
            [_,_,_,_,_,_],
            [_,_,6,2,_,_],
            [_,_,3,4,_,_],
            [_,_,_,_,_,_],
            [3,4,_,_,5,6]]).

run:- problem(1,T),sudoku(T),write(T).

hw3(L,L):-
	sudoku(L).
