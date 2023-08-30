# Chapters Review: Aug23 to Aug29

## Dimensional Identities
1. $[-x] = [x]$
2. $[xy] = [x][y]$
3. $[x\div y] = [x]\div[y]$
4. $[x^a] = [x]^a$
5. $[C] = 1$
6. $[Cx] = [x]$
7. $ if \quad [x] = [y] = D,$
    - $then \quad [x \pm y] = [x] = [y] = D$
8. $[0] = $ any dimension

## Fundamental Units
1. **Mass: $M$**
2. **Length: $L$**
3. **Time: $T$**

## Dimensional Representations
- $[Distance] = L$
- $[Area] = L^2$
- $[Density] = [\dfrac{M}{V}] = \dfrac{M}{L^3}$
- $[Speed] = \dfrac{L}{T}$
- $[Gravity] = \dfrac{m}{s^2} = \dfrac{L}{T^2}$
- $[Weight] = [Mass \times Gravity] = [M\dfrac{m}{s^2}] = M\dfrac{L}{T^2}$
- $[\theta] = [\dfrac{arclength}{radius}] = \dfrac{[arclength]}{[radius]} = \dfrac{L}{L} = 1$

### Dimension Rep.s Continued
- Bulk Viscosity: 
    - $[\mu] = \dfrac{M}{LT}$
- Kinematic Viscosity: 
    - $[v] = \dfrac{[\mu]}{[\rho]} = \dfrac{M\div LT}{M\div L^3} = \dfrac{L^2}{T}$
- Specific Weight: 
    - $[W] = [\dfrac{weight}{volume}] = \dfrac{ML\div T^2}{L^3} = \dfrac{M}{L^2T^2}$
- Surface Tension: 
    - $[\sigma] = \dfrac{M}{T^2}$

### Galileo's Pendulum Example
- Model the Time using $r, m, g, \theta$
- **Rayleigh Method:**
    1. $[T] = [k \cdot r^\alpha \cdot m^\beta \cdot g^\gamma \cdot \theta^\sigma]$
    2. $(L^0)(M^0)(T^1) = L^\alpha \cdot M^\beta \cdot (\dfrac{L}{T^2})^\gamma$
    3. $(L^0)(M^0)(T^1) = L^{\alpha + \gamma} \cdot M^\beta \cdot T^{-2\gamma}$
    4. Solve the System:
        - $\alpha + \gamma = 0, \rightarrow \alpha = \frac{1}{2}$
        - $\beta = 0$
        - $-2\gamma = 1, \rightarrow \gamma = \frac{-1}{2}$ 
    5. Therefore the final Equation is:
        - $T = k \cdot \theta^\sigma \cdot r^{\frac{1}{2}} \cdot m^0 \cdot g^{\frac{-1}{2}}$
    6. Which simplifies to:
        - $T = k \cdot \theta^\sigma \cdot \sqrt{\dfrac{r}{g}}$

### Capillary Tube Fluid Example
- Height using diameter, specific weight, surface tension: $D, w, \sigma$
- **Rayleigh Method:**
    1. Model:
        - $[h] = [k \cdot D^a \cdot W^b \cdot \sigma^c]$
    2. Simplify:
        - $L = L^a \cdot (\dfrac{M}{L^2T^2})^b \cdot (\dfrac{M}{T^2})^c$
    3. Simplify Further:
        - $L = \dfrac{L^{a-2b}}{T^{2b+2c}}$
    4. Solve the System:
        - $a-2b = 1, \rightarrow a = 1-2c$
        - $2b + 2c = 0, \rightarrow b = -c$
        - solution for $[a, b, c]$ is $[-1, -1, 1]$ or $[1, 0, 0]$ (? you figure it out)