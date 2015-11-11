drawLine(N):-
	N>0,
	drawLine(N,0).

drawLine(N,N):-
	N = N.

drawLine(N,I):-
	I<N,
	write('*'),
        I1 is I + 1,
	drawLine(N,I1).
