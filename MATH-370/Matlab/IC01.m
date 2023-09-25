function IC01()
% Graphs e^x and the Taylor Series Approximation 

x = linspace(-1, 1, 50); % Graph Dimensions
y = exp(x);              % e^x
Pn = 1;                  % Start of Taylor Series Approx

for N = 1:6              % Calculate Taylor Series
    factor = (x.^N) ./ factorial(N); 
    Pn = Pn + factor;
end

% Plot e^x
subplot(2,1,1)
plot(x, y, '-')

% Plot Pn(x)
subplot(2,1,2)
plot(x, Pn, '-')