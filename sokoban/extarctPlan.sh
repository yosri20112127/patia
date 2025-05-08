#!/bin/bash

# Vérifie si un fichier est passé en argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <fichier_resultat_pddl4j>"
    exit 1
fi

fichier="$1"

# Extraction des lignes contenant le plan d'exécution
grep -E "^[[:space:]]*[0-9]+: *\(" "$fichier"