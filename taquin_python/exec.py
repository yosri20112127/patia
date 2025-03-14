import os
import time
import matplotlib.pyplot as plt
from multiprocessing import Process, Queue
from npuzzle import load_puzzle, is_solution
from solve_npuzzle import solve_bfs, solve_dfs, solve_astar
from node import Node

# Configuration
PUZZLE_DIR = '../puzzles'
TIME_LIMIT = 10  # Temps limite en secondes
ALGORITHMS = {
    'BFS': solve_bfs,
    'DFS': solve_dfs,
    'A*': solve_astar
}

def run_algorithm(q, algorithm, open_list, close_list=None):
    """Wrapper pour exécuter l'algorithme dans un processus séparé"""
    try:
        if algorithm == solve_astar:
            result = algorithm(open_list, close_list)
        else:
            result = algorithm(open_list)
        q.put(result)
    except Exception as e:
        q.put(e)

def evaluate_algorithm(algorithm, puzzle_path):
    """Évalue un algorithme sur un puzzle donné avec gestion du temps"""
    puzzle = load_puzzle(puzzle_path)
    root = Node(state=puzzle, move=None)
    open_list = [root]
    close_list = []

    q = Queue()
    args = (open_list.copy(), close_list.copy()) if algorithm == solve_astar else (open_list.copy(),)
    
    process = Process(target=run_algorithm, args=(q, algorithm, *args))
    start_time = time.time()
    process.start()
    process.join(TIME_LIMIT)
    
    if process.is_alive():
        process.terminate()
        process.join()
        return TIME_LIMIT, None  # Timeout
    
    duration = time.time() - start_time
    
    if not q.empty():
        result = q.get()
        if isinstance(result, Exception):
            raise result
        return duration, result
    
    return duration, None

# Collecte des résultats
results = {algo: [] for algo in ALGORITHMS}

for filename in os.listdir(PUZZLE_DIR):
    if filename.endswith('.txt'):
        puzzle_path = os.path.join(PUZZLE_DIR, filename)
        
        print(f'\nÉvaluation sur {filename}')
        for algo_name, algo_func in ALGORITHMS.items():
            try:
                duration, solution = evaluate_algorithm(algo_func, puzzle_path)
                valid = False
                
                if solution:
                    # Validation de la solution
                    initial_state = load_puzzle(puzzle_path)
                    valid = is_solution(initial_state, solution)
                
                if solution is not None:
                    status = "✓" if valid else "✗"
                elif duration >= TIME_LIMIT:
                    status = "Timeout"
                else:
                    status = "✗ (No Path)"
                results[algo_name].append((filename, duration, status))
                print(f'{algo_name}: {duration:.2f}s {status}')
                
            except Exception as e:
                print(f'Erreur avec {algo_name}: {str(e)}')
                results[algo_name].append((filename, TIME_LIMIT, 'Erreur'))

# Visualisation des résultats
# Remplacer la section de visualisation par ceci
# Définir les couleurs
COLOR_MAP = {
    '✓': 'green',
    '✗': 'red',
    'Timeout': 'gray',
    'Erreur': 'orange'
}

# Visualisation des résultats
plt.figure(figsize=(15, 10))

for algo_idx, (algo_name, data) in enumerate(results.items(), 1):
    filenames = [e[0] for e in data]
    durations = [e[1] for e in data]
    statuses = [COLOR_MAP[e[2]] for e in data]  # Utilisation correcte ici
    
    # Trier par nom de fichier
    sorted_indices = sorted(range(len(filenames)), key=lambda k: filenames[k])
    filenames = [filenames[i] for i in sorted_indices]
    durations = [durations[i] for i in sorted_indices]
    statuses = [statuses[i] for i in sorted_indices]
    
    plt.subplot(len(ALGORITHMS), 1, algo_idx)
    plt.bar(filenames, durations, color=statuses)
    plt.title(algo_name)
    plt.ylabel('Temps (s)')
    plt.xticks(rotation=45, ha='right')
    plt.ylim(0, TIME_LIMIT * 1.2)

plt.tight_layout()
plt.show()
print('Fin de l\'évaluation')