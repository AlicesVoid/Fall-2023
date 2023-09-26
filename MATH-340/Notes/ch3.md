# CHAPTER 3: LERPING! 
- Linear Interpolation 
    - Function that Parametrizes a Line
    - Function s.t: `p(x_i) = y_i`

## Polynomial LERP
- `polyinterp(x, y, u)`
    - x: x-coords
    - y: y-coords
    - u: vector of x-values at which to evaluate the polynomial
    - EXAMPLE:
        - x = [0 3 4 7 9];
        - y = [3 6 8 5 2];
        - xx = 0:.01:9;
        - plot(xx, `polyinterp(x,y,xx)`)

## Vandermonde Matrix 
- `V = vander(x)`
    - CORE IDEA:
        - Polynomial Matrix * Vector of Constants = Line Values 
        - i.e: `V * [c1; c2; ...; c_n] = [y1; y2; ...; y_n]`

## Piecewise LERP
- **LINEAR:**
    1. for $x$ in $x_k \leq x \leq x_{k+1}$
        - $s = x - x_k$
        - $\sigma_k = \dfrac{(y_{k-1} - y_k)}{(x_{k-1} - x_k)}$ 
    2. $L(x) = y_k + s\sigma_k$
