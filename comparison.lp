
% Comparison:
% ==========

% Maximum profit per flight, disregarding all constraints:
max_profit(Flight, Aircraft, Result) :- profit(Flight, Aircraft, Result), Result = #max {R : profit("WA 121",A,R)}.
max_profit(Flight, Aircraft, Result) :- profit(Flight, Aircraft, Result), Result = #max {R : profit("WA 122",A,R)}.
max_profit(Flight, Aircraft, Result) :- profit(Flight, Aircraft, Result), Result = #max {R : profit("WA 151",A,R)}.
max_profit(Flight, Aircraft, Result) :- profit(Flight, Aircraft, Result), Result = #max {R : profit("WA 152",A,R)}.
max_profit(Flight, Aircraft, Result) :- profit(Flight, Aircraft, Result), Result = #max {R : profit("WA 153",A,R)}.
max_profit(Flight, Aircraft, Result) :- profit(Flight, Aircraft, Result), Result = #max {R : profit("WA 154",A,R)}.
max_profit(Flight, Aircraft, Result) :- profit(Flight, Aircraft, Result), Result = #max {R : profit("WA 201",A,R)}.
max_profit(Flight, Aircraft, Result) :- profit(Flight, Aircraft, Result), Result = #max {R : profit("WA 202",A,R)}.

% Maximum profit sum:
max_profit_sum(Result) :- Result = #sum {R : max_profit(F,A,R)}.

#show max_profit_sum/1.
