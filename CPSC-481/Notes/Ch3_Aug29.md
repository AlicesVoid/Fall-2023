# Chapter 3: State Space #

## Problem Solving Agents

### State Space Search 
- **State**
    - Representation for a problem solving step 
    - Involves Essential **Available Information** and **Methods**
- **State Space**
    - A set of All Possible States 
- **State Space Search** 
    - General problem solving strategy to solving difficult problems
    - Humans often use this to solve problems 
    - Can solve (almost) all problems if resources/time are unlimited

### State Representation 
- **Expressiveness** and **Efficiency**
    - Need to optimize the trade-off between Expressiveness and Efficiency
    - Requires a Powerful Representation Scheme to solve AI Problems
- **Different Levels of State Representation:**
    - Conceptual Representation (State)
    - Symbolic Representation (Graph)
    - Computer Representation (Data Structure)

### Graphs 
- **Review:**
    1. Nodes/Vertices 
        - Points on a Graph
    2. Arcs/Edges 
        - Lines on a Graph
        - Ordered Pairs of Nodes
    3. Endpoints 
        - Two Vertices on an Edge 
    4. Incidents 
        - All Edges connecting to a Vertex
    5. Adjacent 
        - Two Vertices connected by an Edge 
    6. Degree
        - How many Edges on a Vertex
    7. Path 
        - Sequence of Edges 
        - Begins/Ends with a Vertex 
    8. Cycle
        - Path that Starts/Ends with the Same Vertex
- **Trees Review:**
    1. Root Node 
    2. Parent/Children Node 
    3. Sibling Node

### Problem Space 
- State Space:
    - Set of States representing the possible configs of the world
- Set of Operators/Actions: 
    - Change One State into Another State 
- **Problem Space:**
    - **States** are the **Nodes** 
    - **Edges** are the **Operators** 

## Search Algorithms 
- **Search Problems:**
    1. State Space
    2. Initial State and Goal State 
    3. Actions: 
        - Finite set of Actions per Specific State
    4. Transition Model:
        - Describes what each Action does 
        - RESULT(s, a)
    5. Action-Cost Function:
        - Numeric Cost of applying Action a to get to State s'
        - ACTION-COST(s, a, s')
- **Search Algorithms:**
    1. ""copy-paste here's how graphs work"" 
    2. Frontiers: 
        - Search Algos need to account for the Unknown (Frontier)
    3. Queue Types
        - Queues are often used to store Frontiers:
            - {IS-EMPTY, POP, TOP, ADD}
        - Queue Types:
            - FIFO, LIFO, Priority

### Search Strategies 
**Strategies Definitions:**
- Strats are defined by their **Order of Node Expansion**
- Strategy Evaluations 
    - Completeness
        - do we always find a solution?
    - Optimality
        - do we always find the lowest-cost solution?
    - Time Complexity 
        - Number of Nodes generated/expanded
    - Space Complexity
        - Maximum number of Nodes in memory
- **Complexity Measurements:**
    - b: max branching factor of the search tree
    - d: depth of the least-cost solution 
    - m: maximum depth of the state space (may be infinite)

### Branching Factors
- Number of next states from a given state
- Number of children of a node 
- Can vary at different positions/levels of graph or tree
- How many moves can you do in a given position?
- **State Space Complexity:**
    - The Number of States in a Problem's State Space 
    - State Space Explosion (lots of these exist...)