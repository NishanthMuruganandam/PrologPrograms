trans([],[]).
trans([[]|_], []):-!.
trans([S|R], [L|L1]) :-
    trans(S, R, L, M),
    trans(M, L1).

trans([], _,[],[]).
trans([S1|S2], [], [S1|L1], [S2|M]):-
    trans([], [], L1, M).
trans([S1|S2], [R1|R2], [S1|L1], [S2|M]):-
    trans(R1, R2, L1, M).

distinct([]).
distinct([H|T]):-
	\+member(H,T),
	distinct(T).
	
extractBound([],[]).

extractBound([H|T],R):-
	var(H),
	extractBound(T,R).

extractBound([H|T],R):-
	\+var(H),
	extractBound(T,R1),
	append([H],R1,R).	

checkIfDistinct([]).
checkIfDistinct([H|T]):-
	extractBound(H,R),
	distinct(R),
	checkIfDistinct(T).	


noFree([]).
noFree([H|T]):-
	\+var(H),
	noFree(T).

allAssigned([]).
allAssigned([Row|Rows]):-
	noFree(Row),	
	allAssigned(Rows).

	
sudoku(Rows):-
	bind(Rows),
	checkIfDistinct(Rows),
	trans(Rows,Columns),
	checkIfDistinct(Columns),
	blockCheck(Rows),
	write(Rows).

blockCheck([]).
blockCheck([R1,R2|T]):-
	blocks(R1,R2),
	blockCheck(T).
	

blocks([],[]).
blocks([A,B,C|Bs1],[D,E,F|Bs2]):-
	distinct([A,B,C,D,E,F]),
	blocks(Bs1,Bs2).

bind([]).
bind([R|Rs]):-
	noFree(R),
	bind(Rs).

bind([Row|Rs]):-
	\+allAssigned([Row|Rs]),
	member(X,[1,2,3,4,5,6]),
	bind1(X,Row),
	(
	\+noFree(Row)
	-> bind([Row|Rs])
	;
	bind(Rs)
	).

bind1(_,[]).
bind1(X,[H|_]):-
	var(H),
	H is X,!.

bind1(X,[_|T]):-
	bind1(X,T).
