tartan(0,_,_).
tartan(1,0,_):-
	write('*'),
	write('\n').
tartan(1,1,_):-
	write(' * '),
	write('\n').
tartan(1,R,AC):-
	writeChar(' ',R),
	addColumn(AC),
	write('*'),
	addColumn(AC),
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

addColumn(R):-
	R = 0.

addColumn(_):-
	write('*').

tartan(N,R,AC):-
	even(N),
	writeChar(' ',R),
	addColumn(AC),
	writeEvenLine(N),
	addColumn(AC),
	write('\n'),
	N1 is N-1,
	R1 is R+1,
	tartan(N1,R1,AC),
	writeChar(' ',R),
	addColumn(AC),
	writeEvenLine(N),
	addColumn(AC),
	write('\n').

tartan(N,R,AC):-
	odd(N),
	writeChar(' ',R),
	addColumn(AC),
	writeOddLine(N),
	addColumn(AC),
	write('\n'),
	N1 is N-1,
	R1 is R+1,
	tartan(N1,R1,1),
	writeChar(' ',R),
	addColumn(AC),
	writeOddLine(N),
	addColumn(AC),
	write('\n').
	
tartan(N):-
	tartan(N,0,0).
