include "alldifferent.mzn";

% Parametry wejściowe
int: nodesNumber; % Liczba wierzchołków
array[1..nodesNumber, 1..nodesNumber] of bool: edges; % Macierz sąsiedztwa

% Zmienne decyzyjne
array[1..nodesNumber] of var 1..nodesNumber: color; % Kolory wierzchołków
var 1..nodesNumber: colorsNumber; % Liczba użytych kolorów

% Ograniczenia
constraint colorsNumber = max(color); % Liczba kolorów to maksymalny użyty kolor

% Ograniczenie poprawnego kolorowania
constraint forall(i, j in 1..nodesNumber where edges[i,j]) (
    color[i] != color[j]
);

% Minimalizacja liczby kolorów
solve minimize colorsNumber;

% Wynik
output [
    show(colorsNumber) ++ " colors needed\n",
    "\nVertex coloring:\n" ++
    concat([show(i) ++ ": " ++ show(color[i]) ++ "\n" | i in 1..nodesNumber]),
    
    "\nGraph edges:\n" ++
    concat([if edges[i,j] then show(i) ++ " -- " ++ show(j) ++ "\n" else "" endif 
           | i,j in 1..nodesNumber where i < j])
];