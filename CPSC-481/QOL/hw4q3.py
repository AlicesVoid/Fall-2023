#!/usr/bin/env python3
import itertools


def implies(A: bool, B: bool) -> bool:
    return not A or B


premise_a = lambda P, Q, R: P or Q
premise_b = lambda P, Q, R: implies(P, R)
premise_c = lambda P, Q, R: not Q

conclusion_a = lambda P, Q, R: R
conclusion_b = lambda P, Q, R: not P or R
conclusion_c = lambda P, Q, R: Q and R


states = (True, False)
row = 0

print("row  ", end="")
print("P  Q  R  ", end="")
print("premise_a  ", end="")
print("premise_b  ", end="")
print("premise_c  ", end="")
print("conclusion_a  ", end="")
print("conclusion_b  ", end="")
print("conclusion_c  ", end="")
print()
for P, Q, R in itertools.product(states, states, states):
    row += 1
    print(f"{row:3d}  {P:1d}  {Q:1d}  {R:1d}  ", end="")
    print(f"{premise_a(P, Q, R):9d}  ", end="")
    print(f"{premise_b(P, Q, R):9d}  ", end="")
    print(f"{premise_c(P, Q, R):9d}  ", end="")
    print(f"{conclusion_a(P, Q, R):12d}  ", end="")
    print(f"{conclusion_b(P, Q, R):12d}  ", end="")
    print(f"{conclusion_c(P, Q, R):12d}  ", end="")
    print()