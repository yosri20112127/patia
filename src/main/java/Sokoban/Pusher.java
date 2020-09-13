package Sokoban;

import com.codingame.gameengine.module.entities.GraphicEntityModule;
import com.codingame.gameengine.module.entities.Group;
import com.codingame.gameengine.module.entities.Sprite;

public class Pusher {
    private Cell cell;
    private Sprite sprite;

    public Pusher(Cell cell, GraphicEntityModule graphics, Group group) {
        this.cell = cell;

        this.sprite = graphics.createSprite();
        group.add(sprite);
        updateSprite();
    }

    private void updateSprite() {
        this.sprite.setImage("player_03.png")
                .setX(cell.getX()*Board.SPRITE_SIZE)
                .setY(cell.getY()*Board.SPRITE_SIZE);
    }

    public Cell getCell() {
        return cell;
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
