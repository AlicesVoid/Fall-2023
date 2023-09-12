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

## Evaluation Functions 

## Pruning