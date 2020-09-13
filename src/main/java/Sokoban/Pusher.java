package Sokoban;

import com.codingame.gameengine.module.entities.GraphicEntityModule;
import com.codingame.gameengine.module.entities.Sprite;

public class Pusher {
    private Cell cell;
    private Sprite sprite;
    private GraphicEntityModule graphics;

    public Pusher(Cell cell, GraphicEntityModule graphics) {
        this.cell = cell;
        this.graphics = graphics;

        this.sprite = graphics.createSprite();
        updateSprite();
    }

    private void updateSprite() {
        this.sprite.setImage("player_03.png")
                .setX(cell.getX()*Board.SPRITE_SIZE)
                .setY(cell.getY()*Board.SPRITE_SIZE);
    }

    public String getInput() {
        return "PUSHER " + cell.getInput();
    }

    public boolean move(int dir) {
        Cell next = cell.getNeighbor(dir);
        if (next == null || next.isWall()) return false;
        if (next.hasBox()) {
            Cell boxNext = next.getNeighbor(dir);
            if (boxNext == null || !boxNext.isFree()) return false;
            next.getBox().moveTo(boxNext);
        }
        this.cell = next;
        this.updateSprite();
        return true;
    }
}
