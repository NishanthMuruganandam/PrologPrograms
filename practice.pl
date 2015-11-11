
triangle(N):-
	triangle(N,1).


triangle(N,I):-
	N > 0,
	spaces(N),
	star(I),
	write('\n'),
	I1 is I+1,
	N1 is N-1,
	triangle(N1,I1).

spaces(N):-
	N > 0,
	write(' '),
	N1 is N - 1,
	spaces(N1).

star(I):-
	I>0,
	write('*'),
	I1 is I-1,
	star(I1).

spaces(0).
star(0).
triangle(0,_).

