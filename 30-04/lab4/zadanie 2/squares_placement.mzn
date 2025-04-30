include "globals.mzn";

include "squares_placement.dzn"; % Wczytanie danych wejściowych (n)

% --- Parametry i Dane ---

int: n; % Liczba kwadratów (z pliku .dzn)
set of int: SQUARES = 1..n;
array[SQUARES] of int: s = [i | i in SQUARES]; % Rozmiary boków kwadratów (1..n)

% Oszacowanie górnego ograniczenia dla wymiarów kontenera
int: sum_sides = sum(i in SQUARES)(s[i]);
int: max_dim = sum_sides + n; % Dodajmy mały margines, np. 21 + 6 = 27

% --- Zmienne Decyzyjne ---

% Wymiary prostokątnego kontenera
var 0..max_dim: width;
var 0..max_dim: height;

% Pozycja lewego dolnego rogu każdego kwadratu
array[SQUARES] of var 0..max_dim: x; % Współrzędna x
array[SQUARES] of var 0..max_dim: y; % Współrzędna y


% --- Cel Optymalizacji ---
var 0..max_dim*max_dim: obj = width * height;
solve minimize obj;


% --- Podstawowe Ograniczenia ---

% 1. Każdy kwadrat musi zmieścić się w kontenerze
constraint forall(i in SQUARES) (
    x[i] + s[i] <= width /\
    y[i] + s[i] <= height
);

% 2. Żadne dwa kwadraty nie mogą się nakładać (używamy wbudowanego diffn)
constraint diffn(x, y, s, s);


% 3. Ograniczenia Cumulative dla lepszej propagacji (używamy wbudowanego cumulative)
constraint cumulative(x, s, s, height);
constraint cumulative(y, s, s, width);

% Ograniczenie: Umieść najmniejszy kwadrat (1x1) w rogu (0,0)
constraint x[1] = 0;
constraint y[1] = 0;

% Ograniczenie: Wymuś orientację kontenera (szerokość <= wysokość)
constraint width <= height;



% --- Wyjście ---

output [
    "Optimal solution found with area: \(obj)\n",
    "Width: \(width), Height: \(height)\n",
    "Square placements (x, y):\n"
] ++
[
    "  Square \(i) (size \(s[i])): at (\(x[i]), \(y[i]))\n" | i in SQUARES
];