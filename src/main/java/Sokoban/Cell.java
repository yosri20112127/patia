package Sokoban;

import com.codingame.gameengine.module.entities.GraphicEntityModule;
import com.codingame.gameengine.module.entities.Group;
import com.codingame.gameengine.module.entities.Sprite;
import com.codingame.gameengine.module.tooltip.TooltipModule;

public class Cell {
    private TooltipModule tooltipModule;
    private int x;
    private int y;
    private Cell[] neighbors = new Cell[4];
    private boolean wall;
    private boolean dropzone;
    private Box box;

    public Cell(int x, int y, int digit, GraphicEntityModule graphics, Group group, TooltipModule tooltipModule) {
        this.tooltipModule = tooltipModule;
        this.x = x;
        this.y = y;
        wall = digit == 1;
        dropzone = digit == 3 || digit == 5;
        if (digit == 4 || digit == 5) box = new Box(this, graphics, group, tooltipModule);
    }

    public int getX() {
        return x;
    }

    public int getY() {
        return y;
    }

    public boolean isWall() {
        return wall;
    }

    public boolean isDropzone() {
        return dropzone;
    }

    public Box getBox() {
        return box;
    }

    public boolean hasBox() {
        return box != null;
    }

    public boolean isFree() {
        return !isWall() && !hasBox();
    }

    public Sprite getSprite(GraphicEntityModule graphics) {
        if (isWall()) return graphics.createSprite().setImage("block_06.png");
        if (isDropzone()) {
            Sprite sprite = graphics.createSprite().setImage("ground_01.png");
            tooltipModule.setTooltipText(sprite, "TARGET\nx: " + getX() + "\ny: " + getY());
            return sprite;
        }
        return graphics.createSprite().setImage("ground_04.png");
    }

    public char getMapChar() {
        if (isWall()) return '#';
        if (isDropzone()) return '*';
        return '.';
    }

    public String getInput() {
        return x + " " + y;
    }

    public void initNeighbors(Cell[][] grid) {
        if (y > 0) neighbors[0] = grid[x][y - 1];
        if (x + 1 < grid.length) neighbors[1] = grid[x + 1][y];
        if (y + 1 < grid[0].length) neighbors[2] = grid[x][y + 1];
        if (x > 0) neighbors[3] = grid[x - 1][y];
    }

    public Cell getNeighbor(int dir) {
        return neighbors[dir];
    }

    public void setBox(Box box) {
        this.box = box;
    }
}
