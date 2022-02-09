Play the game on [CodinGame](https://www.codingame.com/training/hard/sokoban)

Work with maven: mvn clean, mvn compile, mvn test, mvn package

Run with: java --add-opens java.base/java.lang=ALL-UNNAMED \
               -jar target/sokoban-1.0-SNAPSHOT-jar-with-dependencies.jar \
               sokoban.SokobanMain

See solution at http://localhost:8888/test.html

Install pddl4j (https://github.com/pellierd/pddl4j) in your local maven repo:

mvn install:install-file \
   -Dfile=<path-to-file-pddl4j-4.0.0.jar> \
   -DgroupId=fr.uga.pddl4j \
   -DartifactId=pddl4j \
   -Dversion=4.0.0 \
   -Dpackaging=jar \
   -DgeneratePom=true