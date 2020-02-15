%append function
append([],L,L).
append([H|T],L2,[H|L3]):-append(T,L2,L3).

% Predicate 1
% Function to sum not nested numbers only

sum-up-numbers-simple([],0).
sum-up-numbers-simple([H|T],N):- \+(number(H))->sum-up-numbers-simple(T,N);sum-up-numbers-simple(T,N1),N is N1 + H.
