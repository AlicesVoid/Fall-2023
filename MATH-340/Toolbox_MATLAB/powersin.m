function [s, num_terms, largest_term] = powersin(x)
%POWERSIN  Power series for sin(x).
%  [y, num_terms, largest_term] = POWERSIN(x) computes sin(x) from its power series,
%  returns the number of terms used in the approximation, and the largest term in the series.

x = 31*(pi/2); 
s = 0;
t = x;
n = 1;
num_terms = 0;      % Initialize the term counter
largest_term = 0;   % Initialize the largest term

while s + t ~= s
   s = s + t;
   t = -x.^2/((n+1)*(n+2)).*t;
   n = n + 2;
   num_terms = num_terms + 1;  % Increment the term counter
   
   % Update the largest term if the current term is larger
   if abs(t) > largest_term
       largest_term = abs(t);
   end
end
