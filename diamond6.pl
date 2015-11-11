
writeChar(_,N):-
	N =< 0.

writeChar(C,N):-
	N is 1,
	write(C).

writeChar(C,N):-
	N > 1,
	write(C),
	N1 is N-1,
	writeChar(C,N1).

writeStar(N):-
	N < 0.

writeStar(R):-
	R >= 0,
	write('*').

fillRowDiamond(R,N):-
	N < R.

fillRowSquare(R,N):-
	N1 is N-1,
	N1 = R,
	writeChar('*',N).

fillRowSquare(R,N):-
	R = 0,
	writeChar('*',N).

fillRowSquare(R,N):-
	N1 is N-1,
	R < N1,
	write('*'),
	%fillRowDiamond(R,N1),
	N2 is N-2,
	writeChar(' ',N2),
	write('*').

fillRowDiamond(R,N):-
	N >= R,
	S is N-R,
	writeChar(' ',S),
	writeStar(R),
	N1 is N-1,
	R0 is 2*R - 1,
	writeChar(' ',R0),
	R1 is R - 1,
	writeStar(R1).

drawDiamond(R,N):-
	R > N.
drawDiamond(R,N) :- 
	
	N >= R,
	fillRowDiamond(R,N),
	write('\n'),
	R2 is R + 1,
	drawDiamond(R2,N),
	R3 is R-1,
	fillRowDiamond(R3,N),
	write('\n').

drawMiddleRow(R,N):-
	N = 3,
	R = 0,
	write('*'),
	N2 is N-2,
	writeChar(' ',N2),
	write('*'),
	write('\n').


drawMiddleRow(R,N):-
	N1 is N/2,
	N2 is floor(N1),
	N3 is N2-1,
	R = N3,
	write('*'),
	N4 is N-2,
	writeChar(' ',N4),
	write('*'),
	write('\n').

drawMiddleRow(_,_).
	
drawSquare(R,N):-
	N1 is N/2,
	floor(N1) =< R.

drawSquare(R,N):-

	N1 is N/2,
	floor(N1) >= R,	
	fillRowSquare(R,N),
	write('\n'),
	R1 is R + 1,
	drawSquare(R1,N),
	drawMiddleRow(R,N),
	fillRowSquare(R,N),
	write('\n').


drawDiamond(N):-
	drawDiamond(0,N).

drawSquare(N):-
	N = 1,
	N1 is 3,
	drawSquare(0,N1).

drawSquare(N):-
	N > 1,
	N1 is 2*N - 1,
	drawSquare(0,N1).

lace(N):-	
	N=<  0.

lace(N):-
	0 is mod(N,2),
	drawDiamond(N),
	N1 is N-1,
	lace(N1).

lace(N):-

	1 is mod(N,2),
	drawSquare(N),
	N1 is N-1,
	lace(N1).
