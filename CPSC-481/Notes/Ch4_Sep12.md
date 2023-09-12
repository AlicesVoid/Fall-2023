# Chapter 4: Adversarial Search 

## Zero-Sum Games 
**General Games:**
1. Agents have Independent Utilities 
2. Cooperation, Indifference, Competition are all possible
    - Not Very Important for this class 
    - (we are focused on 2-player zero-sum agmes w/ perfect info.)

**Zero-Sum:**
1. Agents have Opposite Utilities 
2. One Player tries to Maximize Value, other tries to Minimize Value 
3. Single Value that the Two Agents Fixate On 
4. Adversarial- Pure Competition 
    - (i.e: Tic-Tac-Toe, Chess, Othello, etc...)

**Ex1: Halving Game:**
- **RULES:**
    1. Start with N. Players Take Turns: 
    2. Either Decrement Number, or Floor(N/2)
    3. Player who makes it Zero, Wins! 
    4. (as you can see, this is a very literal 'zero sum game')

## Game Trees
**Method:**
- Each Node is a Decision Point for a Player 
- Decisions Alternate at Every Level: 
    1. Root: me (maximizer)
    2. 2nd: opp. (minimizer)
    3. 3rd: me (maximizer)  etc... 
- Leaves are Terminal States 
    - **Their Outcome is Known**
    - A win/loss/tie/points
    - Can assign a **Utility Value** from POV of maximizing player
- Each Root-to-Leaf path is a possible game outcome

## Minimax Algorithm
**Minimax Values:**
- Quantify how good or bad a game decision is
- Calculated by considering all outcomes for a node
    - Recursively 
- **Method:**
    1. Terminal Node -> Part of the Game 
    2. Non-Terminal Node -> Max vs. Min Utility Cost 
        - Minimax Values are These

**Adversarial Search (Minimax):**
- Concept:
    - One Player Maximizes a Utility Value 
        - Minimax = Max Value of Results
    - Other Player Minimizes a Utility Value
        - Minimax = Min Value of Results
- Minimax Seach:
    1. State-Space Search Tree
    2. Players Alternate Turns 
    3. Compute Each Node's Minimax Value:
        - Best achievable utility against an opponent

**Implementation**
- `def value(state):`
    1. `if state == terminal_state: return state.util`
    2. `elif state.next.agent == MAX: return max-value(state)`
    3. `elif state.next.agent == MIN: return min-value(state)`
- `def max-value(state):`
    1. `v = -infty` 
    2. `for each state.next in state:`
        - `v = max(v, value(state.next))`
    3. `return v`
- `def min-value(state):`
    1. `v = infty` 
    2. `for each state.next in state:`
        - `v = min(v, value(state.next))`
    3. `return v`

**COST:**
- just like Exhaustive DFS
- Time: $O(b^m)$
- Space: $O(bm)$

## Evaluation Functions 
**Faster Minimax:**
- Use Depth-Limited Search! (duh)
    - Replace Terminal Values w/ **Evaluation Functions**
- Guarantee of Optimal Play is gone 
- More plies (iterative levels) make a BIG difference
- use Iterative Deepening for an Anytime Algorithm

**Evaluation Functions:**
- Some (possibly weak) estimate of the actual minimax 
- Ideal Function:
    - returns the actual minimax 
    - this basically Never Happens
- Practical Function:
    - weighted linear sum of game-features. 
    - (i.e: adding chess pieces to determine value)
- **NOTE:**
    - Deeper Iteration means More Tolerance on Evaluation Quality
    - Key example of tradeoff between complexity of features vs computation.

## Pruning
**Alpha-Beta Pruning:**
- General Configuration (MIN version)
    1. Computing MIN-VALUE at node n 
    2. Looping over n's children
    3. n's estimate of children's min is dropping 
    4. Who cares about n's val? (MAX DOES)
    5. let a be the best value that MAX can get at any point
    6. if n is worse than a, MAX will avoid it
        - Therefore it's never going to get played 
        - Therefore it can be removed!
- Implementation: 
    - add variables `a = -infty, b = infty`
        - a: MAX's best option on path
        - b: MIN's best option on path
    - for max/min-value: 
        - v = max/min(v, value(successor, a, b))
        - if v >= b/a return v
        - a/b = max(a/b, v)
- NOTE: 
    - (MAX version) is just the opposite of this (symmetric)

**A-B Pruning Properties:**
- Has NO EFFECT on minimax value computed for root 
    - No loss in accuracy
- Values of Intermediate Nodes might be wrong 
    - Important: Children of the root may have the wrong value 
    - Most naive version won't let you do action selection 
- Good Node Ordering improves effectiveness of pruning
    - Try to expand "most promising" children (moves) first
- **COST:**
    - with "perfect ordering" :
    - Time: $O(b^{m/2})$
        - Doubles Solvable Depth! 
