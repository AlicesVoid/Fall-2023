# MIDTERM 1 REVIEW GUIDE WHAAAA 
-------
# INTRO

### Why is NA Important?
- wwts that approximate mathematics can be conditioned 
    - **Important for Accuracy and Precision**
        - Sig-Figs & Machine Numbers 
            - Mantissa nd Exponent need to be Carefully Considered 
            - Prone to Roundoff Errors 
            - Cancelling-Out Similar Values 
        - Rewriting Functions for Conditioning 
            - Different Representations work w/ Different Sig-Figs 
            - Fixing Ill-Conditioned Problems to Better Represent Them w/ Machines
        - Approximations
            - Finding some way to represent True Approximation Accuracy
    - **Important for Efficiency** 
        - Repeating Math with Some Pattern Multiple Times 
            - We can simplify things like these to better control our outcome
            - We can simplify things like these to reduce our overall-errors 
    - **Important for Re-Framing Math Problems** 
        - Some Integrals require Numerical Expression 
            - Symbolic Expression becomes Unrealistic to Real-World Problems
        - EXAMPLE: 
            - Initial Value Problems are Re-Framing Problems

### Important Matlab Tools: 
**Chapter 1:**
- `ones(rows, cols)`
    - Creates a matrix of size `rows` by `cols` filled with ones.
- `eye(n)`
    - Generates an `n`-by-`n` identity matrix with ones on the main diagonal and zeros elsewhere.
- `triu(A, k)`
    - Extracts the upper triangular part of the matrix `A`, optionally shifting it by `k` diagonals, and sets the lower triangular elements to zero.

**Chapter 2:**
- `A\b`
    - Solves a system of linear equations represented as `A*x = b`, where `A` is a matrix of coefficients and `b` is a vector or matrix of constants. It returns the solution vector `x`.
- `A/b`
    - Performs left matrix division for solving linear equations represented as `A*X = b`, where `A` is a matrix of coefficients and `b` is a matrix of constants. It returns the solution matrix `X`.
- `A'`
    - Computes the transpose of matrix `A`, reflecting it across its main diagonal, effectively swapping rows and columns.
- `spdiag(v, k)`
    - Constructs a sparse diagonal matrix using the vector `v` as the main diagonal and an optional `k` as the diagonal offset. It returns a sparse matrix with the specified diagonal elements.
- `tridisolve(A, B)`
    - Solves a tridiagonal linear system represented by the coefficient matrix `A` and the constant vector or matrix `B`. It efficiently computes the solution to the tridiagonal system.

**Chapter 10:**
- `eig(A)`
    - Computes the eigenvalues of a square matrix `A`. It returns a vector containing the eigenvalues.
- `condeig(A)`
    - Computes the condition number of the eigenvalues of a square matrix `A`. It provides information about the sensitivity of the eigenvalues to perturbations in the matrix `A`.
- `svd(A)`
    - Computes the Singular Value Decomposition (SVD) of a matrix `A`. It decomposes the matrix into three matrices, `U`, `S`, and `V`, such that `A = U * S * V'`, where `U` and `V` are orthogonal matrices, and `S` is a diagonal matrix containing the singular values of `A`.

**Chapter 3:**
- `piecelin(x, y, xi)`
    - Performs piecewise linear interpolation on the data points `(x, y)` and evaluates the interpolated values at the specified `xi` points.
- `polyinterp(x, y, xi, n)`
    - Interpolates data points `(x, y)` using a polynomial of degree `n` and evaluates the interpolated values at the specified `xi` points.
- `spline(x, y, xi)`
    - Uses cubic spline interpolation to estimate values at `xi` points based on the given data points `(x, y)`.
- `pchip(x, y, xi)`
    - Applies piecewise cubic Hermite interpolation to estimate values at `xi` points using the data points `(x, y)`.
- `polyfit(x, y, n)`
    - Fits a polynomial of degree `n` to data points `(x, y)` using the least squares method- Returns a Polynomial. 
- `polyval(p, x)`
    - Evaluates a polynomial with coefficients defined by the vector `p` at the specified values in vector `x`, returning the corresponding function values.

**Chapter 4:**
- `solve(eqns, vars)`
    - Symbolically solves algebraic equations or systems of equations represented by `eqns` for the variables `vars`.
- `roots(p)`
    - Computes the roots (solutions) of a polynomial equation defined by the coefficients in vector `p`.
- `matlabFunction(expr, 'vars')`
    - Converts symbolic expressions or functions given by `expr` into MATLAB functions that can be evaluated numerically, specifying the variables in the 'vars' argument.
- `fzero(fun, x0)`
    - Finds a numerical approximation to a root (zero) of a single-variable function `fun` starting from the initial guess `x0`.
