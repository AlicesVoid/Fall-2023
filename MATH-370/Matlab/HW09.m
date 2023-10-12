% Script for M370 - HW09

% Problem 3.c
%{
a = @(n)(0.8.^n)*(500-500)-500;
n = 1:0.01:10;
plot(n, a(n));
xlabel("n-value");
ylabel("a(n)-value");
title("Question 3.c: Relationship of n and a(n)");
%}

% Problem 5
%{
f = @(n)(1.005^n)*(5000)+(200)*(((1.005^n)-1)/1.005) - 20000;
fzero(f, 5);
%}

% Problem 9
%{
f = @(n)(1.01^n)*(-50000)+100000;
fzero(f, 200);
%}

% Problem 14
%
k = 0.25;
r_n = @(n)n*(1+k*(1000-n));
i_n = @(n)n*(1+k*(856900-n));
r = @(n)(1+k*1000)^(n)-k^(2^(n+1)-1);
i = @(n)(1+k*856900)^(n)-k^(2^(n+1)-1);

