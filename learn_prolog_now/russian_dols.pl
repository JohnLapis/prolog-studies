%% First, write a knowledge base using the predicate directly_in/2 which encodes
%% which doll is directly contained in which other doll. Then, define a
%% recursive predicate in/2 , that tells us which doll is (directly or
%% indirectly) contained in which other dolls. For example, the query
%% in(katarina,natasha) should evaluate to true, while in(olga, katarina) should
%% fail.

directly_in(katarina, olga).
directly_in(olga, natasha).
directly_in(natasha, irina).
directly_in(irin,a).

in(Doll1, Doll2):- directly_in(Doll1, Doll2).
in(Doll1, Doll2):- directly_in(Doll3, Doll2),
                   in(Doll1, Doll3).


:- begin_tests(in).

test('succeess given valid input') :-
    in(katarina,natasha).

test('fails given invalid input', fail) :-
    in(olga,  katarina).

:- end_tests(in).
