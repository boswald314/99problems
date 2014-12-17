
% X is the last element of Y
% islast(X,Y) :- 
islast(X, [X]).		% islist(Y) ^ onlyElement(x, y)
islast(X, [_|Tl]) :- 	% isList(Y) ^ isTail(Tl, Y) ^ islast(X, Tl)
	islast(X, Tl).

% X is second to last elemnet of Y
% penultimate(X, Y) :-
penultimate(X, [X,_]).		% isList(Y) ^ firstElemnt(X, Y) ^ len(Y, 2)
penultimate(X, [_|Tl]) :- 	% isList(Y) ^ isTail(Tl, Y) ^ penultimate(X, Tl)
	penultimate(X, Tl).

% Y is at index X in Z
% atindex(X, Y, Z) :-
atindex(1, E, [E|_]).
atindex(I, Y, [_|Tl]) :- 
	I > 1,
	I1 is I - 1,
	atindex(I1, Y, Tl).

len(0, []).
len(X, [_|Tl]) :- len(X1, Tl), X is X1 + 1.

reverse(X, Y) :- reverse(X, Y, []).
reverse([], Y, Y).
reverse([H|Tl], Y, X) :- reverse(Tl, Y, [H|X]).

ispalindrome(X,Y) :- reverse(X, Y).

flatten(X, [X]) :- \+ is_list(X).	% is X a list? No? Put X in a list
flatten([], []).					% an empty list is a flat list
flatten([X|Tl], Z) :- 				% If you've got a list, flatten the elements and put them in a list
	flatten(X, Y),
	flatten(Tl, Acc),
	append(Y, Acc, Z).

removeduplicates([], []).
removeduplicates([X,X|Tl], Acc) :-
	removeduplicates([X|Tl], Acc).
removeduplicates([X|Tl], [X|Acc]) :-
	removeduplicates(Tl, Acc).



