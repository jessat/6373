% Using the structures parent(X,Y), male(X), and female(X), write a structure that defines mother(X, Y). 

% define the mother
mother(X,Y) :- parent(X,Y), female(X).

% inputs to test mother function
parent(mom,jessie).
parent(dad,jessie).
male(dad).
female(mom).
female(jessie).



% Using the structures parent(X, Y), male(X), and female(X), write a structure that defines sister(X, Y).

% define the sibling
sibling(X,Y) :- parent(P,X), parent(P,Y), not(X=Y).

% input to test sister function
sibling(jessie,chuck).

% define the sister
sister(X,Y) :- sibling(X,Y), female(X).




% ?- mother(mom,jessie).    --> will return true
% ?- mother(dad,jessie).    --> will return false
% ?- sister(jessie,chuck).  --> will return true