- `fsolve(fun, x0)`
    - Solves systems of nonlinear equations numerically by finding the values of the variables that satisfy the system defined by `fun`, starting from the initial guess `x0`.

-------
# CHAPTER 1

### Floating Point Numbers
**Binary Math:**
- $x = \pm(1+f) * 2^e$
    - $0 \leq f < 1$
    - $f = (\mathbb{Z} < 2^{52}) / 2^{52}$
    - $e = \mathbb{Z} \in [-1022, 1023]$
- NOTE:    
    - $f$ implies finite Precision
    - $e$ implies finite Range
    - Floating-Point Values have Discrete Spacing/Max/Min

### Fractional Components
**$f \sum_{j=1}^{\infty}\dfrac{d_j}{2^j}$**
- Same as $f = .d_1d_2d_3...$ 
    - d is a 0 or a 1
- The 1/10th Issue:
    - $0.1 \neq$ some series of binary frac.s 
        - Instead we get something like $1.1\overline{0011} * 2^{-3}$

### EPS 
**Distance from 1 to the Next-Largest Floating Point**
- No Floats between 1 and 1+eps
    - Double Precision 
        - $\implies eps = 2^{-52} =$ 2.2204e-16 
        - (52 bits for f, 11 for e, 1 for $\pm$)
- **NOTE:** 
    - EPS ONLY MATTERS IF WE'RE ROUNDING FLOATS (NOT DECLARING THEM)

### Real Numbers
**$(1+f)2^e \leq r \leq (1+f+eps)2^e$**
- Real Numbers (r) in the Range of Floats 
    - $realmin = 2^{-1022}$
    - $realmax = (2-eps)2^{1023}$
- NOTE:
    - EPS is the Max. Roundoff Error when r is Rounded to the Nearest Float

-------
# CHAPTER 2 

### Linear System Solutions 
**$Ax = b$**
- Matlab Backslash Operator: $x = A$ \ $b$
    - $xA = b \implies x = b/A$
- Solution Process: 
    1. Gaussian Elimination 
        - Simplify The Matrix
    2. Back-Substitution 
        - Find Actual Values via. Substitution

### LU Factorization
**$Ax = b \implies LU = PA \implies LU = Pb$**
- Solution Process: 
    1. $Ly = Pb$ 
        - Forward Sub 
    2. $Ux = y$
        - Backwards Sub

**Permutation Matrix $P$:**
- Matrix of 1's and 0's 
    - $P^{-1} = P^T$
- Importance: 
    - We can Change Column Orders 
    - We can Condition our Matrices Values
        - Avoid Awkward SigFig Substitution Moments

### Partial Pivoting
**GOAL:**
- Get the **Maximal Element In The Pivot Position** Every Time 
    - Lets us Better Represent the Other Values when Simplifying 
        - (Ch.2 Slide 14)
- **MEANING:**
    - guarantees that the multipliers will all be less than or equal to 1
        - This guarantees a small residual, and a “satisfactory” solution in a sense that can be made rigorous


### Rounoff Errors 
- **Error:**
    - $e = x - x_*$
- **Residual:** 
    - $r = b - Ax_*$
- **NOTE:** 
    - Small Residual $\neq$ Small Error 
        - Keep in mind that these are LINES with MULTIPLE INTERSECTIONS

