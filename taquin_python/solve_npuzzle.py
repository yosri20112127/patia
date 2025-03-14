
from npuzzle import (Solution,
                     State,
                     Move,
                     UP, 
                     DOWN, 
                     LEFT, 
                     RIGHT,
                     get_children,
                     is_goal,
                     is_solution,
                     load_puzzle,
                     to_string,
                     create_goal)
from node import Node
from typing import Literal, List
import argparse
import math
import time

BFS = 'bfs'
DFS = 'dfs'
ASTAR = 'astar'

Algorithm = Literal['bfs', 'dfs', 'astar']

def solve_bfs(open : List[Node]) -> Solution:
    '''Solve the puzzle using the BFS algorithm'''
    dimension = int(math.sqrt(len(open[0].get_state())))
    moves = [UP, DOWN, LEFT, RIGHT]
    while open:
        node = open.pop(0)
        if is_goal(node.get_state()):
            return node.get_path()
        puzzle = node.get_state()
        k = node.cost
        #print('k = ', k)
        children = get_children(puzzle, moves, dimension)
        for child in children:
            n = Node(state = child[0], move = child[1], parent = node, cost = k + 1)
            open.append(n)
    return []

def solve_dfs(open_list: List[Node]) -> Solution:
    '''Solve the puzzle using the DFS algorithm (optimized version)'''
    visited = set()
    stack = open_list.copy()
    
    while stack:
        node = stack.pop()
        state_key = tuple(node.get_state())
        
        if state_key in visited:
            continue
            
        visited.add(state_key)
        
        if is_goal(node.get_state()):
            return node.get_path()
        
        children = get_children(
            node.get_state(), 
            [UP, DOWN, LEFT, RIGHT], 
            int(math.sqrt(len(node.get_state())))
        )
        
        # Ajout inverse pour maintenir l'ordre DFS
        for child in reversed(children):
            child_state = tuple(child[0])
            if child_state not in visited:
                new_node = Node(
                    state=child[0],
                    move=child[1],
                    parent=node,
                    cost=node.cost + 1
                )
                stack.append(new_node)
    
    return []

def solve_astar(open : List[Node], close : List[Node]) -> Solution:
    '''Solve the puzzle using the A* algorithm'''
    dimension = int(math.sqrt(len(open[0].get_state())))
    moves = [UP, DOWN, LEFT, RIGHT]
    
    while open:
        open.sort(key=lambda node: node.cost + heuristic(node))
        node = open.pop(0)
        close.append(node)
        
        if is_goal(node.get_state()):
            return node.get_path()
        
        puzzle = node.get_state()
        k = node.cost
        children = get_children(puzzle, moves, dimension)
        
        for child in children:
            child_node = Node(state=child[0], move=child[1], parent=node, cost=k + 1)
            if child_node not in close and child_node not in open:
                open.append(child_node)
            elif child_node in open:
                existing_node = open[open.index(child_node)]
                if child_node.cost < existing_node.cost:
                    open.remove(existing_node)
                    open.append(child_node)
    
    return []

def heuristic(node: Node) -> int:
    goal = create_goal(int(math.sqrt(len(node.get_state()))))
    dimension = int(math.sqrt(len(goal)))
    heuristic = 0
    for i, value in enumerate(node.get_state()):
        if value != 0:  # Ignorer la case vide
            goal_index = goal.index(value)
            # Calculer les coordonnées (x, y) actuelles et cibles
            x1, y1 = i % dimension, i // dimension
            x2, y2 = goal_index % dimension, goal_index // dimension
            heuristic += abs(x1 - x2) + abs(y1 - y2)
    return heuristic

def main():
    parser = argparse.ArgumentParser(description='Load an n-puzzle and solve it.')
    parser.add_argument('filename', type=str, help='File name of the puzzle')
    parser.add_argument('-a', '--algo', type=str, choices=['bfs', 'dfs', 'astar'], required=True, help='Algorithm to solve the puzzle')
    parser.add_argument('-v', '--verbose', action='store_true', help='Increase output verbosity')
    
    args = parser.parse_args()
    
    puzzle = load_puzzle(args.filename)
    
    if args.verbose:
        print('Puzzle:\n')
        print(to_string(puzzle))
    
    if not is_goal(puzzle):   
         
        root = Node(state = puzzle, move = None)
        open = [root]
        
        if args.algo == BFS:
            print('BFS\n')
            start_time = time.time()
            solution = solve_bfs(open)
            duration = time.time() - start_time
            if solution:
                print('Solution:', solution)
                print('Valid solution:', is_solution(puzzle, solution))
                print('Duration:', duration)
            else:
                print('No solution')
        elif args.algo == DFS:
            print('DFS')
            solution = solve_dfs(open)
            print ("la solution est : ",solution)
        elif args.algo == ASTAR:
            print('A*')
            start_time = time.time()
            solution = solve_astar(open, [])
            duration = time.time() - start_time
            if solution:
                print('Solution:', solution)
                print('Valid solution:', is_solution(puzzle, solution))
                print('Duration:', duration)
            else:
                print('No solution')
    else:
        print('Puzzle is already solved')
    
if __name__ == '__main__':
    main()