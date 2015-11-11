
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

writeStar(N):-
	N >= 0,
	write('*').

writeNStar(N,R):-
	 0 is mod(R,N),
	writeChar('*',N),
	write('\n').

writeNStar(N,R):-
	0 \= mod(R,N),
	write('*'),
	N1 is N-2,
	writeChar('_',N1),
	write('*'),
	write('\n').


fillRowDiamond(R,N):-
	N < R.
fillRowDiamond(R,N):-
	N >= R,
	S is N-R,
	writeChar(' ',S),
	writeStar(R),
	R0 is 2*R - 1,
	writeChar(' ',R0),
	R1 is R - 1,
	writeStar(R1),
	write('\n').

fillRowSquare(R,N):-
	N >= R,
	writeNStar(N,R).
	
drawDiamond(R,N):-
	R > N.
drawDiamond(R,N) :- 
	
	N >= R,
	fillRowDiamond(R,N),
	R2 is R + 1,
	drawDiamond(R2,N),
	R3 is R-1,
	fillRowDiamond(R3,N).


drawSquare(R,N):-
	N1 is N-1,
	R >= (N1/2).

drawSquare(R,N):-
	
	N1 is N-1,
	(N1/2)> R,
	fillRowSquare(R,N),
	R1 is R + 1,
	drawSquare(R1,N),
	R2 is R1 + 1,
	fillRowSquare(R2,N).


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
	0 is mod(N,2),
	drawDiamond(N).

lace(N):-

	1 is mod(N,2),
	drawSquare(N).
