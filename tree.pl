append([],L,L).
append([H|T],L2,[H|L3])  :-  append(T,L2,L3). 


inorder(nil,[]).
inorder(tr(R,LEFT,RIGHT),L):-
    inorder(LEFT,L1),
    append(L1,[R],X),
    inorder(RIGHT,L2),
    append(X,L2,L).

