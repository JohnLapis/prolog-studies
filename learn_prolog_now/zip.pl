zip1([], [], []).
zip1([H1|T1], [H2|T2], [H1,H2|TX]):- zip1(T1, T2, TX).

zip2([], [], []).
zip2([H1|T1], [H2|T2], [[H1,H2]|TX]):- zip2(T1, T2, TX).

zip3([], [], []).
zip3([H1|T1], [H2|T2], [j(H1,H2)|TX]):- zip3(T1, T2, TX).
