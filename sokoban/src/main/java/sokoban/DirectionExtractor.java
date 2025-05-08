package sokoban;

import java.io.*;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class DirectionExtractor {

    /*public static void main(String[] args) {
        if (args.length == 0) {
            System.err.println("Veuillez fournir le chemin du fichier en argument.");
            return;
        }

        String filePath = args[0];
        try {
            String directions = extractDirections(filePath);
            System.out.println(directions);
            System.out.println("Nombre de lettres : " + directions.length());
        } catch (IOException e) {
            System.err.println("Erreur lors de la lecture du fichier : " + e.getMessage());
        }
    }*/

    public static String extractDirections(String filePath) throws IOException {
        StringBuilder result = new StringBuilder();
        BufferedReader reader = new BufferedReader(new FileReader(filePath));
        String line;

        while ((line = reader.readLine()) != null) {
            String dir = getDirection(line);
            result.append(dir);
        }

        reader.close();
        return result.toString();
    }

    public static String getDirection(String line) {
        line = line.trim().replaceAll("\\s+", " ");

        // Nouveau pattern plus tolérant
        Pattern pattern = Pattern.compile("\\(\\s*(move|push)\\s+[^\\)]+?(up|down|left|right)\\b.*?\\)");
        Matcher matcher = pattern.matcher(line);

        if (matcher.find()) {
            String direction = matcher.group(2);
            switch (direction) {
                case "up": return "U";
                case "down": return "D";
                case "left": return "L";
                case "right": return "R";
            }
        }

        return "";
    }
}
