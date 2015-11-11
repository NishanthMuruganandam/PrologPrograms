%:- import member/2 from basics.
%:- import append/3 from basics.

%Union of three sets
union(L1,L2,L3,R):-
	union2(L1,L2,R1),
	union2(R1,L3,R).

union2([],L,L).
union2([H|T],L,[H|R]):-
	\+member(H,L),
	!,
	union2(T,L,R).

union2([H|T],L,R):-
	union2(T,L,R).

%CartesianProduct of two sets

cartesianProduct([],_,[]).
cartesianProduct([H|T],L,R):-
	cartesianProductHelper(H,L,R1),
	cartesianProduct(T,L,R2),
	append(R1,R2,R).

cartesianProductHelper(H,[],[]).
cartesianProductHelper(H,[H2|T],[(H,H2)|R]):-
	cartesianProductHelper(H,T,R).

cartesianProductNew(L1,L2,R):-
	findall((X,Y),
	(
		member(X,L1),
		member(Y,L2)
	),
	R).

%PowerSet of a set

powerSet([],[[]]).
powerSet([H|T],R):-
	powerSet(T,R2),
	insert(H,R2,R3),
	append(R2,R3,R).

insert(_,[],[]).
insert(X,[H|T],[[X|H]|R]):-
	insert(X,T,R).

%Palindrome using difference list.

palindrome(A-A).
palindrome([H|A]-A).
palindrome([H|X]-Y):-
	Y = [H|Z],
	palindrome(X-Z).

%ShiftLeft
shiftLeft([],[]).
shiftLeft([H|T],R):-
	append(T,[H],R).

%Diamond

writeNTimes(0,_).
writeNTimes(N,S):-
	N > 0,
	write(S),
	N1 is N-1,
	writeNTimes(N1,S).


%diamond(N):-
%	diamond(1,N).
%	
%diamond(M,N):-
%	M > 2*N.
%
%diamond(M,N):-
%	M =< N,
%	M2 is N-M,
%	write(M2,' '),
%	write('*'),
%	(
%		M\=1
%		->
%		M3 is 2*(M-1)-1,
%		writeNTimes(M3,' '),
%		write('*')
%		;
%		true
%	),
%	nl,
%	M5 is M+1,
%	diamond(M5,N).

