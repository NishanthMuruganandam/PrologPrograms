
triangle(N):-
	Stars = 1,  
	triangle(N,Stars). 


triangle(Spaces,Stars):-
	Spaces > 0, 
	writeN(Spaces,' '), 
	writeN(Stars,'* '), 
	Spaces1 is Spaces - 1, 
	Stars1 is Stars + 1, 
	triangle(Spaces1,Stars1).

writeN(N,C):-
	N > 0,
	C = ' ',
	write(' '),
	N1 is N-1,
	writeN(N1,C).

writeN(N,C):-
	N > 0,
	C = '*',
	write('*'),
	N1 is N -1 ,
	writeN(N1,C).

