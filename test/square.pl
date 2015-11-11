% Calc X^N
square(X, 1, V) :- V is X.
square(X, N, V) :- M is N-1, square(X, M, W), V is X*W.
