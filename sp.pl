:- (dynamic road/3).

:- [map].

vertex(Start, End, Cost) :-
    (   road(Start, End, Cost)
    ;   road(End, Start, Cost)
    ).

newVertex(S, F, C) :-
    assertz(road(S, F, C)).

vertexExists(S, F, I) :-
    (   \+ vertex(S, F, _),
        city(F)
    ->  vertex(F, I, CFI),
        vertex(I, S, CIS),
        CFS is CFI+CIS,
        newVertex(F, S, CFS)
    ).

vertexR(S, F, C) :-
    vertex(S, F, C).

vertexR(S, F, C) :-
    (   vertex(S, A, _),
        vertexR(A, F, _)
    ->  vertexExists(S, F, A),
        vertexR(S, F, C)
    ).

printPath(S) :-
    vertex(S, F, C),
    write(S),
    write(','),
    write(F),
    write(:),
    write(C).
    

% vertexR(S, F, C) :-
%     vertex(S, A, CSA),
%     vertexR(A, F, CAF),
%     C is CSA+CAF.
shortest(X, Y, C) :-
    vertexR(X, Y, C).


    