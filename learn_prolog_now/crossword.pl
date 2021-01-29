word(astante,  a,s,t,a,n,t,e).
word(astoria,  a,s,t,o,r,i,a).
word(baratto,  b,a,r,a,t,t,o).
word(cobalto,  c,o,b,a,l,t,o).
word(pistola,  p,i,s,t,o,l,a).
word(statale,  s,t,a,t,a,l,e).

crossword(word(V1_word, V1_1, V1_2, V1_3, V1_4, V1_5, V1_6, V1_7),
          word(V2_word, V2_1, V2_2, V2_3, V2_4, V2_5, V2_6, V2_7),
          word(V3_word, V3_1, V3_2, V3_3, V3_4, V3_5, V3_6, V3_7),
          word(H1_word, H1_1, H1_2, H1_3, H1_4, H1_5, H1_6, H1_7),
          word(H2_word, H2_1, H2_2, H2_3, H2_4, H2_5, H2_6, H2_7),
          word(H3_word, H3_1, H3_2, H3_3, H3_4, H3_5, H3_6, H3_7)):-
    V1_2 = H1_2,
    V1_4 = H2_2,
    V1_6 = H3_2,

    V2_2 = H1_4,
    V2_4 = H2_4,
    V2_6 = H3_4,

    V3_2 = H1_6,
    V3_4 = H2_6,
    V3_6 = H3_6.
