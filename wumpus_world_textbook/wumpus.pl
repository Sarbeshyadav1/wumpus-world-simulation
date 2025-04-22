% ----- Wumpus World  (Based on Textbook) -----

pit(3,1).
pit(3,3).
pit(4,3).

wumpus(1,3).

gold(2,3).

adjacent(X,Y,X1,Y) :- X1 is X+1, X1 =< 4.
adjacent(X,Y,X1,Y) :- X1 is X-1, X1 >= 1.
adjacent(X,Y,X,Y1) :- Y1 is Y+1, Y1 =< 4.
adjacent(X,Y,X,Y1) :- Y1 is Y-1, Y1 >= 1.

breeze(X,Y) :- adjacent(X,Y,X1,Y1), pit(X1,Y1).
stench(X,Y) :- adjacent(X,Y,X1,Y1), wumpus(X1,Y1).
glitter(X,Y) :- gold(X,Y).


:- dynamic visited/2.

agent_start(1,1).


move(X,Y,NX,NY) :-
    adjacent(X,Y,NX,NY),
    \+ pit(NX,NY),
    \+ wumpus(NX,NY),
    \+ visited(NX,NY),
    assertz(visited(NX,NY)).


% ----- current location
show_percepts(X,Y) :-
    (breeze(X,Y) -> write(' Breeze detected. '); true),
    (stench(X,Y) -> write(' Stench detected. '); true),
    (glitter(X,Y) -> write(' Glitter detected (Gold is here!).'); true), nl.


%--- Recursive Search
search(X,Y) :-
    format('Agent at (~w,~w)~n', [X,Y]),
    show_percepts(X,Y),
    glitter(X,Y),
    write(' Gold found at ('), write(X), write(','), write(Y), write(')!'), nl,
    write(' Returning safely...'), nl.

search(X,Y) :-
    format('Agent at (~w,~w)~n', [X,Y]),
    show_percepts(X,Y),
    move(X,Y,NX,NY),
    search(NX,NY).


start :-
    retractall(visited(_, _)),       
    agent_start(X,Y),
    assertz(visited(X,Y)),
    format(' Agent starting at (~w,~w)~n', [X,Y]),
    show_percepts(X,Y),
    search(X,Y).

