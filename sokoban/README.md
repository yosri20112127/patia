Play the game on [CodinGame](https://www.codingame.com/training/hard/sokoban)

Maven is needed.

Install pddl4j (https://github.com/pellierd/pddl4j) in your local maven repo:
```
mvn install:install-file \
   -Dfile=./pddl4j-4.0.0.jar \
   -DgroupId=fr.uga \
   -DartifactId=pddl4j \
   -Dversion=4.0.0 \
   -Dpackaging=jar \
   -DgeneratePom=true
 ```  
Work with maven: mvn clean, mvn compile, mvn test, mvn package

Run with: 
````

````
or (after mvn package)
```
java --add-opens java.base/java.lang=ALL-UNNAMED \
      -server -Xms2048m -Xmx2048m \
      -cp target/sokoban-1.0-SNAPSHOT-jar-with-dependencies.jar \
      sokoban.SokobanMain
```
Sorry ```mvn exec:java``` has still an open issue ("Directory src/main/resources/view/assets not found.")

See planning solutions at http://localhost:8888/test.html
generated_pddl/scoria_2___level_10_problem.pddl


Détails d'implémentation
Voici les étapes principales du fonctionnement du projet :

1)Génération des fichiers PDDL
La première étape consiste à parser tous les fichiers test[i].json situés dans le dossier config/ en utilisant le script Parser.py.
Ce script génère automatiquement les fichiers domain.pddl et problem.pddl, qui sont ensuite stockés dans le dossier generated_pddl/.

2)Résolution des problèmes PDDL
Une fois les fichiers PDDL générés, on exécute le script reformule.sh.
Ce script permet de résoudre chaque problème PDDL à l'aide de PDDL4J, en utilisant le fichier domain.pddl et la stratégie de planification FAST_FORWARD.
Les plans (séquences d'actions) extraits sont ensuite enregistrés dans des fichiers texte, dans le dossier solutions/ sous le format solutions/test[i].txt.

3)Extraction des mouvements
Pour convertir les plans PDDL en une chaîne de mouvements exploitables par le jeu (ex : "DURL..."), on utilise le script DirectionExtractor.java.
Ce script prend en entrée un fichier solutions/test[i].txt et génère une chaîne représentant les mouvements du personnage principal.

4)Configuration des tests dans le jeu
Pour exécuter le jeu avec un test particulier :

Dans le fichier SokobanMain.java, spécifiez le fichier d'entrée JSON, par exemple test[i].json.

Dans le fichier Agent.java, spécifiez le chemin du fichier solution correspondant, par exemple solutions/test[i].txt.

5)Exécution finale
Une fois les fichiers correctement configurés, lancez le script exec.sh.
Ce script compile le projet avec Maven et génère l'URL de l'interface du jeu, prête à être utilisée dans le navigateur.