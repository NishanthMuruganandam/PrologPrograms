member(X,[X|_]).
member(X,[_|Ys]) :-
	member(X,Ys).


