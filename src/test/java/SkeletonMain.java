import com.codingame.gameengine.runner.SoloGameRunner;

public class SkeletonMain {
    public static void main(String[] args) {
        SoloGameRunner gameRunner = new SoloGameRunner();
        gameRunner.setAgent(Agent1.class);
        gameRunner.setAgent("mono /home/eulerschezahl/Documents/Programming/C#/Sokoban/bin/Debug/Sokoban.exe");
        gameRunner.setTestCase("test21.json");

        gameRunner.start();
    }
}
