%% Exercise 5.3 Write a predicate addone/2 whose first argument is a list of
%% integers, and whose second argument is the list of integers obtained by
%% adding 1 to each integer in the first list


add_one(X, Y):- Y is X+1.

map(Func, [H|T], [H_Result|T_Result]):-
    call(Func, H, H_Result),
    map(Func, T, T_Result).
map(_, [], []).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sum_list([H|T], Result):-
    sum_list(T, Sum),
    Result is H + Sum.
sum_list([], Result):- Result is 0.

mult(X, Y, P):- P is X * Y.

map2(Func, [H1|T1], [H2|T2], [H_Result|T_Result]):-
    call(Func, H1, H2, H_Result),
    map2(Func, T1, T2, T_Result).
map2(_, [], [], []).


dot_product(Vector1, Vector2, Result):-
    map2(mult, Vector1, Vector2, Products),
    sum_list(Products, Result).
