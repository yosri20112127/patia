#!/bin/bash
folder="prob"
for file in "$folder"/*.pddl 
do
val=$(echo $file | cut -d'/' -f2 | cut -d'.' -f1)
fich="solutions/${val}.txt"
echo "Processing $fich"
java -cp ./pddl4j-4.0.0.jar -server -Xms2048m -Xmx2048m fr.uga.pddl4j.planners.statespace.HSP domain.pddl $file -t 2000 -e FAST_FORWARD | grep -E '^[0-9]{2}:'  > $fich
done
