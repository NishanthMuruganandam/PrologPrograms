:- use_module(library(clpfd)).

maplist1(Goal, List1, List2, List3, List4) :-
 	maplist_1(List1, List2, List3, List4, Goal).
 
 maplist_1([], [], [], [], _).
 maplist_1([Elem1|Tail1], [Elem2|Tail2], [Elem3|Tail3], [Elem4|Tail4], Goal) :-
 	call(Goal, Elem1, Elem2, Elem3, Elem4),
 	maplist_1(Tail1, Tail2, Tail3, Tail4, Goal).

maplist1(Goal, List) :-
 	maplist_1(List, Goal).
 
maplist_1([], _).
maplist_1([Elem|Tail], Goal) :-
 	call(Goal, Elem),
 	maplist_1(Tail, Goal).

transpose1(Ls, Ts) :-
        must_be(list(list), Ls),
        lists_transpose1(Ls, Ts).

lists_transpose1([], []).
lists_transpose1([L|Ls], Ts) :- foldl(transpose_1, L, Ts, [L|Ls], _).

transpose_1(_, Fs, Lists0, Lists) :-
        maplist(list_first_rest1, Lists0, Fs, Lists).

list_first_rest1([L|Ls], L, Ls).

isElement([],_).
isElement([H|T],Domain):-
	member(H,Domain),
	isElement(T,Domain).

sudoku(Rows) :-  
  append(Rows, Vs), Vs ins 1..6,
  maplist1(all_distinct, Rows),
  transpose1(Rows, Columns),     
  maplist1(all_distinct, Columns),     
  Rows = [A,B,C,D,E,F],     
  blocks(A, B), blocks(C, D), blocks(E, F),     
  maplist1(label, Rows).      
 
blocks([], []).       
blocks([A,B,C|Bs1], [D,E,F|Bs2]) :-     
  all_distinct([A,B,C,D,E,F]),      
  blocks(Bs1, Bs2).

fd_must_be_list1(Ls) :-
        (   fd_var(Ls) -> type_error(list, Ls)
        ;   must_be(list, Ls)
        ).

problem(1, [[2,1,_,_,4,3],
            [_,_,_,_,_,_],
            [_,_,6,2,_,_],
            [_,_,3,4,_,_],
            [_,_,_,_,_,_],
            [3,4,_,_,5,6]]).

run:- problem(1,T),sudoku(T),maplist1(T).


