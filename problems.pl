% I'm working through P-99 Ninety-Nine Prolog Problems
% http://www.ic.unicamp.br/~meidanis/courses/mc336/2009s2/prolog/problemas/
% author: Bryan Oswald

% Find the last element of a list
% islast(X,Y) :- 
islast(X, [X]).		% islist(Y) ^ onlyElement(x, y)
islast(X, [_|Tl]) :- 	% isList(Y) ^ isTail(Tl, Y) ^ islast(X, Tl)
	islast(X, Tl).

% Find the last but one (second to last) element of a list
% penultimate(X, Y) :-
penultimate(X, [X,_]).		% isList(Y) ^ firstElemnt(X, Y) ^ len(Y, 2)
penultimate(X, [_|Tl]) :- 	% isList(Y) ^ isTail(Tl, Y) ^ penultimate(X, Tl)
	penultimate(X, Tl).

% Find the K'th elemnt of a list
% atindex(X, Y, Z) :-
atindex(1, E, [E|_]).		% isList(Z) ^ firstElement(E, Z) ^ equals(X, 1)
atindex(I, Y, [_|Tl]) :- 	% isList(Z) ^ isTail(Tl, Z) ^ atIndex(I1, Y, Tl) ^ equlas(I-1, I1)
	I > 1,
	I1 is I - 1,
	atindex(I1, Y, Tl).


% Find the number of elements of a list
% len(X, Y) :-
len(0, []).			% isList(Y) ^ isEmpty(Y)
len(X, [_|Tl]) :- 	% isList(Y) ^ isTail(Tl, Y) ^ len(X1, Tl) ^ equals(X, X1 + 1)
	len(X1, Tl),
	 X is X1 + 1.


% Reverse a list
% reverse(X, Y) :-
reverse(X, Y) :- 			% reverse(X, Y, Z) implicity adds a second definition of the function. If there are three parameters, it is handled by this subfunction. If the subfunction is true, the whole thing is true
	reverse(X, Y, []).
reverse([], Y, Y).			% isList(X) ^ isEmpty(X) ^ equals(Y, Z)
reverse([H|Tl], Y, Z) :- 	% head(H, X) ^ tail(Tl, X) ^ reverse(Tl, Y, [H|Z])
	reverse(Tl, Y, [H|Z]).


% Find out whether a list is a palindrome
% X is a palindrome of Y
% ispalindrome(X, Y) :-
ispalindrome(X,Y) :- 	% reverse(X,Y)
	reverse(X, Y).


flatten(X, [X]) :- \+ is_list(X).	% \+ isList(X) (it cannot be proven that) ^ isList(Y) ^ onlyElement(X, Y)
flatten([], []).					% empty(X) ^ empty(Y)
flatten([H|Tl], Z) :- 				% 
	flatten(H, Y),
	flatten(Tl, Acc),
	append(Y, Acc, Z).

compress([], []).
compress([X,X|Tl], Acc) :-
	compress([X|Tl], Acc).
compress([X|Tl], [X|Acc]) :-
	compress(Tl, Acc).


% Pack consecutive duplicates of list elements into sublists
% pack(X, Y) :-
pack([], []).
pack([X,Y|Tl], Z) :-
	X \= Y,
	pack([Y|Tl], [X|Z]).
pack([X|Xs], [Z|Zs]) :-
	transfer(X, Xs, Y, Z),
	pack(Y, Zs).
transfer(X, [], [], [X]).
transfer(X, [Y|Ys], [Y|Ys],[X]) :- X \= Y.
transfer(X, [X|Xs], Y, [X|Acc]) :- transfer(X, Xs, Y, Acc).





