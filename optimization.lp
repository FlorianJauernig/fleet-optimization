
% Optimization:
% ============

% Actual profit sum:
actual_profit_sum(Profit) :- Profit = #sum {RE : schedule(F,R,A,REG,Q,O,D,DM,AM,RE,FOR,X)}.

#show actual_profit_sum/1.

% Maximize actual profit sum:
#maximize { Profit : actual_profit_sum(Profit) }.
