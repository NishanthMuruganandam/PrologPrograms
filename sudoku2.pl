:- use_module(library(clpfd)).
 
sudoku(Rows) :-
        length(Rows, 6), maplist(length_(6), Rows),
        append(Rows, Vs), Vs ins 1..6,
        maplist(all_distinct, Rows),
        transpose(Rows, Columns), maplist(all_distinct, Columns),
        Rows = [A,B,C,D,E,F],
        blocks(A, B), blocks(C, D), blocks(E, F).
 
length_(L, Ls) :- length(Ls, L).
 
blocks([], []).
blocks([A,B|Bs1], [C,D|Bs2]) :-
        all_distinct([A,B,C,D]),
        blocks(Bs1, Bs2).
 
problem(1, [[_,_,_,_,_,_],
            [_,_,_,_,_,3],
            [_,_,1,_,2,_],
            [_,_,_,5,_,6],
            [_,_,4,_,_,_],
            [_,6,_,_,_,_]
          ]).

run :- problem(1,T),sudoku(T),write(T).
