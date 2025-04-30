% kwadrat(A, B, C, Roots)
% Oblicza rzeczywiste pierwiastki równania A*x^2 + B*x + C = 0.
% Roots jest lista pierwiastków: [] (brak), [X0] (jeden), [X1, X2] (dwa).
% Zaklada, ze A =\= 0 (równanie jest kwadratowe).

kwadrat(A, B, C, Roots) :-
    delta(A, B, C, Delta),       % Najpierw obliczamy delte
    (   Delta < 0                % Przypadek 1: Delta ujemna
    ->  Roots = []               % Brak pierwiastków rzeczywistych
    ;   Delta =:= 0              % Przypadek 2: Delta równa zero (uzywamy =:=)
    ->  X0 is -B / (2*A),        % Obliczamy jeden pierwiastek
        Roots = [X0]             % Lista z jednym pierwiastkiem
    ;   % Delta > 0              % Przypadek 3: Delta dodatnia (niejawny else)
        SqrtDelta is sqrt(Delta),% Obliczamy pierwiastek z delty
        X1 is (-B - SqrtDelta) / (2*A), % Obliczamy pierwszy pierwiastek
        X2 is (-B + SqrtDelta) / (2*A), % Obliczamy drugi pierwiastek
        Roots = [X1, X2]         % Lista z dwoma pierwiastkami
    ).

% Predykat pomocniczy delta/4
delta(A, B, C, Delta) :-
    Delta is B*B - 4*A*C.
