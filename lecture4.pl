parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

female(pam).
female(pat).
female(ann).
female(liz).

male(tom).
male(bob).
male(jim).

grandparent(X,Y) :-
	parent(X,Z), 
	parent(Z,Y).

sibling(X,Y) :-
	parent(Z,X), 
	parent(Z,Y), 
	X\=Y.

cousin(X,Y) :-
	parent(Z1,X) ,
	parent(Z2,Y) ,
	sibling(Z1,Z2) ,
	X\=Y.

greatgrandparent(X,Y) :-
	parent(X,Z),
	grandparent(Z,Y).

greatgreatgrandparent(X,Y) :-
	grandparent(X,Z),
	grandparent(Z,Y).

ancestor(X,Y):-
	parent(X,Y).
ancestor(X,Y) :-
	parent(X,Z),
	ancestor(Z,Y).
