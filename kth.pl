
kth([H|_],0,H).

kth([_|T],K,R):-
	K1 is K-1,
	kth(T,K1,R).

len([],0).
len([_|T],R):-
	len(T,R1),
	R is R1+1.

lastButOne(L,X):-
	len(L,R),
	R1 is R-2,
	kth(L,R1,X).

