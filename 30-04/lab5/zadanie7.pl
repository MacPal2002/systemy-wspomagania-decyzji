%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plik: rekurencja.pl
%
% Zawiera rekurencyjne definicje dla:
% - Silnia (factorial)
% - Ciag Fibonacciego (Fibonacci sequence)

% --- Silnia ---

% silnia(N, Wynik)
% Predykat jest prawdziwy, jesli Wynik jest silnia liczby N.
% N musi byc liczba calkowita nieujemna.

% Przypadek bazowy: silnia z 0 to 1.
silnia(0, 1).

% Krok rekurencyjny: silnia z N (gdzie N > 0) to N * silnia(N-1).
silnia(N, Wynik) :-
    N > 0,                  % Warunek: N musi byc wieksze od 0
    N1 is N - 1,            % Oblicz N-1
    silnia(N1, WynikN1),    % Rekurencyjnie oblicz silnie dla N-1 -> WynikN1
    Wynik is N * WynikN1.   % Wynik koncowy to N pomnozone przez WynikN1


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Ciag Fibonacciego ---

% fibonacci(N, Wynik)
% Predykat jest prawdziwy, jesli Wynik jest N-tym wyrazem
% ciagu Fibonacciego (indeksowanym od 0).
% N musi byc liczba calkowita nieujemna.
% Jest to naiwna implementacja rekurencyjna.

% Przypadki bazowe:
fibonacci(0, 0). % Zerowy wyraz ciagu to 0
fibonacci(1, 1). % Pierwszy wyraz ciagu to 1

% Krok rekurencyjny: F(N) = F(N-1) + F(N-2) dla N > 1
fibonacci(N, Wynik) :-
    N > 1,                  % Warunek: N musi byc wieksze od 1
    N1 is N - 1,            % Oblicz N-1
    N2 is N - 2,            % Oblicz N-2
    fibonacci(N1, WynikN1), % Rekurencyjnie oblicz F(N-1) -> WynikN1
    fibonacci(N2, WynikN2), % Rekurencyjnie oblicz F(N-2) -> WynikN2
    Wynik is WynikN1 + WynikN2. % Wynik koncowy to suma poprzednich dwóch
