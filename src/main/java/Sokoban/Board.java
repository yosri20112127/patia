package Sokoban;

import com.codingame.gameengine.module.entities.BufferedGroup;
import com.codingame.gameengine.module.entities.GraphicEntityModule;
import com.codingame.gameengine.module.entities.Sprite;

import java.util.ArrayList;
import java.util.List;

public class Board {
    private int width;
    private int height;
    private Cell[][] grid;
    private ArrayList<Box> boxes = new ArrayList<>();
    private Pusher pusher;
    public static final int SPRITE_SIZE = 128;

    private GraphicEntityModule graphics;

    public Board(List<String> input, GraphicEntityModule graphics) {
        this.graphics = graphics;
        String[] parts = input.get(0).split(" ");
        width = Integer.parseInt(parts[0]);
        height = Integer.parseInt(parts[1]);
        grid = new Cell[width][height];
        for (int y = 0; y < height; y++) {
            parts = input.get(y + 2).split(" ");
            for (int x = 0; x < width; x++) {
                grid[x][y] = new Cell(x, y, Integer.parseInt(parts[x]), graphics);
                if (grid[x][y].hasBox()) boxes.add(grid[x][y].getBox());
            }
        }
        parts = input.get(1).split(" ");
        pusher = new Pusher(grid[Integer.parseInt(parts[0])][Integer.parseInt(parts[1])], graphics);

        BufferedGroup bufferedGroup = graphics.createBufferedGroup().setZIndex(-1);
        for (int x = 0; x < width; x++) {
            for (int y = 0; y < height; y++) {
                Sprite sprite = grid[x][y].getSprite(graphics);
                sprite.setX(x * SPRITE_SIZE).setY(y * SPRITE_SIZE);
                bufferedGroup.add(sprite);

                grid[x][y].initNeighbors(grid);
            }
        }
    }

    public boolean isWin() {
        return boxes.stream().allMatch(b -> b.isSolved());
    }

    public ArrayList<String> getInput(boolean firstTurn) {
        ArrayList<String> result = new ArrayList<>();
        if (firstTurn) {
            result.add(width + " " + height + " " + (1+boxes.size()));
            for (int y = 0; y < height; y++) {
                String line = "";
                for (int x = 0; x < width; x++) {
                    line += grid[x][y].getMapChar();
                }
                result.add(line);
            }
        }
        result.add(pusher.getInput());
        for (Box box : boxes) result.add(box.getInput());
        return result;
    }

    public boolean playAction(String action) {
        action = action.toUpperCase();
        int dir = "URDL".indexOf(action);
        if (dir == -1) return false;
        return pusher.move(dir);
    }
}
