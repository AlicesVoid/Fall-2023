(# Ch 3.5: Informed Search #

## Heuristics 
- Function that estimates the Distance From Goal
- Designed Per-Problem

**Conditioning:**
- Heuristic must be **Admissible:**
    - Never Overestimate true cost 
    - Admissible Heuristics slow down bad plans 
        - but never outweigh true costs 
- Heuristic must be **Consistent:**
    - a.k.a Monotonic
    - estimated cost of getting to a goal is Never More than:
        - Cost of Action + Estimated Cost of Next State
    - Every **Consistent** Heuristic is also **Admissible**

**Creating Admissible Heuristics:**
- Heuristics are Solutions to Relaxed Problems 
    - Assume you have Extra Movements to Make Traveling Easier
- ex1: 8-Puzzle
    - Heuristic: Number of Tiles Misplaced 
    - h(start) = 8

## Greedy Best-First Search
**Method:**
- Always pick the Node w/ the Lowest Heuristic 
    - a.k.a: 'Pure Heuristic Search'

**COST:**
- Not Complete (can get stuck in dead ends)
- Not Optimal 

## A* 
**Method:**
- Combines UCS and Greedy 
    - UCS: Orders by Path Cost [backward cost $g(n)$]
    - Greedy: orders by Goal Proximity [forward cost $h(n)$]
- Orders by Sum: 
    - $f(n) = g(n) + h(n)$

**Pseudocode:**
1. `frontier = [Start]`
    - `explored = []`
2. `If frontier == []: return FAILURE`
    - `Else: explored.end = frontier.pop()`
3. `If explored.end == Goal: return SUCCESS`
    - `Else:`
4. `For childNode in explored.end:`
    - `If childNode not in explored[] || frontier[]:`
        - `frontier.push(childNode)`
    - `Else If childNode in frontier[] && frontier[childNode].cost > childNode.cost:`
        - `frontier.remove[childNode]`
        - `frontier.push(childNode)`

**COST:**
- Complete:
    - Terminates even on Infinite States
    - always gets to a Reachable Goal
- Optimal: 
    - Optimally Efficient:
        - No other algorithm with the same Heuristics expands fewer nodes
- Time Comp:
    - Number of States is Exponential (bad)
    - Number of States depends on Heuristic Error
- Space Comp: 
    - Keeps all Generated Nodes in Memory: Exponential 
- **Note:**
    - UCS is just A* if (h = 0)
    - UCS expands Equally in "All Directions"
        - A* expands mainly towards the goal- 