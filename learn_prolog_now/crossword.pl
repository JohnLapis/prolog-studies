/*
  Grid:
          V1       V2      V3
         ┏━━━┓   ┏━━━┓   ┏━━━┓
         ┃   ┃   ┃   ┃   ┃   ┃
     ┏━━━┫━━━┣━━━┫━━━┣━━━┫━━━┣━━━┓
  H1 ┃   ┃   ┃   ┃   ┃   ┃   ┃   ┃
     ┗━━━┫━━━┣━━━┫━━━┣━━━┫━━━┣━━━┛
         ┃   ┃   ┃   ┃   ┃   ┃
     ┏━━━┫━━━┣━━━┫━━━┣━━━┫━━━┣━━━┓
  H2 ┃   ┃   ┃   ┃   ┃   ┃   ┃   ┃
     ┗━━━┫━━━┣━━━┫━━━┣━━━┫━━━┣━━━┛
         ┃   ┃   ┃   ┃   ┃   ┃
     ┏━━━┫━━━┣━━━┫━━━┣━━━┫━━━┣━━━┓
  H3 ┃   ┃   ┃   ┃   ┃   ┃   ┃   ┃
     ┗━━━┫━━━┣━━━┫━━━┣━━━┫━━━┣━━━┛
         ┃   ┃   ┃   ┃   ┃   ┃
         ┗━━━┛   ┗━━━┛   ┗━━━┛

  Write a predicate crossword/6 that tells us how to fill in the grid. The
  first three arguments should be the vertical words from left to right, and
  the last three arguments the horizontal words from top to bottom.
*/

word(astante,  a,s,t,a,n,t,e).
word(astoria,  a,s,t,o,r,i,a).
word(baratto,  b,a,r,a,t,t,o).
word(cobalto,  c,o,b,a,l,t,o).
word(pistola,  p,i,s,t,o,l,a).
word(statale,  s,t,a,t,a,l,e).


unique([]).
unique([X|Xs]):- not(member(X,Xs)), unique(Xs).

crossword(V1_word, V2_word, V3_word, H1_word, H2_word, H3_word):-
    word(V1_word, _, V1_2, _, V1_4, _, V1_6, _),
    word(V2_word, _, V2_2, _, V2_4, _, V2_6, _),
    word(V3_word, _, V3_2, _, V3_4, _, V3_6, _),
    word(H1_word, _, H1_2, _, H1_4, _, H1_6, _),
    word(H2_word, _, H2_2, _, H2_4, _, H2_6, _),
    word(H3_word, _, H3_2, _, H3_4, _, H3_6, _),

    unique([V1_word, V2_word, V3_word, H1_word, H2_word, H3_word]),

    V1_2 = H1_2,
    V1_4 = H2_2,
    V1_6 = H3_2,

    V2_2 = H1_4,
    V2_4 = H2_4,
    V2_6 = H3_4,

    V3_2 = H1_6,
    V3_4 = H2_6,
    V3_6 = H3_6.
