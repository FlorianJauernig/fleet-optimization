
% Data:
% ====

% Table1: flight(Flight, Route, Origin, Destination, DepartureMST, ArrivalMST, FareUSD, Demand)       
flight("WA 121", 1, "SLC", "ATL", "06:40", "10:25", 275, 200).
flight("WA 122", 1, "SLC", "ATL", "17:00", "22:30", 300, 225).
flight("WA 151", 1, "ATL", "SLC", "11:15", "15:35", 250, 175).
flight("WA 152", 1, "ATL", "SLC", "16:30", "21:00", 325, 150).
flight("WA 153", 2, "PHX", "SLC", "07:45", "09:30", 180, 175).
flight("WA 154", 2, "PHX", "SLC", "18:15", "19:55", 210, 150).
flight("WA 201", 2, "SLC", "PHX", "11:00", "12:40", 175, 125).
flight("WA 202", 2, "SLC", "PHX", "14:20", "16:05", 200, 100).

% Table2: aircraft(Aircraft, Quantity, Capacity, OperatingCostSLC_ATL, OperatingCostSLC_PHX)
aircraft("B737", 2, 150, 30000, 20000). 
aircraft("B757", 1, 216, 42000, 28000). 
aircraft("A318", 1, 120, 24000, 17000). 

% Table3: profit(Flight, Aircraft, Result)
profit("WA 121", "B737", 11250).
profit("WA 121", "B757", 13000).
profit("WA 121", "A318", 9000).

profit("WA 122", "B737", 15000).
profit("WA 122", "B757", 22800).
profit("WA 122", "A318", 12000).

profit("WA 151", "B737", 7500).
profit("WA 151", "B757", 1750).
profit("WA 151", "A318", 6000).

profit("WA 152", "B737", 18750).
profit("WA 152", "B757", 6750).
profit("WA 152", "A318", 15000).

profit("WA 153", "B737", 7000).
profit("WA 153", "B757", 3500).
profit("WA 153", "A318", 4600).

profit("WA 154", "B737", 11500).
profit("WA 154", "B757", 3500).
profit("WA 154", "A318", 8200).

profit("WA 201", "B737", 1875).
profit("WA 201", "B757", -6125).
profit("WA 201", "A318", 4000).

profit("WA 202", "B737", 2000).
profit("WA 202", "B757", -6000).
profit("WA 202", "A318", 5000).

% Table4: fleet(Aircraft, Registration)
fleet("B737", "N737AA").
fleet("B737", "N737BB").
fleet("B757", "N757CC").
fleet("A318", "N318DD").
