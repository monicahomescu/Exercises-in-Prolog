%a. Write a predicate to test equality of two sets without using the set difference.


%get_length(L: list, R: integer)
%(i, o)
%get_length(l1l2...ln) = 0, if n=0
%                        1 + get_length(l2...ln), otherwise
get_length([], 0).
get_length([_|T], R):-
    get_length(T, R1),
    R is R1+1.


%check_elem(X: integer, L: list)
%(i, i)
%check_elem(e, l1l2...ln) = true, if l1=e
%                           check_elem(e, l2...ln), otherwise
check_elem(X, [X|_]).
check_elem(X, [_|T]) :-
    check_elem(X, T).


%delete_elem(X: integer, L: list, R: list)
%(i, i, o)
%delete_elem(e, l1l2...ln) = [], if l1=e and n=1, or if n=0
%                            l2...ln, if l1=e
%                            l1 + delete_elem(e, l2...ln), otherwise
delete_elem(_, [], []).
delete_elem(X, [X], []).
delete_elem(X, [X|T], T).
delete_elem(X, [Y|T], [Y|T1]):-
    delete_elem(X, T, T1).


%check_equality(L: list, R: list)
%(i, i)
%check_equality(l1l2...ln, r1r2...rm) = true, if n=0 and m=0
%                                       check_equality(delete_elem(r1, l2...ln), delete_elem(l1, r2...rn)),
%                                              if m=n and check_elem(r1, l1l2...ln)=true and
%                                               check_elem(l1,r1r2...rm)=true
check_equality([], []).
check_equality([H1|T1], [H2|T2]):-
    get_length([H1|T1], L1),
    get_length([H2|T2], L2),
    L1 =:= L2,
    check_elem(H2, [H1|T1]),
    check_elem(H1, [H2|T2]),
    delete_elem(H2, T1, R1),
    delete_elem(H1, T2, R2),
    check_equality(R1, R2).



%Same problem using difference.


get_difference([], [], []).
get_difference([], [_|_], []).
get_difference([H|T], L2, [H|R]):-
    not(check_elem(H, L2)),
    !,
    get_difference(T, L2, R).
get_difference([_|T], L2, R):-
    get_difference(T, L2, R).


check_equality_modified(L1, L2):-
    get_difference(L1, L2, R1),
    get_length(R1, 0),
    get_difference(L2, L1, R2),
    get_length(R2, 0).



%b. Write a predicate to select the n-th element of a given list.


%get_nth(N: integer, L: list, R: integer)
%(i, i, o)
%get_nth(n, l1l2...ln) = l1, if n=1
%                        get_nth(n-1, l2...ln), otherwise
get_nth(1, [X|_], X).
get_nth(N, [_|T], R):-
    N1 is N-1,
    get_nth(N1, T, R).



%Tests.


test_a:-
    check_equality([2, 5, 3], [2, 5, 3]),
    check_equality([2, 5, 3], [5, 3, 2]),
    check_equality([2], [2]),
    check_equality([], []),
    \+check_equality([5, 3, 7], [3, 5, 8]),
    \+check_equality([2, 5, 3, 8], [5, 3, 2]),
    \+check_equality([2, 5, 3], [5, 3, 2, 8]).


test_a_modified:-
    check_equality_modified([2, 5, 3], [2, 5, 3]),
    check_equality_modified([2, 5, 3], [5, 3, 2]),
    check_equality_modified([2], [2]),
    check_equality_modified([], []),
    \+check_equality_modified([5, 3, 7], [3, 5, 8]),
    \+check_equality_modified([2, 5, 3, 8], [5, 3, 2]),
    \+check_equality_modified([2, 5, 3], [5, 3, 2, 8]).


test_b:-
    get_nth(1, [3, 12, 6, 43, 93, 6], 3),
    get_nth(6, [3, 12, 6, 43, 93, 6], 6),
    get_nth(4, [3, 12, 6, 43, 93, 6], 43),
    \+get_nth(0, [3, 12, 6, 43, 93, 6], false),
    \+get_nth(7, [3, 12, 6, 43, 93, 6], false).

