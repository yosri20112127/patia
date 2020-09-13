package Sokoban;

import com.codingame.gameengine.module.entities.GraphicEntityModule;
import com.codingame.gameengine.module.entities.Sprite;

public class Box {
    private Cell cell;
    private Sprite sprite;
    private GraphicEntityModule graphics;

    public Box(Cell cell, GraphicEntityModule graphics) {
        this.cell = cell;
        this.sprite = graphics.createSprite();
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

    public String getInput() {
        return "BOX " + cell.getInput();
    }

    public void moveTo(Cell boxNext) {
        cell.setBox(null);
        boxNext.setBox(this);
        this.cell = boxNext;
        updateSprite();
    }
}
