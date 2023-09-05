# Chapter 3.4 More Uninformed Searches #

## Uninformed Search

### DFS and BFS Overview
**DFS**
- Advantages:
    - Less memory needed compared to BFS (lin vs exp)
- Disadvantages:
    - Not Complete 
    - Not Optimal 
    - Infinite Loops

**BFS**
- Advantages: 
    - Guaranteed to find the Shortest Path (unweighted)
- Disadvantages:
    - Space Complexity is Larger than DFS

### Time vs Space Complexity
- Note that Space Requirement is a MUCH MORE SERIOUS ISSUE 
    - i.e: having 110 at Depth 2 means Depth 16 is Unfeasible    

### Iterative Deepening (IDS)
**Methodology:**
- Get the best of Both Worlds 
    - Run a DFS w/ Depth Limit 1, if no solution? iterate

**COST:**
- Same Time Comp. as BFS
- Space Comp: $O(bm)$
    - Linear benefits of DFS
- The Redundnacy is Worth It 

### Uniform Cost Search (UCS)
**Methodology**
- List Nodes in Increasing Path Cost 
- Always Expand the Cheapest Node First 
- Uses a **Frontier Priority Queue:**
    - Top Item on the Frontier Queue is always the Cheapest Item
- Only stops after Expanding a Goal Node

**COST:**
- **Time Complexity:** $O(b^ {C^* / \epsilon})$
    - Solution costs $C*$ and arcs cost at least $\epsilon$
    - Exponential in it's Effective Depth
- **Space Complexity:** $O(b^ {C^* / \epsilon})$
    - Same as Time Complexity
- **Complete:** Yes, but:
    - Best Solution is Finite Cost 
    - Min. Edge Cost is Positive
- **Optimal:** YES!

**Overall:**
- UCS is Complete and Optimal
- Cons:
    - Explores Options in Every Direction
    - No Information about Goal Location
- Improvements:
    - Consider the Distance From Goal too 

### Dijsktra's
- Has no 'goal' (UNLIKE UCS)
    - Finds Shortest Paths to All Nodes (UNLIKE UCS) 
- Knows all the Vertices/Edges before starting (UNLIKE UCS)
- Works with Infinite Graphs 

## Summary:
- **Breadth-first search (BFS)** 
    - Expand the shallowest node
- **Depth-first search (DFS)** 
    - Expand the deepest node
- **Depth-limited search (DLS)** 
    - Depth first search with a depth limit
- **Iterative-deepening search (IDS)** 
    - DLS with increasing limit
- **Uniform-cost search (UCS)** 
    - Expand the least cost node

