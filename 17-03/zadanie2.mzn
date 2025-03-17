% Use this editor as a MiniZinc scratch book
int: target = 1505;

array[1..6] of int: prices = [215, 275, 335, 355, 420, 580];
array[1..6] of var 0..target div min(prices): counts;

constraint sum(i in 1..6)(prices[i] * counts[i]) = target;

solve satisfy;

output ["Owoce: " ++ show(counts[1]) ++ "\n" ++
        "Frytki: " ++ show(counts[2]) ++ "\n" ++
        "Sałatka: " ++ show(counts[3]) ++ "\n" ++
        "Skrzydełka: " ++ show(counts[4]) ++ "\n" ++
        "Paluszki: " ++ show(counts[5]) ++ "\n" ++
        "Zestaw próbny: " ++ show(counts[6]) ++ "\n"];
