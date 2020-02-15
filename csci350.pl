%append function
append([],L,L).
append([H|T],L2,[H|L3]):-append(T,L2,L3).

% Predicate 1
% Function to sum not nested numbers only

sum-up-numbers-simple([],0).
sum-up-numbers-simple([H|T],N):- \+(number(H))->sum-up-numbers-simple(T,N);sum-up-numbers-simple(T,N1),N is N1 + H.

% Predicate Number 2
% flattens a nested list into a single list.
getitems([], L) :- L=[].
getitems([H|T], L) :-
    getitems(T,NewListTail),
    (not(is_list(H)) -> L = [H|NewListTail]; getitems(H,NewListHead), append(NewListHead, NewListTail, L)).

sum-up-numbers([],0).
sum-up-numbers([H|T],N):- \+(number(H))->sum-up-numbers(T,N);sum-up-numbers(T,N1),N is N1 + H.

%sum of up the numbers in a list.
sum-list([], 0).
sum-list([H|T], N):-sum-list(T, N1),N is N1 + H.

%final function
sum-up-numbers-general([], 0).
sum-up-numbers-general(L, N):-getitems(L,I), sum-up-numbers(I, N).

% Predicate 4.
%function to flatten list
flat-list([], L):- L = [].

flat-list([H|T], List) :- is_list(H), flat-list(H, List1), flat-list(T, List2), append(List1, List2, List
flat-list([H|T], List) :- not(is_list(H))-> flat-list(T, List1), append([H], List1, List),!.


%finds the intersection of two lists.
intersection([], _, []). %if one list is empty, return an empty list.
intersection(_, [], []).

intersection([H|T], L, [H|NewList]) :- member(H, L), intersection(T, L, NewList),!.
intersection([H|T], L, Trash) :- not(member(H, L)), intersection(T, L, Trash),!.
