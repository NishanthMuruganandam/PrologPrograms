member(X,[X|_]).
member(X,[_|Ys]) :-
	member(X,Ys).

last(X,[X]).
last(X,[_|T]):-
	last(X,T).

kth([X|_],0,X).
kth([_|Y],N,X) :-
        number(N),
	N>0,
	N1 is N-1,
	kth(Y,N1,X).

append([],L,L).
append([H|T],L2,[H|L3])  :-  append(T,L2,L3). 

append2(X-Y,Y-Ys,X-Ys).

% add(5,[1,2,3,4],L).
% L = [1,2,3,4,5].

add(X,[],[X]).
add(X,[H|T],[H|R]):-
	add(X,[T],R).

add2(X,Y-[X|Zs],Y-Zs).

palindrome(X):-
	palindromeHelp(X-[]).

palindromeHelp(A-A).
palindromeHelp([_|A]-A).
palindromeHelp([C|A]-D):-
	palindromeHelp(A-B),
	B = [C|D].


p(f(1)).

reverse([],[]).
reverse([H],[H]).
	
reverse([H|T],R) :-
	reverse(T,RT),
	append(RT,[H],R).


len([],0).
len([_|Xs],N+1):-len(Xs,N).

length([],0).
length([_|Xs],M):-
	len(Xs,N),
	M is N+1.

for(I,I,_).

for(I, X, N):-
	X<N,
	X1 is X+1,
	for(I,X1,N).

delete([X|Ys],X,Ys).
delete([X|Xs],Y,[X|Zs]):-
	delete(Xs,Y,Zs).

permute([],[]).
permute([X|Xs],Ys) :-
	permute(Xs,Zs),
	delete(Ys,X,Zs).

quicksort([],[]).
quicksort([X0|Xs],Ys):-
	partition(Xs,X0,Ls,Gs),
	quicksort(Ls,Ys1),
	quicksort(Gs,Ys2),
	append(Ys1,[X0|Ys2],Ys).

partition(Pivot,[],[],[]).

partition(Pivot,[X|Xs],[X|Ys],Zs):-
	X =< Pivot,
	partition(Pivot,Xs,Ys,Zs).

partition(Pivot,[X|Xs],Ys,[X|Zs]):-
	X > Pivot,
	partition(Pivot,Xs,Ys,Zs).

%flatten([],[]).
%flatten([H|T],R):-
%	((atom(H);number(H)),
%	->
%	flatten(T,R2),
%	R = [H|R2]
%	;
%	flatten(H,L),
%	flatten(T,R2),
%	append(L,R2,R)
%%%).
