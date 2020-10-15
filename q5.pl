%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Nachiket Patel
%
%
% This program is to computer the shortest path betwwen two vertices
% and the graph on which this works requires must have edges
% with name road(Vertex1, Vertex2, weight). The graph need not
% contain explicit clauses/facts for bi directionality. The graph
% will be treated as being undirected. The basic concept behind
% this algorithm is to find all paths from A -> B and choose the
% shortest one (the one with the smallest cost).
% There is also code ot determien the longest path between two
% vertices but there are edge cases for which it does not competely work.
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:- [map].

% Used to find if the provided element X is present in the list.
find(X, [X]).
find(X, [X|_]).
find(X, [_|T]) :-
    find(X, T).

% Used to insert an element to the end of the list, this is only used
% when the algorithm finishes the path does not include the destination
% in the list so to make the path complete append destination to the end.
insertLast([], L, L).
insertLast([H|T], L2, [H|L3]) :-
    insertLast(T, L2, L3).

% Used to remove the laste element from a list. This is used when the
% longest path is being requested, because the algorithm overshoots
% the longest path past the destination city.
removeLast([_], []).
removeLast([H, H2|T], [H|T2]) :-
    removeLast([H2|T], T2).

% Because the [map]. database consists of roads which are bidirections
% but only consists of one clause/fact going in one direction. When
% attempting to find paths in opposite direction to the way the
% roads in the datbase are described, it cannot find a path unless
% both ways are checked.
% This allows the program to see the roads as going both ways
% from Start --> End and End --> Start with a cose of Cost
edge(Start, End, Cost) :-
    (   road(Start, End, Cost)
    ;   road(End, Start, Cost)
    ).
% This provides a wrapper around the vertex whicn in this case is
% a city. And any database bing used must also have vertices named
% 'city'
vertex(X) :-
    city(X).

% The base case is where a new search for a path is started, this is used
% to find all possible paths. Start and End are known parameters.
% pathFinder(Path, Cost, Start, End) :-
pathFinder(Start, End, Path, Cost) :-
    pathFinder(Start, End, Cost, Path, []).

% This case is used to check if a edge is already in the path
% then it does not get readded to the path and create loops.
% Cut operation cannot be used for path which are adjacent because
% there is no guarantee adjacent vertices have the lowest cost.
pathFinder(Start, End, Cost, [Start], Discovered) :-
    \+ find(Start, Discovered),
    edge(Start, End, Cost).

% Performs the recursive search from the Start edge to another until
% it reaches a point where it has fond its destination. The Discovered
% list keeps track of the vertices discovered along the current path traversal.
% If the start edge is not in the Discovered list then an adjacent edge
% is located and used to find the next edge from it.
pathFinder(Start, End, Cost, [Start|T], Discovered) :-
    \+ find(Start, Discovered),
    edge(Start, InterMediateCity, RoadCost),
    pathFinder(InterMediateCity, End, SubPathCost, T, [Start|Discovered]),
    \+ find(Start, T),
    Cost is RoadCost+SubPathCost.

% This acts as the 'function' which first calculates a path from the Start
% to the End, and then proceds to check all other possible paths to see
% if there are any other paths which have a smaller cost. Because of the
% way the algorithm recurses the destination element does not get added
% to the Path so it is manually added to the end of the list.
isShortest(Start, End, CompletePath) :-
    pathFinder(Start, End, Path, Cost),
    \+ ( pathFinder(Start, End, AltPath, AltCost),
         AltPath\=Path,
         AltCost<Cost
       ),
    insertLast(Path, [End], CompletePath).

% This is an attempt to discover the longest path using the same algorithm,
% but it works for most cases but I have discovered edge cases where it does
% work.
isLongest(Start, End, CompletePath) :-
    vertex(Start),
    vertex(End),
    pathFinder(Start, End, Path, Cost),
    \+ ( pathFinder(Start, End, AltPath, AltCost),
         AltPath\=Path,
         AltCost>Cost
       ),
    removeLast(Path, CompletePath).


