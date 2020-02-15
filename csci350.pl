%append function
append([],L,L).
append([H|T],L2,[H|L3]):-append(T,L2,L3).

%sum of up the numbers in the list.
sum([Head|Tail], N):-
    sum(Tail, N1),
    N is N1 + Head.

%function to get only sum of numbers.
sum-up-numbers-simple([], 0).

sum-up-numbers-simple(L, N):-
    getnumbersfromlist(L,S),
    sum(S,N).
