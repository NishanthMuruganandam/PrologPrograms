%FlattenList
append([],L,L).
append([H|T],L,[H|R]):-
	append(T,L,R).

shift([H|T],L):-
	append(T,[H],L).

flatten([],[]).
flatten([H|T],L):-
	!,
	flatten(H,L1),
	flatten(T,L2),
	append(L1,L2,L).
flatten(X,[X]).

%Cutexample

p(1).
p(2).
q(1,3).
q(1,4).
q(2,5).

test(X,Y) :- p(X),q(X,Y).

test1(X,Y) :- p(X),!,q(X,Y).

%Eliminate_Consecutive_Duplicates

elim([],[]).
elim([H|T],[H|T2]):-
	prefix(H,T,T1),
	elim(T1,T2).

prefix(H,[H|T],R):-
	!,
	prefix(H,T,R).
prefix(_,L,L).
	
%Group_Consecutive_Duplicates
% ?- group([1,1,1,1,2,2,2,2,3,3,3,3],L).
% L =[[1,1,1,1],[2,2,2,2],[3,3,3,3]]

group([],[]).

group([H|T], [Hs|Ts]):-
	prefix(H,[H|T],Hs,T1),
	group(T1,Ts).

prefix(H,[H|T],[H|T2],T3) :-
	!,
	prefix(H,T,T2,T3).

prefix(_,L,[],L).

% ?-pack([1,1,1,1,2,2,2,2,3,3,3,3],L).
% L = [(4,1,),(4,2),(4,3)]

pack(L,L2):-
	group(L,L1),
	packHelper(L1,L2).

packHelper([],[]).
packHelper([H|T],[(L,X)|R]):-
	length(H,L),
	H = [X|_],
	packHelper(T,R).

length([],0).
length([_|T],N):-
	length(T,N1),
	N is N1+1.

% ?-decode([(4,1),(4,2),(4,3)],L).
% L = [1,1,1,1,2,2,2,2,3,3,3,3]

decode([],[]).
decode([(L,X) | T],R):-
	expand(L,X,L2),
	decode(T,L3),
	append(L2,L3,R).

expand(0,_,[]):-
	!.

expand(N,X,[X|T]):-
	N1 is N-1,
	expand(N1,X,T).	

% ?- range(1,10,L).
% L = [1,2,3,4,5,6,7,8,9,10]

range(X,X,[X]) :- 
	!.

range(X,Y,[X|T]):-
	X < Y,
	X1 is X+1,
	range(X1,Y,T).

range(X,Y,[]):-
	X > Y.

% ?- isPrime(17).
% yes
% ?- isPrime(16).
% no

isPrime(2).
isPrime(N):-
	isPrime(2,N).

isPrime(X,N):-
	N2 is sqrt(N),
	N2 < X,
	!.

isPrime(X,N):-
	0 is N mod X,
	!,
	fail.

isPrime(X,N):-
	X2 is X+1,
	isPrime(X2,N).

% ?-genPrimes(20,L).
% L = [2,3,5,7,11,13,17,19]

genPrimes(N,L):-
	range(2,N,L1),
	checkPrimes(L1,L).

checkPrimes([],[]).
checkPrimes([H|T],[H|T2]):-
	isPrime(H),
	!,
	checkPrimes(T,T2).
	
checkPrimes([_|T],T2):-
	checkPrimes(T,T2).
