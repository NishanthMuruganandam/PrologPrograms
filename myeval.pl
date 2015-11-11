plus(N1,N2,R):-
	R is N1+N2.

min(N1,N2,R):-
	R is N1-N2.

mult(N1,N2,R):-
	R is N1*N2.

delete([X|Ys],X,Ys).
delete([X|Xs],Y,[X|Zs]):-
	delete(Xs,Y,Zs).

permute([],[]).
permute([X|Xs],Ys) :-
	permute(Xs,Zs),
	delete(Ys,X,Zs).

max(N1,N2,R):-
	N1 >= N2,
	R is N1.
max(N1,N2,R):-	
	N2 > N1,
	R is N2.

tree(_,_).

compute(plus,X,Y,R):-
	plus(X,Y,R).

compute(min,X,Y,R):-
	min(X,Y,R).

compute(mult,X,Y,R):-
	mult(X,Y,R).

length([],0).
length([_|Xs],M):-
	length(Xs,N),
	M is N+1.

evaluate(tree(X,Y),[OH|_],R):-
	number(X),
	number(Y),
	compute(OH,X,Y,R).

evaluate(tree(X,Y),[OH|OT],R):-
	number(X),
	evaluate(Y,OT,R1),
	evaluate(tree(X,R1),[OH],R).

evaluate(tree(X,Y),[OH|OT],R):-
	number(Y),
	evaluate(X,[OH],R1),
	evaluate(tree(R1,Y),OT,R).

evaluate(tree(X,Y),[OH|OT],R):-
	evaluate(X,[OH],R1),
	evaluate(tree(R1,Y),OT,R).	

enter(tree(X,Y),[OH|OT],Max):-
	permute([OH|OT],Oprn),
	evaluate(tree(X,Y),Oprn,R1),
	permute(Oprn,Oprn),
	evaluate(tree(X,Y),Oprn,R2),
	max(R1,R2,Max).

maxInList([],_,_).
maxInList([OH],MaxSoFar,Max):-
	max(OH,MaxSoFar,Max).
maxInList([OH|OT],MaxSoFar,Max):-
	max(OH,MaxSoFar,Max1),
	maxInList(OT,Max1,Max).

maxval(tree(X,Y),[OH|OT],R):-
	findall(Max,enter(tree(X,Y),[OH|OT],Max),R1),
	maxInList(R1,-10000,R).

