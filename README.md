Play the game on [CodinGame](https://www.codingame.com/training/hard/sokoban)

Install pddl4j (https://github.com/pellierd/pddl4j) in your local maven repo:

mvn install:install-file \
   -Dfile=<path-to-file-pddl4j-4.0.0.jar> \
   -DgroupId=fr.uga.pddl4j \
   -DartifactId=pddl4j \
   -Dversion=4.0.0 \
   -Dpackaging=jar> \
   -DgeneratePom=true