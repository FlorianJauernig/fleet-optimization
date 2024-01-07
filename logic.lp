
% Logic:
% =====
    
% Extract the actual flights from the table:
a_f(Flight) :- flight(Flight, Route, Origin, Destination, DepartureMST, ArrivalMST, FareUSD, Demand).

% Join the fleet table with the profit table
f_p(Flight, Aircraft, Registration, Result) :- fleet(Aircraft, Registration), profit(Flight, Aircraft, Result).

% Guess: For each flight, pick an aircraft:
1{pick(Flight, Aircraft, Registration, Result) : f_p(Flight, Aircraft, Registration, Result) }1 :- a_f(Flight).

% Join picks with flight and aircraft data
p_a(Flight, Route, Aircraft, Registration, Quantity, Origin, Destination, DepartureMST, ArrivalMST, Result) :- pick(Flight, Aircraft, Registration, Result), flight(Flight, Route, Origin, Destination, DepartureMST, ArrivalMST, FareUSD, Demand), aircraft(Aircraft, Quantity, Capacity, OperatingCostSLC_ATL, OperatingCostSLC_PHX).

% Ensure that no aircraft departs on a second flight before its first flight has arrived:
:- DM2 > DM, DM2 < AM, p_a(F,R,A,REG,Q,O,D,DM,AM,RE), p_a(F2,R2,A,REG,Q,O2,D2,DM2,AM2,RE2).

% Ensure that each aircraft returns to its origin airport after flying to its destination [does not work]:
%:- D != O2, p_a(F,R,A,REG,Q,O,D,DM,AM,RE), p_a(F2,R2,A,REG,Q,O2,D2,DM2,AM2,RE2).

% Since this one-liner did not succeed, we took a more complicated 3-step approach:

% Count the number of flights on a route per aircraft:
on_route("N737AA", 1, FlightsOnRoute):- FlightsOnRoute = #count {(F,REG) : REG="N737AA", R=1, p_a(F,R,A,REG,Q,O,D,DM,AM,RE) }.
on_route("N737AA", 2, FlightsOnRoute):- FlightsOnRoute = #count {(F,REG) : REG="N737AA", R=2, p_a(F,R,A,REG,Q,O,D,DM,AM,RE) }.
on_route("N737BB", 1, FlightsOnRoute):- FlightsOnRoute = #count {(F,REG) : REG="N737BB", R=1, p_a(F,R,A,REG,Q,O,D,DM,AM,RE) }.
on_route("N737BB", 2, FlightsOnRoute):- FlightsOnRoute = #count {(F,REG) : REG="N737BB", R=2, p_a(F,R,A,REG,Q,O,D,DM,AM,RE) }.
on_route("N757CC", 1, FlightsOnRoute):- FlightsOnRoute = #count {(F,REG) : REG="N757CC", R=1, p_a(F,R,A,REG,Q,O,D,DM,AM,RE) }.
on_route("N757CC", 2, FlightsOnRoute):- FlightsOnRoute = #count {(F,REG) : REG="N757CC", R=2, p_a(F,R,A,REG,Q,O,D,DM,AM,RE) }.
on_route("N318DD", 1, FlightsOnRoute):- FlightsOnRoute = #count {(F,REG) : REG="N318DD", R=1, p_a(F,R,A,REG,Q,O,D,DM,AM,RE) }.
on_route("N318DD", 2, FlightsOnRoute):- FlightsOnRoute = #count {(F,REG) : REG="N318DD", R=2, p_a(F,R,A,REG,Q,O,D,DM,AM,RE) }.

% Add the number of flights on a route to the data:
p_a_r(Flight, Route, Aircraft, Registration, Quantity, Origin, Destination, DepartureMST, ArrivalMST, Result, FlightsOnRoute) :- on_route(Registration, Route, FlightsOnRoute), p_a(Flight, Route, Aircraft, Registration, Quantity, Origin, Destination, DepartureMST, ArrivalMST, Result).

% Try to ensure that each aircraft returns to its origin airport after flying to its destination by preventing odd numbers of flights on a route.
:- FlightsOnRoute == 1, p_a_r(Flight, Route, Aircraft, Registration, Quantity, Origin, Destination, DepartureMST, ArrivalMST, Result, FlightsOnRoute).
:- FlightsOnRoute == 3, p_a_r(Flight, Route, Aircraft, Registration, Quantity, Origin, Destination, DepartureMST, ArrivalMST, Result, FlightsOnRoute).
:- FlightsOnRoute == 5, p_a_r(Flight, Route, Aircraft, Registration, Quantity, Origin, Destination, DepartureMST, ArrivalMST, Result, FlightsOnRoute).

% However, some cases remain where there are missing return trips despite the even number of flights on a route.
% Try to prevent such impossible schedules (Flight 1: airport A -> airport B; same aircraft, flight 2: airport A -> airport B).
% Only "keep" all instances where the first and second origin-destination pair are not identical (including the direction):
schedule(F,R,A,REG,Q,O,D,DM,AM,RE,FOR,"keep"):- p_a_r(F,R,A,REG,Q,O,D,DM,AM,RE,FOR), p_a_r(F2,R2,A2,REG,Q2,O2,D2,DM2,AM2,RE2,FOR2), O != O2, D != D2.

#show schedule/12.
