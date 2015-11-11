append(nil,L,L).
append(.(H,T),L,.(H,R)):-
	append(T,L,R).

append is a predicate symbol
append/3 is a predicate with 3-arity

. is a functor
./w is the list functor with 2 arguments (head,tail)

number(zero).

number(succ(X)) :- number(X).

number/1 is a predicate
succ/2 is a functor


