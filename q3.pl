%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Nachiket Patel
% The instruction for use case of this file are defined in the README
% file provided with this program.
%
% This program degines the following relationships.
% There are two OS-linked manufacturers. Apple and Microsoft. Apple makes
% Macbooks, iPads, and iPhones, the first two of which are computers.
% Microsoft makes the Surface series of computers, as well as the Zune
% music player. The Macbooks come in 15 and 13 inch models and are laptops
% not touchscreens. The iPad is a tablet. The Surfaces are both and come
% in the Pro and Go models. All Apple products are compatible with
% one-another. Microsoft products are not. The Surface Pro is compatible
% with an iPad, and an iPhone, the Zune is not.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Contains the relation between the manufacturere and the products they make
manufactures(microsoft, [surface, surfaceGo, surfacePro, zune]).
manufactures(apple, [iphone, ipad, macbook, macbook13, macbook15]).

% Defines the types of decives
typesOfDevices([laptop, tablet, touchscreen]).
% used to quantify that laptops are computers
are(laptop, computer).

% lists all the types of devices, including the fact that laptops and
% tablets classify as devices. The devices have been assigned attributes
% if it is a laptop, tablet, and if its a touchscreen device.
device(laptop).
device(tablet).
device(laptop, [macbook, macbook13, macbook15, surface, surfaceGo, surfacePro]).
device(tablet, [ipad, surface, surfaceGo, surfacePro]).
device(touchscreen, [ipad, iphone, surface, surfaceGo, surfacePro]).

% This list is used to list all devices which are compatible with each other.
allCompatible([ipad, iphone, macbook, macbook13, macbook15]).

% The specific compatibilities between surfacePro and
% iphone and ipad deices.
compatible(ipad, surfacePro).
compatible(iphone, surfacePro).
compatible(surfacePro, ipad).
compatible(surfacePro, iphone).

% This clause is responsible for showing the all compatibility
% of apple devices with each other. Any other deive added to
% the list allCompatible list can easily be shown to have
% compatibility with all other devices in that list.
compatible(X, Y) :-
    allCompatible(K),
    getElements(A, K),
    getElements(B, K),
    A\=B,
    X=A,
    Y=B.

% defines the relationship that defines the manufacturers
% being os-linked manufacturers.
isa(apple, 'os-linked manufacturer').
isa(microsoft, 'os-linked manufacturer').
% Edge case where ipads are also computers.
isa(ipad, computer).
% This clause is responsible for providing relations
% between specific devices and types of devices.
isa(X, Y) :-
    typesOfDevices(T),
    findDevice(Y, T),
    device(Y, L),
    getElements(X, L).

% This clause takes care of the case where
% laptops are also computers.
isa(X, Y) :-
    are(K, Y),
    isa(X, K).

% This clause defines which manufacturer makes which devices.
makes(X, Y) :-
    manufactures(X, L),
    getElements(Y, L).

% This clause is used to iterate a list and get each element
% oen at a time.
getElements(X, [X|_]).
getElements(X, [_|T]) :-
    getElements(X, T).

% Used to list all the devices which are laptops as a list.
laptops(X) :-
    device(laptop, X).
% Used to list all the devices which are tablets as a list.
tablets(X) :-
    device(tablet, X).
% Used to list all the devices which are laptops 1 at a time.
isLaptop(X) :-
    device(laptop, L),
    findDevice(X, L).
% Used to list all the devices which are tablets 1 at a time.
isTablet(X) :-
    device(tablet, L),
    findDevice(X, L).
% Used to list all the devices which have a touchscreen 1 at a time.
hasTouchscreen(X) :-
    isTablet(X).

% This clause is used to locate an element within a list, used by
% the clause 'isa' to find all devices.
findDevice(Y, [Y]) :- !.
findDevice(Y, [Y|_]).
findDevice(Y, [_|T]) :-
    findDevice(Y, T).
