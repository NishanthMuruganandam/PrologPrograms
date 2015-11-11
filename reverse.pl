



reverse([],[]).
reverse([H|T],[Ts|H]):-
	reverse(T,Ts).
