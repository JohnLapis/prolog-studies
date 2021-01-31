%% Write a predicate travel/2 which determines whether it is possible to travel
%% from one place to another by chaining together car, train, and plane
%% journeys. For example, your program should answer yes to the query
%% travel(valmont,raglan) .

by_car(auckland,hamilton).
by_car(hamilton,raglan).
by_car(valmont,saarbruecken).
by_car(valmont,metz).

by_train(metz,frankfurt).
by_train(saarbruecken,frankfurt).
by_train(metz,paris).
by_train(saarbruecken,paris).

by_plane(frankfurt,bangkok).
by_plane(frankfurt,singapore).
by_plane(paris,losAngeles).
by_plane(bangkok,auckland).
by_plane(singapore,auckland).
by_plane(losAngeles,auckland).

travel_directly(From, To):- by_car(From, To); by_train(From, To); by_plane(From, To).
travel(From, To):- travelDirectly(From, To).
travel(From, To):- travelDirectly(From, Middle),
                   travel(Middle, To).

%% Write a predicate travel/3 which tells you which route to take when
%% travelling from one place to another. For example, the program should respond:
%% X  =  go(valmont,metz,
%%          go(metz,paris,
%%             go(paris,losAngeles)))
%%       to the query travel(valmont,losAngeles,X) .

travel(From, To, Route):-
    travelDirectly(From, To),
    Route = go(From, To).
travel(From, To, Route):-
    travelDirectly(From, Middle),
    travel(Middle, To, MiddleRoute),
    Route = go(From, Middle, MiddleRoute).

%% Extend the predicate travel/3 so that it not only tells you the route to take
%% to get from one place to another, but also how you have to travel. That is,
%% the new program should let us know, for each stage of the voyage, whether we
%% need to travel by car, train, or plane.

travel_directly(From, To, Transp):-
    (
        by_car(From, To),
        Transp = by_car
    );
    (
        by_train(From, To),
        Transp = by_train
    );
    (
        by_plane(From, To),
        Transp = by_plane
    ).

ext_travel(From, To, Route):-
    travelDirectly(From, To, Transp),
    Route = go(Transp, From, To).
ext_travel(From, To, Route):-
    travelDirectly(From, Middle, Transp),
    ext_travel(Middle, To, MiddleRoute),
    Route = go(Transp, From, Middle, MiddleRoute).
