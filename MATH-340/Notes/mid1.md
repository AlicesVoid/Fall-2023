# MIDTERM 1 REVIEW GUIDE WHAAAA 

# CHAPTER 1

# CHAPTER 2 

# CHAPTER 10

# CHAPTER 3

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