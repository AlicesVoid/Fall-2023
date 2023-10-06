# Ch 5: Least Squares Solution 

### Matrices Review:
**Rank-Nullity: $Rank + Nullity = Dim$**
- Rank: # of Rows w/ Nonzero Values
- Nullity: # of Rows w/ Only Zero Values

**Nullspace: $N(A) = {x | Ax = 0}$**
- The 0-Vector Solution 
- Same thing as a **Kernel**

**Colspace: $C(A) = N(A^T)^\perp$**
- Orthogonal Complement of the Left Nullspace
    - Transpose, then Orthogonal

**Basis: $v \in C(A)$ for each $C(A(: i)) \in i=1:rank(A)$**
- For the rank of A: 
    - Add that many Columns of A to the Basis
    - Either $B(A) = C(A)$ or $B(A) \subset C(A)$

-----------

### Least Squares Process:
**If $Ax = b$ has No Solution:**
- We try to find a Vector as close to $b$ as Possible: 
    - $||r|| = ||Ax - b||$
- When the residual $r$ is Minimized:
    - $A^Tr = 0$
    - $A^T(b-Ax) = 0$
    - **Therefore: $A^TA\hat{x} = A^Tb$**

### Notes on L.S. Process:
- **$N(A) = N(A^TA)$**
    - Nullspace of A is equal to it's Symmetric
- **$A^TA \implies \exists (A^{-1}) \iff rank(A) = dim(C(A))$**
    - $A^{-1}$ exists if $A^TA$ has Linear Independent Columns
- **$A^TA$ is ILL-CONDITIONED!**
    - AVOID this if A is a big matrix...

-----------

### Linear Fits to Data 
- Given some points $(x_n, y_n)$ and fit them to $y = mx + b$
    - Error is found with $e_i = y_i - (mx_i + b)$
- What if there's a Lot of error?
    - Minimize the **Length of the Error Vector**: 
        - $E = ||e^2|| = \sum_{i=1}^{n}(e_i^2) = \sum_{i=1}^{n}(y_i - mx_i -b)^2$
    - Find an **Inconsistent System**:
        - $Av = y, \text{ where: }
            A = \begin{bmatrix}
            x_1 & 1 \\
            x_2 & 1 \\
            \vdots & \vdots \\
            x_n & 1
            \end{bmatrix}
            v = \begin{bmatrix}
            m \\
            b
            \end{bmatrix}
            y = \begin{bmatrix}
            y_1 \\
            y_2 \\
            \vdots \\
            y_n
            \end{bmatrix}
            $
            
        - Therefore: 
            - $A^TAv = A^Ty$



-----------
### In Matlab
**Least Squares:** `x = A\b`
