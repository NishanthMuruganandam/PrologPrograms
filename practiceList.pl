myprint([]).


myprint([X]):-
	write(X).

myprint([H|T]):-
	write(H),
	myprint(T).
