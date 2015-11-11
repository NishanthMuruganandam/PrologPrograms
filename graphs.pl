edge(1,2).
edge(2,1).

:- table tc/2.

tc(X,Y):-
	edge(X,Y).

tc(X,Z):-
	edge(X,Z),
	tc(Z,Y).


