int: target = 1505;  % Budżet

array[1..6] of int: prices = [215, 275, 335, 355, 420, 580];  % Ceny posiłków
array[1..6] of int: yumyum = [0, 0, 1, 1, 2, 3];  % Smakowitość posiłków

array[1..6] of var int: counts;  % Liczba zamówionych posiłków

constraint forall(i in 1..6)(counts[i] >= 0);  % Każda ilość musi być nieujemna
constraint sum(i in 1..6)(prices[i] * counts[i]) = target;  % Wydajemy dokładnie budżet

var int: total_yumyum = sum(i in 1..6)(yumyum[i] * counts[i]);  % Suma "yumyum factor"

solve maximize total_yumyum;  % Maksymalizujemy smakowitość

output [
    "Największa suma yumyum: " ++ show(total_yumyum) ++ "\n" ++
    "Owoce: " ++ show(counts[1]) ++ "\n" ++
    "Frytki: " ++ show(counts[2]) ++ "\n" ++
    "Sałatka: " ++ show(counts[3]) ++ "\n" ++
    "Skrzydełka: " ++ show(counts[4]) ++ "\n" ++
    "Paluszki: " ++ show(counts[5]) ++ "\n" ++
    "Zestaw próbny: " ++ show(counts[6]) ++ "\n"
];