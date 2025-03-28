import org.json.JSONObject;
import java.io.File;
import java.io.FileWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class SokobanToPDDL {
    public static void main(String[] args) {
        try {
            String content = new String(Files.readAllBytes(Paths.get(args[0])));
            JSONObject json = new JSONObject(content);
            String level = json.getString("testIn");
            
            String pddl = convertToPDDL(level);
            
            FileWriter writer = new FileWriter(new File("sokoban_problem.pddl"));
            writer.write(pddl);
            writer.close();
            
            System.out.println("Fichier PDDL généré avec succès : sokoban_problem.pddl");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    private static String convertToPDDL(String level) {
        StringBuilder pddl = new StringBuilder();
        pddl.append("(define (problem sokoban)\n");
        pddl.append("  (:domain sokoban)\n");
        pddl.append("  (:objects\n");
        
        String[] lines = level.split("\\n");
        int height = lines.length;
        int width = 0;
        for (String line : lines) {
            width = Math.max(width, line.length());
        }
        
        // Déclarer le joueur, les positions et les boîtes
        pddl.append("    player - agent\n");
        
        // Collecter toutes les positions et boîtes
        List<String> positions = new ArrayList<>();
        int boxCount = 0;
        // Ajouter ceci dans la section d'initialisation du PDDL
        for (int y = 0; y < height; y++) {
            for (int x = 0; x < lines[y].length(); x++) {
                // Vérifier les cases adjacentes
                if(x > 0) pddl.append("    (adjacent pos-" + x + "-" + y + " pos-" + (x-1) + "-" + y + ")\n");
                if(x < width-1) pddl.append("    (adjacent pos-" + x + "-" + y + " pos-" + (x+1) + "-" + y + ")\n");
                if(y > 0) pddl.append("    (adjacent pos-" + x + "-" + y + " pos-" + x + "-" + (y-1) + ")\n");
                if(y < height-1) pddl.append("    (adjacent pos-" + x + "-" + y + " pos-" + x + "-" + (y+1) + ")\n");
            }
        }
        for (int y = 0; y < height; y++) {
            for (int x = 0; x < lines[y].length(); x++) {
                char c = lines[y].charAt(x);
                String pos = "pos-" + x + "-" + y;
                positions.add(pos);
                if (c == '$' || c == '*') {
                    boxCount++;
                }
            }
        }
        // Ajouter les positions
        for (String pos : positions) {
            pddl.append("    ").append(pos).append(" ");
        }
        pddl.append("- location\n");
        
        // Ajouter les boîtes
        for (int i = 1; i <= boxCount; i++) {
            pddl.append("    box").append(i).append(" ");
        }
        pddl.append("- box\n");
        
        pddl.append("  )\n");
        
        pddl.append("  (:init\n");
        List<String> goalPositions = new ArrayList<>();
        int currentBox = 0;
        for (int y = 0; y < height; y++) {
            for (int x = 0; x < lines[y].length(); x++) {
                char c = lines[y].charAt(x);
                String pos = "pos-" + x + "-" + y;
                if (c == '#') {
                    pddl.append("    (wall ").append(pos).append(")\n");
                } else if (c == '@') {
                    pddl.append("    (at player ").append(pos).append(")\n");
                } else if (c == '$' || c == '*') {
                    currentBox++;
                    pddl.append("    (at box").append(currentBox).append(" ").append(pos).append(")\n");
                }
                if (c == '.' || c == '*') {
                    pddl.append("    (is-goal ").append(pos).append(")\n");
                    goalPositions.add(pos);
                }
            }
        }
        pddl.append("  )\n");
        
        pddl.append("  (:goal (and\n");
        for (int i = 1; i <= boxCount; i++) {
            pddl.append("    (or\n");
            for (String goalPos : goalPositions) {
                pddl.append("      (at box").append(i).append(" ").append(goalPos).append(")\n");
            }
            pddl.append("    )\n");
        }
        pddl.append("  ))\n");
        pddl.append(")\n");
        
        return pddl.toString();
    }
}