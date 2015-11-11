append([],L,L).
append(L,[],L).
append(H,L,[H|L]).
append([H|T],L2,[H|L3])  :-  append(T,L2,L3). 

myCompare(journey(X,_),journey(Y,_),R):-	
	X = Y,
	R is 0.

equal(X,X,3).
notequal(X,Y,0):-
	X \= Y.
compute([L1H|L1T],[L2H|L2T],R):-
	equal(L1H,L2H,X),
	compute(L1T,L2T,R1),
	R is R1 + X.
	
compute([L1H|L1T],[L2H|L2T],R):-
	notequal(L1H,L2H,X),
	compute([L1H|L1T],L2T,R1),
	R is R1 + X.

myCompare(journey(X,[J1H|J1T]),journey(Y,[J2H|J2Y]),R):-
	X \= Y,
	compute([J1H|J1T],[J2H|J2Y],R).

input([],_).
input([H],_).
input([H|[TH|TT]],R):-
	myCompare(H,TH,R1),
	append(H,TT,L),
	input(L,R2).


% input([journey(bozo,[he,b,t]),journey(bozo,[he,k,t]),journey(dork,[h,k,t,s]),journey(dork,[h,o,t,s])],R).	
