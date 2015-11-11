writeChar(_,N):-
	N =< 0.

writeChar(C,N):-
	N > 0,
	write(C),
	N1 is N-1,
	writeChar(C,N1).

computeNForSquare(1,3).

computeNForSquare(N1,N):-
	N is (2*N1) - 1.

fillRowSquare(R,_):-
	R < 0.

fillRowSquare(R,N):-
	R = 0,
	writeChar('*',N).

fillRowSquare(R,N):-
	N1 is N-1,
	R = N1,
	writeChar('*',N).

fillRowSquare(R,N):-
	writeChar('*',1),
	%N1 is N-2,
	%writeChar(' ',N1),
	fillRowDiamond(R,2),
	writeChar('*',1).

drawSquare(R,N):-
	R >= N.


drawSquare(R,N):-
	R < N,
	fillRowSquare(R,N),
	write('\n'),
	R1 is R+1,
	drawSquare(R1,N).

extraStar(R):-
	R \= 0,
	writeChar('*',1).

extraStar(_).

fillRowDiamond(R,N,I):-
	R > N,
	R1 is mod(R,N),
	fillRowDiamond(R1,N).


fillRowDiamond(R,N,I):-
	S is (N-R-I),
	writeChar(' ',S),
	writeChar('*',1),
	RD is (2*R) - 1,
	writeChar(' ',RD),
	extraStar(R).
	

drawDiamond(R,N):-
	R > N.

drawDiamond(R,N):-
	R = N,
	fillRowDiamond(R,N,0),
	write('\n').

drawDiamond(R,N):-
	R < N,
	fillRowDiamond(R,N,0),
	write('\n'),
	R1 is R + 1,
	drawDiamond(R1,N),
	fillRowDiamond(R,N,0),
	write('\n').

lace(N):-
	1 is mod(N,2),
	computeNForSquare(N,N1),
	drawSquare(0,N1).

lace(N):-
	drawDiamond(0,N).
