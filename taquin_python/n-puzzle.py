from typing import List, Literal
from collections import deque
'''
N-Puzzle problem
'''
    
class NPuzzle:
    
    Algorithm = Literal['bfs', 'dfs', 'astar']
    Move = Literal['up', 'down', 'left', 'right']
    
    Solution = List[Move]
    State = List[int]
    
    UP = 'up'
    DOWN = 'down'
    LEFT = 'left'
    RIGHT = 'right'

    BFS = 'bfs'
    DFS = 'dfs'
    ASTAR = 'astar'
    
    goal_state : State = []
    initial_state : State = []
    
    def __init__(self, dimension : int) -> None:
        self.dimension = dimension
        
    def __init__(self, initial_state : State) -> None:
        self.initial_state = initial_state
        
    def generate(self, dimension : int) -> State:
        m=List [4,0,3,7,1,5,8,2,6]
        self.initial_state = m
        return m
    
    def create_goal(self) -> State:
        m = List [1,2,3,4,5,6,7,8,0]
        self.goal_state = m
        return m
    
    def solve_bfs(self, puzzle : State) -> Solution:
        queue = deque([(puzzle, [])])  # Each element is (state, path_to_state)
        visited = set([tuple(puzzle)])  # Keep track of visited states
        while queue:
            current_state, path = queue.popleft()
        
        # Check if current state is goal state
            if self.is_goal(current_state):
                return path
        
        # Try all possible moves
            for move in [self.UP, self.DOWN, self.LEFT, self.RIGHT]:
                next_state = self.move(current_state.copy(), move)
            
                if next_state is not None:
                # Convert to tuple for hashable type
                    state_tuple = tuple(next_state)
                
                    if state_tuple not in visited:
                        visited.add(state_tuple)
                        queue.append((next_state, path + [move]))
        return []
    
    def solve_dfs(self, puzzle : State) -> Solution:
        
        return []
    
    def solve_astar(self, puzzle : State) -> Solution:
        
        return []
    
    def heuristic(self, puzzle : State) -> int:
        '''Calculate the heuristic value of the puzzle'''
        return 0
    
    def solve(self, puzzle : State, algorithm : Algorithm) -> Solution:
        '''Solve the puzzle using the algorithm'''
        solution : list = []
        
        if algorithm == self.BFS:
            solution = self.solve_bfs(puzzle)
        elif algorithm == self.DFS:
            solution = self.solve_dfs(puzzle)
        elif algorithm == self.ASTAR:
            solution = self.solve_astar(puzzle)
        
        return solution
    
    def is_solvable(self, puzzle : State) -> bool:
        '''Check if the puzzle is solvable'''
        return False
    
    def is_goal(self, puzzle : State) -> bool:
        if puzzle == self.goal_state:
            return True
        else :
            return False
    
    def get_neighbors(self, puzzle : State) -> List[State]:
        '''Get the neighbors of the puzzle'''
        return []
    
    def move(self, puzzle : State, direction : Move) -> State | None:
        '''Move the blank tile in the puzzle'''
        
        new_state = None
        current_state = puzzle.copy()
        size = len(current_state)
        blank_index = current_state.index(0)
        
        if direction == self.UP:
            index = blank_index - self.dimension
            if (index>=0):
                self.current_state[blank_index], self.current_state[index] = self.current_state[index], self.current_state[blank_index]
                
        elif direction == self.DOWN:
            index = blank_index + self.dimension
            if (index< size):
                self.current_state[blank_index], self.current_state[index] = self.current_state[index], self.current_state[blank_index]
        elif direction == self.LEFT:
            if ((blank_index % size) - 1) >= 0:
                index = blank_index - 1
                self.current_state[blank_index], self.current_state[index] = self.current_state[index], self.current_state[blank_index]
        elif direction == self.RIGHT:
            if ((blank_index % size) + 1) < size:
                index = blank_index + 1
                self.current_state[blank_index], self.current_state[index] = self.current_state[index], self.current_state[blank_index]
        new_state = self.current_state
        return new_state
    
    def save_puzzle(self, puzzle : State, filename : str) -> None:
        '''Save the puzzle to a file'''
        pass
    
    def load_puzzle(self, filename : str) -> State:
        '''Load the puzzle from a file'''
        return []