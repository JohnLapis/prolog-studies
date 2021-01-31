%% That is, this knowledge base holds facts about towns it is possible to travel
%% between by taking a direct train. But of course, we can travel further by
%% chaining together direct train journeys. Write a recursive predicate
%% travel_from_to/2 that tells us when we can travel by train between two towns.
%% For example, when given the query

direct_train(saarbruecken,dudweiler).
direct_train(forbach,saarbruecken).
direct_train(freyming,forbach).
direct_train(stAvold,freyming).
direct_train(fahlquemont,stAvold).
direct_train(metz,fahlquemont).
direct_train(nancy,metz).

travel_from_to(P1, P2) :- direct_train(P1, P2).
travel_from_to(P1, P2) :- direct_train(P3, P2),
                        travel_from_to(P1, P3).
