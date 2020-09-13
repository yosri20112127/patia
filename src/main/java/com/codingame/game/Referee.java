package com.codingame.game;
import java.util.List;

import Sokoban.Board;
import com.codingame.gameengine.core.AbstractPlayer.TimeoutException;
import com.codingame.gameengine.core.AbstractReferee;
import com.codingame.gameengine.core.SoloGameManager;
import com.codingame.gameengine.module.entities.GraphicEntityModule;
import com.google.inject.Inject;

public class Referee extends AbstractReferee {
    @Inject
    private SoloGameManager<Player> gameManager;
    @Inject
    private GraphicEntityModule graphicEntityModule;
    private Board board;

    @Override
    public void init() {
        gameManager.setMaxTurns(600);
        gameManager.setFrameDuration(300);

        List<String> input = gameManager.getTestCaseInput();
        board = new Board(input, graphicEntityModule);
    }

    @Override
    public void gameTurn(int turn) {
        Player player = gameManager.getPlayer();
        for (String line : board.getInput(turn == 1)) {
            player.sendInputLine(line);
        }
        player.execute();

        try {
            List<String> outputs = player.getOutputs();
            if (!board.playAction(outputs.get(0))) gameManager.loseGame("invalid move");
        } catch (TimeoutException e) {
            gameManager.loseGame("timeout");
        }

        if (board.isWin()) gameManager.winGame();
    }
}
