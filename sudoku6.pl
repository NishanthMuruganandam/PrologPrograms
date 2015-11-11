sudoku(Puzzle) :- 
   printPuzzle(Puzzle), nl, 
   flag(counter,_,0),
   init(Puzzle,Spots),
   solve(Spots),
   printPuzzle(Puzzle),
   flag(counter,N,N+1),
   fail.
sudoku(_) :- 
   flag(counter,N,N), nl, 
   printCounter(N).

% ---------------------------------------------------------------

% The most difficult part of the problem solution is to prepare 
% the list of spot/4 terms representing the spots in the puzzle.
% We have to make sure that every spot "knows" its row, column,
% and square. In other words, all the spots in a row access the
% same list in order to check whether a new number can be placed
% in the row. The same is true for the columns and the squares. 

% connect(Spots) :- Spots = [spot(_,R1,C1,S1),spot(_,R1,C2,S1),.....].

connect(Spots) :- 
   length(Spots,36),
   connectRows(Spots), 
   connectCols(Spots), 
   connectSquares(Spots).

% connectRows(Spots) :- connect the spots of all rows in the list Spot

connectRows([]).
connectRows(Spots) :- 
   connectRow(Spots,_,6),
   skip(Spots,6,Spots1), 
   connectRows(Spots1).

% connectRow(Spots,R,K) :- the first K elements of Spot
% are in the same row R


skip([],_,[]) :- !.
skip(Xs,0,Xs) :- !.
skip([_|Xs],K,Zs) :- K > 0, K1 is K-1, skip(Xs,K1,Zs). 

% -----------------------------------------------------------

% init(Puzzle,Spots) :- initialize the Spots list on the
%    basis of the problem statement (Puzzle) and link the
%    Puzzle list to the Spots list 

init([],[]).
init([X|Xs],[Sp|Spots]) :- initSpot(X,Sp), init(Xs,Spots).


initSpot(X,spot(X,_,_,_)) :- var(X), !.
initSpot(X,spot(X,R,C,S)) :- integer(X),
   insert(X,R),
   insert(X,C),
   insert(X,S).


solve([]).
solve([Spot|Spots]) :- bind(Spot), solve(Spots).


bind(spot(X,_,_,_)) :- nonvar(X), !.
bind(spot(X,R,C,S)) :- var(X),
   between(1,6,X),  % try a digit
   insert(X,R),
   insert(X,C),
   insert(X,S).


insert(X,L) :- var(L), !, L = [X|_].
insert(X,[Y|Ys]) :- X \= Y, insert(X,Ys).


printPuzzle([]).
printPuzzle(Xs) :- nl,
   printBand(Xs,Xs1),
   write('--------+---------+--------'), nl,
   printBand(Xs1,Xs2),
   write('--------+---------+--------'), nl,
   printBand(Xs2,_).

printBand(Xs,Xs3) :- 
   printRow(Xs,Xs1), nl,
   write('        |         |'), nl, 
   printRow(Xs1,Xs2), nl,
   write('        |         |'), nl, 
   printRow(Xs2,Xs3), nl.
 
printRow(Xs,Xs3) :-
   printTriplet(Xs,Xs1), write(' | '),
   printTriplet(Xs1,Xs2), write(' | '),
   printTriplet(Xs2,Xs3).

printTriplet(Xs,Xs3) :-
   printElement(Xs,Xs1), write('  '),
   printElement(Xs1,Xs2), write('  '),
   printElement(Xs2,Xs3).

printElement([X|Xs],Xs) :- var(X), !, write('.').
printElement([X|Xs],Xs) :- write(X).

printCounter(0) :- !, write('No solution'), nl.
printCounter(1) :- !, write('1 solution'), nl.
printCounter(K) :- write(K), write(' solutions'), nl.

% ---------------------------------------------------------

test(N) :- puzzle(N,P), sudoku(P).

puzzle(1,P) :- 
   P = [_,_,4,8,_,_,_,1,7, 6,7,_,9,_,_,_,_,_, 5,_,8,_,3,_,_,_,4,
        3,_,_,7,4,_,1,_,_, _,6,9,_,_,_,7,8,_, _,_,1,_,6,9,_,_,5,
	1,_,_,_,8,_,3,_,6, _,_,_,_,_,6,_,9,1, 2,4,_,_,_,1,5,_,_].

puzzle(2,P):-
	P = [2,1,_,_,4,3,
            _,_,_,_,_,_,
            _,_,6,2,_,_,
            _,_,3,4,_,_,
            _,_,_,_,_,_,
            3,4,_,_,5,6].


