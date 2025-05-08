import json
import os
import re

class SokobanPDDLGenerator:
    def __init__(self, config_folder="config", output_folder="generated_pddl"):
        self.config_folder = config_folder
        self.output_folder = output_folder
        
        # Créer le dossier de sortie s'il n'existe pas
        if not os.path.exists(output_folder):
            os.makedirs(output_folder)
    
    def parse_map(self, map_string):
        """Parse la chaîne représentant la carte et extrait les positions des éléments"""
        lines = map_string.strip().split('\n')
        height = len(lines)
        width = max(len(line) for line in lines)
        
        walls = []
        boxes = []
        goals = []
        player_pos = None
        
        for y, line in enumerate(lines):
            for x, char in enumerate(line):
                if char == '#':
                    walls.append((x, y))
                elif char == '$':
                    boxes.append((x, y))
                elif char == '.':
                    goals.append((x, y))
                elif char == '@':
                    player_pos = (x, y)
                elif char == '*':  # Boîte sur une cible
                    boxes.append((x, y))
                    goals.append((x, y))
                elif char == '+':  # Joueur sur une cible
                    player_pos = (x, y)
                    goals.append((x, y))
        
        return {
            'width': width,
            'height': height,
            'walls': walls,
            'boxes': boxes,
            'goals': goals,
            'player': player_pos
        }
    
    def generate_problem_pddl(self, level_title, parsed_map):
        """Génère le fichier problem.pddl pour la carte analysée"""
        problem_name = re.sub(r'[^a-zA-Z0-9]', '', level_title).lower()
        
        # Création des objets
        cells = []
        for x in range(parsed_map['width']):
            for y in range(parsed_map['height']):
                if (x, y) not in parsed_map['walls']:
                    cells.append(f"    pos-{x}-{y}")
        
        boxes = [f"    box{i+1}" for i in range(len(parsed_map['boxes']))]
        directions = ["    up", "    down", "    left", "    right"]
        
        # Création de l'état initial
        initial_state = []
        
        # Définir les directions
        initial_state.append("    (opposite up down)")
        initial_state.append("    (opposite down up)")
        initial_state.append("    (opposite left right)")
        initial_state.append("    (opposite right left)")
        
        # Définir les positions voisines et leur direction
        for x in range(parsed_map['width']):
            for y in range(parsed_map['height']):
                if (x, y) not in parsed_map['walls']:
                    # Position en haut
                    if (x, y-1) not in parsed_map['walls'] and y-1 >= 0:
                        initial_state.append(f"    (neighbor pos-{x}-{y} pos-{x}-{y-1} up)")
                    # Position en bas
                    if (x, y+1) not in parsed_map['walls'] and y+1 < parsed_map['height']:
                        initial_state.append(f"    (neighbor pos-{x}-{y} pos-{x}-{y+1} down)")
                    # Position à gauche
                    if (x-1, y) not in parsed_map['walls'] and x-1 >= 0:
                        initial_state.append(f"    (neighbor pos-{x}-{y} pos-{x-1}-{y} left)")
                    # Position à droite
                    if (x+1, y) not in parsed_map['walls'] and x+1 < parsed_map['width']:
                        initial_state.append(f"    (neighbor pos-{x}-{y} pos-{x+1}-{y} right)")
        
        # Position du joueur
        player_x, player_y = parsed_map['player']
        initial_state.append(f"    (at-player pos-{player_x}-{player_y})")
        
        # Position des boîtes
        for i, (box_x, box_y) in enumerate(parsed_map['boxes']):
            initial_state.append(f"    (at-box box{i+1} pos-{box_x}-{box_y})")
        
        # Définir les cibles
        for goal_x, goal_y in parsed_map['goals']:
            initial_state.append(f"    (is-goal pos-{goal_x}-{goal_y})")
        
        # État final (but)
        goal_state = ["    (and"]
        for i in range(len(parsed_map['boxes'])):
            goal_state.append(f"        (on-goal box{i+1})")
        goal_state.append("    )")
        
        # Construire le contenu du fichier problem.pddl
        problem_content = f"""(define (problem {problem_name})
  (:domain sokoban)
  (:objects
{chr(10).join(cells)}
{chr(10).join(boxes)}
{chr(10).join(directions)}
  )
  (:init
{chr(10).join(initial_state)}
  )
  (:goal
{chr(10).join(goal_state)}
  )
)
"""
        return problem_content
    
    def generate_domain_pddl(self):
        """Génère le fichier domain.pddl pour Sokoban"""
        domain_content = """(define (domain sokoban)
  (:requirements :strips :typing :negative-preconditions)
  
  (:predicates
    (neighbor ?from ?to ?dir)  ; La position 'to' est voisine de 'from' dans la direction 'dir'
    (opposite ?dir1 ?dir2)     ; Les directions dir1 et dir2 sont opposées
    (at-player ?pos)           ; Le joueur est à la position pos
    (at-box ?box ?pos)         ; La boîte box est à la position pos
    (is-goal ?pos)             ; La position pos est une cible
    (on-goal ?box)             ; La boîte box est sur une cible
  )

  ; Action pour déplacer le joueur d'une position à une autre
  (:action move
    :parameters (?from ?to ?dir)
    :precondition (and
      (at-player ?from)
      (neighbor ?from ?to ?dir)
      (not (exists (?b) (at-box ?b ?to)))
    )
    :effect (and
      (not (at-player ?from))
      (at-player ?to)
    )
  )

  ; Action pour pousser une boîte
  (:action push
    :parameters (?ppos ?bpos ?tpos ?dir ?box)
    :precondition (and
      (at-player ?ppos)
      (at-box ?box ?bpos)
      (neighbor ?ppos ?bpos ?dir)      ; La boîte est dans la direction 'dir' par rapport au joueur
      (neighbor ?bpos ?tpos ?dir)      ; La case cible est dans la même direction
      (not (exists (?b) (at-box ?b ?tpos)))  ; Pas de boîte à la position cible
    )
    :effect (and
      (not (at-player ?ppos))
      (at-player ?bpos)
      (not (at-box ?box ?bpos))
      (at-box ?box ?tpos)
      (when (is-goal ?tpos)            ; Si la nouvelle position est une cible
        (on-goal ?box)
      )
      (when (and (is-goal ?bpos) (not (is-goal ?tpos)))  ; Si on quitte une cible
        (not (on-goal ?box))
      )
    )
  )
)
"""
        return domain_content
    
    def process_config_file(self, filename):
        """Traite un fichier de configuration JSON et génère les fichiers PDDL"""
        full_path = os.path.join(self.config_folder, filename)
        
        with open(full_path, 'r') as f:
            config = json.load(f)
        
        # Extraire la carte
        map_string = config['testIn']
        
        # Parser la carte
        parsed_map = self.parse_map(map_string)
        
        # Générer les fichiers PDDL
        problem_pddl = self.generate_problem_pddl(filename.split('.')[0], parsed_map)
        domain_pddl = self.generate_domain_pddl()
        
        # Utiliser le nom du fichier source sans l'extension
        base_filename = filename.split('.')[0]
        
        # Écrire les fichiers PDDL
        problem_path = os.path.join(self.output_folder, f"{base_filename}_problem.pddl")
        with open(problem_path, 'w') as f:
            f.write(problem_pddl)
        
        domain_path = os.path.join(self.output_folder, "domain.pddl")
        with open(domain_path, 'w') as f:
            f.write(domain_pddl)
        
        print(f"Fichiers générés :\n - {problem_path}\n - {domain_path}")
        
        return base_filename
    
    def process_all_configs(self):
        """Traite tous les fichiers de configuration JSON dans le dossier de configuration"""
        processed_files = []
        for filename in os.listdir(self.config_folder):
            if filename.endswith('.json'):
                try:
                    base_filename = self.process_config_file(filename)
                    processed_files.append((filename, base_filename))
                    print(f"Fichier traité avec succès: {filename}")
                except Exception as e:
                    print(f"Erreur lors du traitement de {filename}: {e}")
        
        return processed_files

# Exemple d'utilisation
if __name__ == "__main__":
    generator = SokobanPDDLGenerator()
    processed_files = generator.process_all_configs()
    
    print("\nRésumé des fichiers traités:")
    for original, new_base in processed_files:
        print(f"{original} -> {new_base}_problem.pddl")
    print("\nDomain PDDL généré: domain.pddl")