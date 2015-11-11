isDistinct([]).

isDistinct([H|T]):-
	\+member1(H,T),
	isDistinct(T).

isDistinct([H|T]):-
	member1(H,T),
	!,
	fail.

member1(_,[]):-
	fail.

member1(X,[H|T]):-
	\+var(H),
	X = H,!.

member1(X,[_|T]):-
	member1(X,T).
	

checkIfRowsDistinct([]).
checkIfRowsDistinct([H|T]):-
	isDistinct(H),
	checkIfRowsDistinct(T).	

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
	checkIfRowsDistinct(Rows),
	transpose(Rows,Columns),
	checkIfRowsDistinct(Columns),
	%R = [A,B,C,D,E,F],
	%blocks(A,B),blocks(C,D),blocks(E,F),
	%blockCheck(Rows),
	( allAssigned(Rows)
	-> write(Rows)
	; sudoku(Rows)
	).

blockCheck([A,B,C,D,E,F]):-
	blocks(A,B),
	blocks(C,D),
	blocks(E,F).

blocks([],[]).
blocks([A,B,C|Bs1],[D,E,F|Bs2]):-
	isDistinct([A,B,C,D,E,F]),
	blocks(Bs1,Bs2).

bind(X,[Row|Rows]):-
	bind1(X,Row).

bind1(X,[H|T]):-
	var(H),
	H is X.

bind1(X,[_|T]):-
	bind1(X,T).
