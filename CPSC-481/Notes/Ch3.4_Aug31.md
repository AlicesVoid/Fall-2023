# Chapter 3.4: Uninformed Search #

## Uninformed Search
- No knowledge about how close a State is to the Goal
- Useful when the problem domain lacks info to guide the search process
- Can be inefficient in Complex Search Spaces since there's no domain spec.s to exploit

## Tree-Search Algorithms 
**Properties:**
- b : branching factor
- m : maximum depth 
- s : shallowest solution
- solutions at various depths 
- Nodes In Tree: 
    - $O(b^m)$

### Depth-First Search
**Method:**
1. Searches nodes by Depth First  
2. Goes as Deep as Possible
3. Works it's way around Width
4. Show Frontier (and Explored sometimes) at Every Step
- **PSEUDO-CODE EXAMPLE:**
    1. `frontier = [root_children, ...]`
    2. `explored = []`
    3. `if frontier == empty: return FAILURE`
    4. `if frontier.top == goal: return SUCCESS`
    5. `explored.push(frontier.pop())`  //top_node
    6. `if next(explored.last) not in frontier[] || explored[]: frontier_push(next_node)` //for all next nodes

**Data Structures:**
- Frontier (open):
    - Stack, LIFO queue
- Explored (closed):
    - Set (for efficiency)

**COST:**
- **Complete:** Not really,
    - Loops (can be fixed)
    - Infinite Trees
- **Optimal:** Not really, 
    - always finds the "leftmost" solution, regardless of depth/cost
- **Space:** 
    - Only has nodes on path to Root + Siblings for each
    - Path is of length (?)
    - all expanded nodes will be added to explored: $O(b^m)$
- **Time:** 
    - if depth is finite, time is $O(b^m)$
    - limited by state space 
    - in theory, can be smaller than $O(b^m)$

**LOOP CHECKING:** 
- **Push Resulting Nodes to the Frontier IF they are Not Already on the Path**

### Breadth-First Search
**Method:**
1. Searches nodes by Breadth First
2. Goes as Wide as Possible 
3. Works it's way around Depth
4. Show Frontier (and Explored sometimes) at Every Step
- **PSEUDO-CODE EXAMPLE:**
    1. `frontier = [root_children, ...]`
    2. `explored = []`
    3. `explored.push() = frontier.pop()` //top_node
    4. `for next(explored.last) in explored.last:` //for every child node of front_node
        - `if next(explored.last) not in frontier[] || explored[]:`
        - `if next(explored.last) == goal: return SUCCESS`
        - `frontier.push(next(explored.last))` //add child node to frontier

**Data Structures:**
- Frontier (open):
    - Queue, FIFO queue
- Explored (closed):
    - Set (for efficiency)

**COST:**
- **Complete:**
    - since s exists, it must be finite- So Yes!
- **Optimal:**
    - Yes (IF all costs are equal)
- **Space:**
    - Has roughly the last tier, so: $O(b^s)$
- **Time:**
    - Processes all nodes above the Shallowest Solution
    - search time takes $O(b^s)$