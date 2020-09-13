package Sokoban;

import com.codingame.gameengine.module.entities.GraphicEntityModule;
import com.codingame.gameengine.module.entities.Group;
import com.codingame.gameengine.module.entities.Sprite;

public class Box {
    private Cell cell;
    private Sprite sprite;

    public Box(Cell cell, GraphicEntityModule graphics, Group group) {
        this.cell = cell;
        this.sprite = graphics.createSprite();
        group.add(sprite);
        updateSprite();
    }

    public void updateSprite() {
        sprite.setImage(isSolved() ? "crate_42.png" : "crate_07.png")
                .setX(cell.getX()*Board.SPRITE_SIZE)
                .setY(cell.getY()*Board.SPRITE_SIZE);
    }

    public boolean isSolved() {
        return cell.isDropzone();
    }

    public Cell getCell() {
        return cell;
    }

    public void moveTo(Cell boxNext) {
        cell.setBox(null);
        boxNext.setBox(this);
        this.cell = boxNext;
        updateSprite();
    }
}
