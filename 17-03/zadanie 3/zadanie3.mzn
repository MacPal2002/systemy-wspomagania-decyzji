% Wczytanie danych z pliku
include "dane.dzn";

int: n;  % Liczba posiłków
array[1..n] of int: prices;  % Ceny posiłków
int: target;  % Budżet
array[1..n] of var 0..target div min(prices): counts;  % Liczba zamówionych posiłków
array[1..n] of string: meal_names; % Dodajemy tablicę z nazwami posiłków

constraint sum(i in 1..n)(prices[i] * counts[i]) = target;  % Warunek sumy kosztów

solve satisfy;

output [ meal_names[i] ++ ": " ++ show(counts[i]) ++ "\n" | i in 1..n ];