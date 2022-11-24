%a. Merge two sorted lists with removing the double values.


%merge_lists(L1: list, L2: list, R: list)
%(i, i, o)
%merge_lists(l1l2...ln, r1r2...rm) = r1r2...rm, if n=0
%                                  = l1l2...ln, if m=0
%                                  = l1 + merge_lists(l2...ln,
%                                  r1r2...rm), if l1<r1
%                                  = r1 + merge_lists(l1l2...ln,
%                                  r2...rm), if l1>r1
%                                  = merge_lists(l1l2...ln, r2...rm),
%                                  if l1=r1
merge_lists([], L2, L2).
merge_lists(L1, [], L1).
merge_lists([H1|T1], [H2|T2], [H1|R]):-
    H1<H2,
    merge_lists(T1, [H2|T2], R).
merge_lists([H1|T1], [H2|T2], [H2|R]):-
    H1>H2,
    merge_lists([H1|T1], T2, R).
merge_lists([H1|T1], [H2|T2], R):-
    H1=:=H2,
    merge_lists([H1|T1], T2, R).



%b. For a heterogeneous list, formed from integer numbers and list
%of numbers, merge all sublists with removing the double values.
% [1, [2, 3], 4, 5, [1, 4, 6], 3, [1, 3, 7, 9, 10], 5, [1, 1, 11], 8]
% =>[1, 2, 3, 4, 6, 7, 9, 10, 11].


%merge_heterolist(L: list, R: list)
%(i, o)
%merge_heterolist(l1l2...ln) = [], if n=0
%                            = merge_heterolist(l2...ln), if l1 is not a
%                            list
%                            = merge_lists(l1,
%                            merge_heterolist(l2...ln)), if l1 is a list
merge_heterolist([], []).
merge_heterolist([H|T], R):-
    not(is_list(H)),
    merge_heterolist(T, R).
merge_heterolist([H|T], R1):-
    is_list(H),
    merge_heterolist(T, R2),
    merge_lists(H, R2, R1).



% Same problem with an aditional list result of elements that are not a
% list.


merge_heterolist_modified([], [], []).
merge_heterolist_modified([H|T], R, [H|N]):-
    not(is_list(H)),
    merge_heterolist_modified(T, R, N).
merge_heterolist_modified([H|T], R1, N):-
    is_list(H),
    merge_heterolist_modified(T, R2, N),
    merge_lists(H, R2, R1).



%Tests.


test_a:-
    merge_lists([1], [], R1),
    R1=[1],
    merge_lists([], [2], R2),
    R2=[2],
    merge_lists([1, 3, 4], [2, 5], R3),
    R3=[1, 2, 3, 4, 5],
    merge_lists([1, 2, 3, 4], [1, 2, 2, 3, 5], [1,2,3,4,5]).


test_b:-
    merge_heterolist([], R1),
    R1=[],
    merge_heterolist([2, 3], R2),
    R2=[],
    merge_heterolist([2, [3]], R3),
    R3=[3],
    merge_heterolist([1, [2, 3], 4, 5, [1, 4, 6], 3, [1, 3, 7, 9, 10], 5, [1, 1, 11], 8], R4),
    R4=[1, 2, 3, 4, 6, 7, 9, 10, 11].


test_b_modified:-
    merge_heterolist_modified([], R1, N1),
    R1=[],
    N1=[],
    merge_heterolist_modified([2, 3], R2, N2),
    R2=[],
    N2=[2, 3],
    merge_heterolist_modified([2, [3]], R3, N3),
    R3=[3],
    N3=[2],
    merge_heterolist_modified([1, [2, 3], 4, 5, [1, 4, 6], 3, [1, 3, 7, 9, 10], 5, [1, 1, 11], 8], R4, N4),
    R4=[1, 2, 3, 4, 6, 7, 9, 10, 11],
    N4=[1, 4, 5, 3, 5, 8].















