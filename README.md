# Prolog Shortest and Longest Path Algorithm
Author: Nachiker Patel
 
Constain instructions on how how to query the prolog programs q3.pl and q4.pl.

> ## Question 3 (q3.pl)
The program for question 3 is the contents q3.pl. The program/database
represents the following relations;
1. There are two OS-linked manufacturers. Apple and Microsoft.
2. Apple makes Macbooks, iPads, and iPhones, the first two of which are computers.
3. Microsoft makes the Surface series of com-
puters, as well as the Zune music player.
4. The Macbooks come in 15 and 13 inch models and are
laptops not touchscreens. The iPad is a tablet.
5. The Surfaces are both and come in the Pro and
Go models.
6. All Apple products are compatible with one-another. Microsoft products are not.
7. The Surface Pro is compatible with an iPad, and an iPhone, the Zune is not.

The database contains the following predicates/queries.

**isa(X, Y).**

*The use case of this query is to determine if object 'X' is an 'Y'.
The first variable is the device and the secon is the type of device.
An example of this would be as follows:*

    ?- isa(macbook, Y).
    Y = laptop ;
    Y = computer ;
    false.

**compatible(X, Y).**
* The use case for query is to determine which devices are compatible with which
other devices. An example of this is shown below. The first variable is the
device and the second is a device which it is compatible with.

        ?- compatible(macbook, X).
        X = ipad ;
        X = iphone ;
        X = macbook13 ;
        X = macbook15 ;
false.

**makes(X, Y).**
* This can be used to determine which manufacturer makes which devices.
Example is provided below. The query can also be used to determine which
products are made by which manufacturer. The first variable is the manufacturer,
and the second is the device.

        ?- makes(apple, X).
        X = iphone ;
        X = ipad ;
        X = macbook ;
        X = macbook13 ;
        X = macbook15 ;
        false.

**isLaptop(X).**
* This can be used to query all the devices which are laptops.

**isTablet(X).**
* This can be used to query all the devices which are tablets.

**hasTouchScreen(X).**
* This can be used to query all the devices which have a touchscreen.

**manufacturer(X).**
* Lists the manufacturers which are in the database.


----------
> ## Question 5 (q5.pl)
This program is a shortest path graph traveral algorithm implement in prolog.
It also has the ability to compute the largest path between two vertices
without any loops. Although the longest path is not fully function and has edge
cases in which it computes the incorrect path.
The program requires a suppliment database form which to extract the vertices
and edges. The edges must be named 'road(Vertex1, Vertex2, weight)' and the
vertex must be named 'city(name)'.

* A use case for shortest path is as describes below.

        ?- isShortest(start, end, Path).
        Path = [start, .... , end]

> ## Question 6 (q6.pl)
This program computes the largest path between two vertices without any
loops. Although the longest path is not fully function and has edge cases
in which it computes the incorrect path. The program requires a suppliment
database form which to extract the vertices and edges. The edges must be
named 'road(Vertex1, Vertex2, weight)' and the vertex must be
named 'city(name)'.
* A use case of the longest path is as described below.

        ?- isLongest(start, end, Path).
        Path = [start, .... , end]


