%% Exercise 4.3 Write a predicate second(X,List) which checks whether X is the
%% second element of List .

second(X, [_,Second|_]):- X = Second.

%% Exercise 4.4 Write a predicate swap12(List1,List2) which checks whether List1
%% is identical to List2 , except that the first two elements are exchanged.

swap_first_two([First, Second|T], [Second, First|T]).

%% Exercise 4.5 Suppose we are given a knowledge base with the following facts:

ger_eng_trans(eins,one).
ger_eng_trans(zwei,two).
ger_eng_trans(drei,three).
ger_eng_trans(vier,four).
ger_eng_trans(fuenf,five).
ger_eng_trans(sechs,six).
ger_eng_trans(sieben,seven).
ger_eng_trans(acht,eight).
ger_eng_trans(neun,nine).

/* Write a predicate listtran(G,E) which translates a list of German number
   words to the corresponding list of English number words. For example:
      listtran([eins,neun,zwei],X).
   should give:
      X  =  [one,nine,two].
   Your program should also work in the other direction. For example, if you
   give it the query
      listtran(X,[one,seven,six,two]).
   it should return:
      X  =  [eins,sieben,sechs,zwei].
*/

translate_german_and_english([], []).
translate_german_and_english([H_German|T_German], [H_English|T_English]):-
    ger_eng_trans(H_German, H_English),
    translate_german_and_english(T_German, T_English).


%% Exercise 4.6 Write a predicate twice(In,Out) whose left argument is a list,
%% and whose right argument is a list consisting of every element in the left
%% list written twice. For example, the query
%%    twice([a,4,buggle],X).
%% should return
%%    X  =  [a,a,4,4,buggle,buggle]).
%% And the query
%%    twice([1,2,1,1],X).
%% should return
%%    X  =  [1,1,2,2,1,1,1,1].

twice([], []).
twice([H|T1], [H,H|T2]):- twice(T1, T2).
