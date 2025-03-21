#!/bin/bash

#$1 : chemin du répertoire contenant les tests
#$2 : fichier contenant la sortie des tests (pour chaque test, le temps d'exécution avec toutes les heuristiques)
#$3 fichier du domaine
#exemple d'utilisation :
#./taquin/test.sh /home/ecloud/patia/patia/pddl/taquin/pbs_tests /home/ecloud/patia/patia/pddl/taquin/sortie.txt /home/ecloud/patia/patia/pddl/taquin/domain.pddl
echo "">solver_output.log
timeout=600
heuristiques=(AJUSTED_SUM AJUSTED_SUM2 AJUSTED_SUM2M COMBO MAX FAST_FORWARD SET_LEVEL SUM SUM_MUTEX)
for heuristique in "${heuristiques[@]}"
do 
    for file in "$1"/*
    do
        exec_time=$( { time java -cp ./pddl4j-4.0.0.jar -server -Xms2048m -Xmx2048m fr.uga.pddl4j.planners.statespace.HSP $3 "$file" -t $timeout -e $heuristique >> solver_output.log; } 2>&1 | grep real | awk '{print $2}' )
        echo "$heuristique $exec_time" >> "$2"
    done
done
