:- import member/2 from basics.

plus(N1,N2,R):-
	R is N1+N2.


kth([X|_],0,X).
kth([_|Y],N,X) :-
        number(N),
	N>0,
	N1 is N-1,
	kth(Y,N1,X).

append([],L,L).
append([H|T],L2,[H|L3])  :-  append(T,L2,L3). 

intersection([], _, []).
intersection([Head|L1tail], L2, L3) :-
        member(Head, L2),
        !,
        L3 = [Head|L3tail],
        intersection(L1tail, L2, L3tail).
intersection([_|L1tail], L2, L3) :-
        intersection(L1tail, L2, L3).

difference([],S,[]).

difference(S,[],S):-S\=[].

difference([X|TX],[X|TY],TZ):-
	difference(TX,TY,TZ).

difference([X|TX],[Y|TY],[X|TZ]):-
	difference(TX,[Y|TY],TZ).

difference([X|TX],[Y|TY],TZ):-
	difference([X|TX],TY,TZ).

extract(_,[],0).

extract([H],[H],N):-
	N>0.

extract([H|T],[H|R],N):-
	N > 0,
	N1 is N-1,
	extract(T,R,N1).

sum_list([], 0).
sum_list([H|T], Sum) :-
   sum_list(T, Rest),
   Sum is H + Rest.
	
rowValidation([R|_]):-
	sum_list(R,Sum),
	Sum = 21.

boxValidation([R1,R2|T]):-
	extract(R1,L1,3),
	extract(R2,L2,3),
	intersection(L1,L2,[]),
	kth(R1,3,X),
	kth(R1,4,Y),
	kth(R1,5,Z),	
	kth(R2,3,L),
	kth(R2,4,M),
	kth(R2,5,N),
	intersection([X,Y,Z],[L,M,N],[]).

noDuplicatePresent([]).
noDuplicatePresent([H]).
noDuplicatePresent([H|T]):-
	\+member(H,T),
	noDuplicatePresent(T).

colValidation([[],[],[],[],[],[]]).
colValidation([[H1],[H2],[H3],[H4],[H5],[H6]]):-
	noDuplicatePresent([H1,H2,H3,H4,H5,H6]).

colValidation([[H1|T1],[H2|T2],[H3|T3],[H4|T4],[H5|T5],[H6|T6]]):-
	noDuplicatePresent([H1,H2,H3,H4,H5,H6]),
	colValidation([[T1],[T2],[T3],[T4],[T5],[T6]]).
	
