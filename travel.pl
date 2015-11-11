:- import member/2 from basics.

maximalpleasureHelper(journey(Friend1,_),[journey(Friend2,_)|_],_,_,0):-
	Friend2 = Friend1.

maximalpleasureHelper(journey(Friend1,J1),[journey(Friend2,J2)|T],Travel,Stay,R):-
	Friend2 \= Friend1,
	intersection(J1,J2,L),
	length(L,N),
	R1 is (N * Travel)/2 ,
	R2 is N * Stay,
	R is R1+R2.	

maximalpleasure1([H|T],Travel,Stay,R):-
	permute([H|T],[H1|T1]),
	maximalpleasureHelper(H1,T1,Travel,Stay,R1),
	R is 2*R1.

maximalpleasure(L,Travel,Stay,R):-
	findall(Max,maximalpleasure1(L,Travel,Stay,Max),R1),
	maxInList(R1,-100000,R).

intersection([], _, []).
intersection([Head|L1tail], L2, L3) :-
        member(Head, L2),
        !,
        L3 = [Head|L3tail],
        intersection(L1tail, L2, L3tail).
intersection([_|L1tail], L2, L3) :-
        intersection(L1tail, L2, L3).

length([],0).
length([_|Xs],M):-
	length(Xs,N),
	M is N+1.

delete([X|Ys],X,Ys).
delete([X|Xs],Y,[X|Zs]):-
	delete(Xs,Y,Zs).

permute([],[]).
permute([X|Xs],Ys) :-
	permute(Xs,Zs),
	delete(Ys,X,Zs).

maxInList([],_,_).
maxInList([OH],MaxSoFar,Max):-
	max(OH,MaxSoFar,Max).
maxInList([OH|OT],MaxSoFar,Max):-
	max(OH,MaxSoFar,Max1),
	maxInList(OT,Max1,Max).

max(N1,N2,R):-
	N1 >= N2,
	R is N1.
max(N1,N2,R):-	
	N2 > N1,
	R is N2.

