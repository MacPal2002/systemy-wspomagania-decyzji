int: owoce = 215;
int: frytki = 275;
int: salatka = 335;
int: skrzydelka = 355;
int: paluszki = 420;
int: zestaw_probny = 580;

int: total_cost = 1505;

var 0..total_cost div owoce: x1; % Owoce
var 0..total_cost div frytki: x2; % Frytki
var 0..total_cost div salatka: x3; % Sałatka
var 0..total_cost div skrzydelka: x4; % Skrzydełka
var 0..total_cost div paluszki: x5; % Paluszki
var 0..total_cost div zestaw_probny: x6; % Zestaw próbny

constraint x1 * owoce + x2 * frytki + x3 * salatka + x4 * skrzydelka + x5 * paluszki + x6 * zestaw_probny = total_cost;

solve satisfy;

output ["Owoce: " ++ show(x1) ++ "\n" ++
        "Frytki: " ++ show(x2) ++ "\n" ++
        "Sałatka: " ++ show(x3) ++ "\n" ++
        "Skrzydełka: " ++ show(x4) ++ "\n" ++
        "Paluszki: " ++ show(x5) ++ "\n" ++
        "Zestaw próbny: " ++ show(x6) ++ "\n"];
