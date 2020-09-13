package Sokoban;

import com.codingame.gameengine.module.entities.BufferedGroup;
import com.codingame.gameengine.module.entities.GraphicEntityModule;
import com.codingame.gameengine.module.entities.Group;
import com.codingame.gameengine.module.entities.Sprite;
import com.codingame.gameengine.module.tooltip.TooltipModule;

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

    public Board(List<String> input, GraphicEntityModule graphics, TooltipModule tooltipModule) {
        this.graphics = graphics;
        String[] map = input.get(0).split("\\|");
        height = map.length;
        width = map[0].length();

        Group group = graphics.createGroup();
        double scaleX = (double) graphics.getWorld().getWidth()/ (SPRITE_SIZE * width );
        double scaleY = (double)graphics.getWorld().getHeight()/ (SPRITE_SIZE * height );
        group.setScale(Math.min(scaleX, scaleY));

        grid = new Cell[width][height];
        for (int y = 0; y < height; y++) {
            for (int x = 0; x < width; x++) {
                int digit = map[y].charAt(x) - '0';
                grid[x][y] = new Cell(x, y, digit, graphics, group, tooltipModule);
                if (grid[x][y].hasBox()) boxes.add(grid[x][y].getBox());
                if (digit >= 6) pusher = new Pusher(grid[x][y], graphics, group, tooltipModule);
            }
        }

        //BufferedGroup bufferedGroup = graphics.createBufferedGroup().setZIndex(-1).setScale(group.getScaleX());
        Group bufferedGroup = graphics.createGroup().setZIndex(-1).setScale(group.getScaleX());
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
            result.add(width + " " + height + " " + (boxes.size()));
            for (int y = 0; y < height; y++) {
                String line = "";
                for (int x = 0; x < width; x++) {
                    line += grid[x][y].getMapChar();
                }
                result.add(line);
            }
        }
        result.add(pusher.getCell().getInput());
        for (Box box : boxes) result.add(box.getCell().getInput());
        return result;
    }

    public boolean playAction(String action) {
        action = action.toUpperCase();
        int dir = "URDL".indexOf(action);
        if (dir == -1) return false;
        return pusher.move(dir);
    }
}
