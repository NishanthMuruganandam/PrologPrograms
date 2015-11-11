
del([H|T],H,T).

del([H|T],X,[H|Ts]):-
	del(T,X,Ts).

perm([],[]).

perm([H|T],L):-
	perm(T,L1),
	del(L,H,L1).
		
