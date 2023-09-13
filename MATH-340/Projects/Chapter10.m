% Chapter 10 Homework 

% Problem 8:
F = gallery('frank',12);
P = pascal(12);
F_e = sort(eig(F));
F_cn = condeig(F);
P_e = sort(eig(P));
P_cn = condeig(P);
(F_e(1:6).*F_e(12:-1:7))-ones(6,1);
(P_e(1:6).*P_e(12:-1:7))-ones(6,1);
