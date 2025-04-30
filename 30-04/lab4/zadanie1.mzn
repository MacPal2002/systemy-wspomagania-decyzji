include "globals.mzn";

% --- Parametry ---

int: N = 16; % Rozmiar planszy i liczba hetmanów

% --- Zmienne Decyzyjne ---

% rows[c] przechowuje numer wiersza (1..N), w którym znajduje się hetman w kolumnie c (1..N)
array[1..N] of var 1..N: rows;

% --- Podstawowe Ograniczenia Problemu N Hetmanów ---

% 1. Żadne dwa hetmany nie mogą być w tym samym wierszu
constraint alldifferent(rows);

% 2. Żadne dwa hetmany nie mogą być na tej samej głównej przekątnej
% Dla hetmanów w (c1, rows[c1]) i (c2, rows[c2]), warunek ataku to:
% rows[c1] - c1 = rows[c2] - c2
% Wymuszamy, aby wszystkie wartości (rows[c] - c) były różne.
constraint alldifferent([rows[c] - c | c in 1..N]);

% 3. Żadne dwa hetmany nie mogą być na tej samej anty-przekątnej
% Dla hetmanów w (c1, rows[c1]) i (c2, rows[c2]), warunek ataku to:
% rows[c1] + c1 = rows[c2] + c2
% Wymuszamy, aby wszystkie wartości (rows[c] + c) były różne.
constraint alldifferent([rows[c] + c | c in 1..N]);

% --- Dodatkowe Ograniczenia (Zawężające Przestrzeń Poszukiwań) ---

% Ograniczenie 1: Wymuszenie, aby hetman w pierwszej kolumnie znajdował się
% w górnej połowie planszy (wiersze 1 do N/2).
% Łamie to symetrię pionową i redukuje przestrzeń poszukiwań o połowę.
constraint rows[1] <= N div 2; % Dla N=16, to jest rows[1] <= 8

% Ograniczenie 2: Zakaz umieszczania hetmana na konkretnym polu,
% które nie jest niezbędne dla istnienia rozwiązania.
% Przykład: Zakaz umieszczania hetmana w kolumnie 2 na wierszu 2.
constraint rows[2] != 2;

% --- Rozwiązanie i Wyjście ---

% Znajdź jedno dowolne rozwiązanie spełniające ograniczenia
solve satisfy;

% Wypisz rozwiązanie
output ["Rozwiązanie dla N = \(N):\n"];
output ["Pozycje hetmanów (wiersz dla każdej kolumny): rows = \(rows)\n\n"];

% Opcjonalnie: Wypisz planszę w bardziej wizualny sposób
output ["Plansza:\n"];
output [ if fix(rows[c]) == r then " Q" else " ." endif ++
         if c == N then "\n" else "" endif
       | r in 1..N, c in 1..N ];