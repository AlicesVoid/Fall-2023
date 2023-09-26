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

## Piecewise Cubic Hermite Interp:
- `v = pchip(x, y, u)`
    - x: x-coords 
    - y: y-coords
    - u: vector of x-values at which to eval. interpolated values
    - v: array of interpolated values corresponding to the values

## Piecewise LERP Logic
- **LINEAR:**
    1. for $x$ in $x_k \leq x \leq x_{k+1}$
        - $s = x - x_k$
        - $\sigma_k = \dfrac{(y_{k+1} - y_k)}{(x_{k+1} - x_k)}$ 
    2. $L(x) = y_k + s\sigma_k$
- **CUBIC:**
    1. for $x$ in $x_k \leq x \leq x_{k+1}$
        - $h = x_{k+1} - x_k$
        - $s = x - x_k$
        - $\sigma_k = \dfrac{(y_{k+1} - y_k)}{h_k}$ 
    2. $d_k = P'(x_k)$
        - $P(x) = \dfrac{(3hs^2 - 2s^3)}{h^3}y_{k+1} + \dfrac{(h^3-3hs^2 - 2s^3)}{h^3}y_{k} + \dfrac{s^2(s-h)}{h^2}d_{k+1} + \dfrac{s(s-h)^2}{h^2}d_{k}$
    3. $P$ is a Piecewise Cubic:
        - $P(x_k) = y_k$
        - $P(x_{k+1}) = y_{k+1}$
        - $P'(x_k) = d_k$
        - $P'(x_{k+1}) = d_{k+1}$
    4. Find Slopes $d_k$: 
        - **HERMITE INTERP:**
            1. if $\sigma_k$ and $\sigma_{k+1}$ have the Same Sign: 
                - $\dfrac{1}{d_k} = \dfrac{1}{2}(\dfrac{1}{\sigma_{k-1}} + \dfrac{1}{\sigma_{k}})$
            2. Otherwise:
                - $\dfrac{w_1 + w_2}{d_k} = \dfrac{w_1}{\sigma_{k-1}} + \dfrac{w_2}{\sigma_k}$
                    - $w_1 = 2h_k + h_{k-1}$
                    - $w_2 = h_k + 2h_{k-1}$
- **SPLINES:**
    1. basically the same as cubic 
    2. HOWEVER! 
        - $P''(x_k+) = P''(x_k-)$
        - This is a Tridiagonal System for the slopes $d_k, k = 1, ..., n$ 
                - see disc. notes
    3. Second-Degree Continuity
        - $\begin{cases} P''(x) = \dfrac{(6h - 12s)\sigma_k + (6s - 2h)d_{k+1} + (6s - 4h)d_k}{(h_k)^2} \\ \\ P''(x_k +) = \dfrac{6\sigma_k - 2d_{k+1} - 4d_k}{h_k} \\ \\ P''(x_{k+1} -) = \dfrac{-6\sigma_k + 4d_{k+1} + 2d_k}{h_k} \\ \\ P''(x_k -) = \dfrac{-6\sigma_k-1 + 4d_k + 2d_{k-1}}{h_{k-1}} \\ \\ \end{cases}$
        - This Concludes:
            - $h_kd_{k-1} + 2(h_{k-1} + h_k)d_k + h_{k-1}d_{k+1} = 3(h_k\sigma_{k-1} + h_{k-1}\sigma_k)$
    4. Endpoints require Additional Conditions:
        - Use a Single Cubic thru the Three Points at the Left End (and Right End)
            