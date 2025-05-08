package sokoban;

import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;


public class Agent {
    public static void main(String[] args) {
        String solution = "";
        try{
        DirectionExtractor directionExtractor = new DirectionExtractor();
        solution = directionExtractor.extractDirections("solutions/test16.txt");
        //System.out.println("Solution : " + solution);
        }
        catch (FileNotFoundException e) {
            System.err.println("Fichier non trouvé : " + e.getMessage());
        }
        catch (IOException e) {
            System.err.println("Erreur d'entrée/sortie : " + e.getMessage());
        }
        catch (Exception e) {
            System.err.println("Erreur lors de l'extraction des directions : " + e.getMessage());
        }
        for (char c : solution.toCharArray()) System.out.println(c);
    }
}
