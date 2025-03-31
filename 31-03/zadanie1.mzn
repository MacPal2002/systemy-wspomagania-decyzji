include "alldifferent.mzn";

int: n = 8;  % Rozmiar szachownicy
array[1..n] of var 1..n: queens;

constraint alldifferent(queens);
constraint forall(i, j in 1..n where i < j)(
    abs(queens[i] - queens[j]) != abs(i - j)
);

solve satisfy;

% Poprawione formatowanie wyjścia
output [ 
  if j == 1 then "\n" else "" endif ++
  if fix(queens[i]) == j then "H " else ". " endif
  | i in 1..n, j in 1..n 
];