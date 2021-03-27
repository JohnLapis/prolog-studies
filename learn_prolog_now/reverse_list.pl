rotate_by_without_optimization(L1, Count, L1):- 0 =:= Count, !.
rotate_by_without_optimization(L1, Count, RotatedList):-
    Count > 0,
    RealCount is Count - 1,
    [H|T] = L1,
    rotate_by_without_optimization(T, RealCount, NewRotatedList),
    append(NewRotatedList, [H], RotatedList),
    !.

rotate_by(L1, Count, L1):-
    length(L1, Length),
    0 =:= Count mod Length,
    !.
rotate_by(L1, Count, RotatedList):-
    Count > 0,
    length(L1, Length),
    RealCount is Count mod Length,
    rotate_by_without_optimization(L1, RealCount, RotatedList),
    !.

reverse([], []).
reverse(L1, L2):-
    length(L1, Length),
    Count is Length - 1,
    rotate_by(L2, Count, RotatedList),
    L1 = RotatedList.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

acc_reverse([H|T], Acc, L2):- acc_reverse(T, [H|Acc], L2).
acc_reverse([], L, L).

reverse2(L1, L2):- acc_reverse(L1, [], L2).
