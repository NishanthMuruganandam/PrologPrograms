
addColumn(R):-
	R = 0.

addColumn(_):-
	write('*').
tartan(1,1,0):-
	write('*').
tartan(1,R):-
	writeChar(' ',R),
	addColumn(R),
	write('*'),
	addColumn(R),
	write('\n').

even(N):-
	0 is mod(N,2).

odd(N):-
	1 is mod(N,2).

writeChar(_,N):-
	N =<0.

writeChar(C,N):-
	N > 0,
	write(C),
	N1 is N-1,
	writeChar(C, N1).

writeEvenLine(N):-
	N0 is 2*N,
	N1 is N0-1,
	writeChar('*',N1).

writeOddLine(N):-
	N1 is (2*N)-3,
	write('*'),
	writeChar(' ',N1),
	write('*').

addColumn(N,NP):-
	N = NP.

addColumn(N,NP):-
	even(N),
	odd(NP),	
	write('*').

tartan(N,NP,R):-
	even(N),
	writeChar(' ',R),
	%addColumn(N,NP),
	writeEvenLine(R),
	%addColumn(N,NP),
	write('\n'),
	N1 is N-1,
	R1 is R+1,
	tartan(N1,N,R1),
	writeChar(' ',R),
	%addColumn(N,NP),
	writeEvenLine(N),
	%addColumn(N,NP),
	write('\n').

tartan(N,_,R):-
	odd(N),
	writeChar(' ',R),
	writeOddLine(N),
	write('\n'),
	N1 is N-1,
	R1 is R+1,
	tartan(N1,N,R1),
	writeChar(' ',R),
	writeOddLine(N),
	write('\n').
	
tartan(N):-
	tartan(N,N,0).
