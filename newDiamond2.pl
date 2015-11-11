writeChar(_,N):-
	N =< 0.

writeChar(C,N):-
	N > 0,
	write(C),
	N1 is N-1,
	writeChar(C,N1).

fillRowSquare(R,_):-
	R < 0.

fillRowSquare(R,1):-
	R = 0,
	writeChar('*',3).

fillRowSquare(R,N):-
	R = 0,
	N \= 1,
	N1 is (2*N)-1,
	writeChar('*',N1).

fillRowSquare(R,N):-
	R \= 0,
	writeChar('*',1),
	N1 is N-1,
	fillRowDiamond(R,N1,1),
	writeChar('*',1).

drawSquare(R,N):-
	R > N.

drawSquare(R,1):-
	R = 1,
	write('* *\n').

drawSquare(R,N):-
	N \= 1,
	N1 is N - 1,
	R = N1,
	fillRowDiamond(R,N1,1),
	write('\n').
	
drawSquare(R,N):-
	R < N,
	fillRowSquare(R,N),
	write('\n'),
	R1 is R+1,
	drawSquare(R1,N),
	fillRowSquare(R,N),
	write('\n').

extraStar(R):-
	R \= 0,
	writeChar('*',1).

extraStar(_).

fillRowDiamond(_,N,_):-
	N < 0.

fillRowDiamond(_,0,_):-
	write(' ').

fillRowDiamond(R,N,I):-
	R > N,
	R1 is mod(R,N),
	fillRowDiamond(R1,N,I).


fillRowDiamond(R,N,I):-
	S is (N-R-I),
	NS is (N/2),
	writeChar(' ',S),
	writeChar('*',1),
	RS is R - NS,
	N1 is N-1,
	RD is (2*R) - 1,
	writeChar(' ',RD),
	extraStar(R),
	writeChar(' ',S).
	

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
	drawSquare(0,N).

lace(N):-
	drawDiamond(0,N).
