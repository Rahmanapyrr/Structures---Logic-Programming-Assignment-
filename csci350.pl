%append function
append([],L,L).
append([H|T],L2,[H|L3]):-append(T,L2,L3).

% Predicate 1
% Function to sum a list of numbers without acknowledging nested lists
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



% Predicate 3
% function that gets the minimum number in list.
min_in_list([Min],Min).                 % We've found the minimum

min_in_list([H,K|T],M) :-
    H =< K,                             % H is less than or equal to K
    min_in_list([H|T],M).               % so use H

min_in_list([H,K|T],M) :-
    H > K,                              % H is greater than K
    min_in_list([K|T],M).               % so use K
    
    
check([], _, []).
check([H|T], Min, Rest) :-
    not(number(H)), 
    check(T, Min, Rest),!.

check([H|T], Min, Rest) :-
    number(H), %if the first element is a number and greater than the provided minimum, add to the list.
    H > Min,
    check(T, Min, Rest1),
    append([H], Rest1, Rest),!.

check([_|T], Min, Rest) :-
    check(T, Min, Rest),!. %If the first element is a number and is less than the provided list, recursively call minimumcheck.

min-above-min(L1, [], N) :- min_in_list(L1, N). %If the second list is empty, then getminimum is called on the first list.


min-above-min(L1, L2, N) :-
    min_in_list(L2, Minimumnumber),
    check(L1, Minimumnumber, List),
    min_in_list(List, N),!.


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

%function to get the common elements in two lists.
common-unique-elements(L1, L2, N) :- flat-list(L1, List1), flat-list(L2, List2), intersection(List1, List2, N).
