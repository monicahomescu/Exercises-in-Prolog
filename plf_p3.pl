%Generate all sub-strings of a length 2*n+1,formed from values of 0,1 or -1, so a1 = ..., a2n+1 = 0 and |a(i+1) -ai| = 1 or 2, for every1 <= i <= 2n.


%check_element(e, e1) = True, if e and e1 are in [-1, 0, 1] and e != e1
%                       False, otherwise
%check_element(E: integer, E1: integer)
%(i, i), (i, o), (o, i)
check_element(E, E1):-
    member(E, [-1, 0, 1]),
    member(E1, [-1, 0, 1]),
    E =\= E1.


%generate_solution(l) = [0], if l=1
%                       e U generate_solution(l-1), otherwise
%generate_solution(N: integer, L: list)
%(i,o), (i, i)
generate_solution(1, [0]):- !.
generate_solution(N, [E|T]):-
    N1 is N - 1,
    generate_solution(N1, T),
    T = [E1|_],
    check_element(E, E1).


generate_all_solutions(N, L):-
    N1 is 2 * N + 1,
    findall(R, generate_solution(N1, R), L).


test:-
    generate_all_solutions(0, [[0]]),
    generate_all_solutions(1, [[0, -1, 0], [1, -1, 0], [-1, 1, 0], [0, 1, 0]]),
    generate_all_solutions(2, [[0, -1, 0, -1, 0], [1, -1, 0, -1, 0], [-1, 1, 0, -1, 0], [0, 1, 0, -1, 0], [0, -1, 1, -1, 0], [1, -1, 1, -1, 0], [-1, 0, 1, -1, 0], [1, 0, 1, -1, 0], [-1, 0, -1, 1, 0], [1, 0, -1, 1, 0], [-1, 1, -1, 1, 0], [0, 1, -1, 1, 0], [0, -1, 0, 1, 0], [1, -1, 0, 1, 0], [-1, 1, 0, 1, 0], [0, 1, 0, 1, 0]]).
