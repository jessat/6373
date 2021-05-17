% Write a program that finds the maximum of a simple list of numbers.
maxnum([X], X).
maxnum([X|XS], Max) :- 
    maxnum(XS, Max), Max >= X.
maxnum([X|XS], X) :- 
    maxnum(XS, Max), Max < X.

% Write a program that succeeds if the intersection of two given list parameters is empty.
intersectbool([], _).
intersectbool([X|XS], Y) :- 
    member(X, Y) -> intersectbool(0,0);
    intersectbool(XS, Y).


% Write a program that returns a list containing the union of the elements of two given lists. 
% Assume the list represents sets (i.e. unique elements) and the union returns unique elements.
union([], X, X).
union([X|XS], Y, Z) :- 
    member(X, Y), union(XS, Y, Z).
union([X|XS], Y, [X|ZS]) :- 
    union(XS, Y, ZS).


% Write a program that returns the final element of a list
finalelement([X], X).
finalelement([_|X], Y) :- 
	finalelement(X, Y). 