### Conditioning
**Signs of Ill-Conditioning:**
1. Determinant is Small 
    - (not enough evidence on it's own)
2. **Norm** of a Matrix
    - $||A||$ is the Maximal "Stretch" of a vector when A is applied:
    - $||A|| = \max_{x\neq0}\dfrac{||Ax||}{||x||}$
    - if Invertible:
        - $||A^{-1}|| = (\min_{x\neq0}\dfrac{||Ax||}{||x||})^{-1}$
3. **Condition Number:**
    - $\kappa(A) = ||A||||A^{-1}||$
        - Implies: 
            - $\dfrac{||\delta x||}{||x||}\leq\kappa(A)*\dfrac{||\delta b||}{||b||}$ 
        - NOTE: 
            - $\delta$ is some value where $A \delta x = \delta b$
    - Properties:
        1. $\kappa(A) \geq 1$
        2. $\kappa(P) = 1$
        3. $\kappa(cA) = \kappa(A)$
        4. If D is Diagonal:
            - $\kappa(D) = \dfrac{\max |d_{ii}|}{\min |d_{ii}|}$
        5. Well-Conditoned: 
            - Closer $\kappa(A)$ is to 1 indicates better conditioning

### IN MATLAB: 
**Conditioning:**
- `cond(A, p)`
    - p-norm condition number, where $1 \leq p \leq \infty$
    - Expensive
- `condest(A)`
    - lower-bound c for the 1-norm condition of square-matrix A
    - Cheap

-------
# CHAPTER 10

### Spectral Theorem 
**$A = QDQ^T$**
- Requirements: 
    - A is a Real Symmetric Matrix:
        - we know Eigenvalues are Real 
        - We know Eigenvectors are Orth. 

### Singular Value Decompositon 
**$A = U\Sigma V^T = \sum _{i=1}^{r}\sigma_i*u_i*v_i^T$**
- Requirements: 
    - A is m x n matrix w/ Real Entries: 
        - m x m orth. matrix U exists 
        - n x n orth. matrix V exists 
        - m x n diag. matrix $\Sigma$ exists
            - Diagonal Values of $\Sigma$ are called **SINGULAR VALUES**
- Significance: 
    - $Au_i = \sigma_iv_i$
- **NOTE:** 
    - Singular Values $\sigma_i$ are Square Roots of Eigenvalues of $A^TA$
        - (always positive)
    - Vectors $v_i$ are the eigenvectors of $A^TA$ 
        - (right singular)
    - Vectors $u_i$ are the eigenvectors of $AA^T$ 
        - (left singular)
    - If A is Complex: 
        - Same result applies, but U and V are unitary: $A = U\Sigma V ^*$


### SVD Applications 
**Inverse of Any Matrix**
- Pseudo-Inverse: 
    - $\Sigma^+ \implies \sigma_{1,2...r}^{-1}$ for the whole matrix
    - $A^+ = V\Sigma^+U^T$
        - $... = \sum _{i=1}^{r}\sigma_i^{-1}*v_i*u_i^T$
    - Basically, we just processed matrix A into it's Inverse 
        - We can use this to efficiently map A with parameters: 
            - (i.e: least squares solution of $Ax = b$ w/ min. norm is $x = A^+b$)
            - (i.e: projection onto range of A is $P = AA^+$)

**Approx. a Low-Rank Matrix:**
- $A_k = U\Sigma_kV^T$
    - $A_k$ is the closest rank k matrix to A
    - Basically, we just compressed matrix A 
        - if B is another m x n rank k matrix, 
            - then $||A-B|| \geq ||A-A_k||$

-------
# CHAPTER 3

honestly just check your other notes- they're chilling

-------
# CHAPTER 4

### Bisection:
- just keep averaging towards f(x) = 0 for some x in [A,B] 
    - Change [A,B] based on averaging results
- **Pros/Cons:**
    - Always Works
    - Linear Convergence (Slow) 
        - $e_{n+1} \approx 0.5e_n$

### Newton's Method:
- Use the Derivative to get a better Average 
    - $x_{n+1} = x_n - \dfrac{f(x_n)}{f'(x_n)}$
- **Pros/Cons:**
    - Quadratic Convergence
        - $e_{n+1} \leq Me_n^2$
        - Taylor's Theorem Proves This (Ch-4 Slide 7)
    - Not Always Accurate 
        - Demands a Good Initial Guess and a Formula for $f'(x)$

### Secant Method:
- Newton's Method w/o the Formula for $f'(x)$
    - $\begin{cases}s_n = \dfrac{f(x_n) - f(x_{n-1})}{x_n - x_{n-1}}\\s_n \approx f'(x_n) \\ x_{n+1} = x_n - \dfrac{f(x_n)}{s_n}\end{cases}$
- **Pros/Cons:**
    - More Reliable than Newton's
    - Superlinear Convergence 
        - $e_{n+1} = O(e_n^\phi)$
        - NOTE: $\phi$ is the Golden Ratio:
            - $\phi = (1+\sqrt{5})/2 \approx 1.62$

### Inverse Quadratic Interpolation |Q|: 
- Uses 3 Previous Iterates instead of 2
    - This creates a Quadratic 
    - $\begin{cases}x = P(y) \\ x_{n+1} = P(0) \end{cases}$
- **Code:**
    ```
    while abs(c-b) > tol
    x = polyinterp([f(a), f(b), f(c)], [a, b, c], 0);
    a = b;
    b = c;
    c = x;
    end
    ```

### Zeroin
- `fzero` combines reliability of bisection with speed of |Q| and secant 
- **Method:**
    1. Start with a and b such that f (a)f (b) < 0.
    2. Use a secant step to give c between a and b.
    3. Repeat the following steps until |b −a| is within a given tolerance or f (b) = 0.
    4. Arrange a,b,c so that
        - f (a)f (b) <0
        - |f (b)|≤|f (a)|.
        - c is the previous value of b
    5. If:
        - c != a consider an |Q| step.
        - If c = a, consider a secant step.
        - If the |Q| or secant step is in the interval [a,b], take it.
        - If the step is not in the interval, use bisection.