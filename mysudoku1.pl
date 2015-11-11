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
	member(X,[1,2,3,4,5,6]),
	bind(X,Rows),
	checkIfDistinct(Rows),
	trans(Rows,Columns),
	checkIfDistinct(Columns),
	%R = [A,B,C,D,E,F],
	%blocks(A,B),blocks(C,D),blocks(E,F),
	%blockCheck(Rows),
	( \+allAssigned(Rows)
	-> write(Rows)
	; sudoku(Rows)
	).


blockCheck([A,B,C,D,E,F]):-
	blocks(A,B),
	blocks(C,D),
	blocks(E,F).

blocks([],[]).
blocks([A,B,C|Bs1],[D,E,F|Bs2]):-
	distinct([A,B,C,D,E,F]),
	blocks(Bs1,Bs2).

bind(X,[Row|_]):-
	(\+noFree(Row)
	 -> bind1(X,Row)
	;true
	).

bind1(X,[H|_]):-
	var(H),
	H is X.

bind1(X,[_|T]):-
	bind1(X,T).
