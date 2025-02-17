package ex1;

public class Game implements JGaloInterface {
    static int plays = 0;
    static char positions[][] = new char[3][3];
    static char result = ' ';
    char p1;
    char p2;

    public Game() {
        this.p1 = 'X';
        this.p2 = 'O';
    }

    public Game(char ip) {
        if (ip == 'O') {
            this.p1 = 'O';
            this.p2 = 'X';
        } else {
            this.p1 = 'X';
            this.p2 = 'O';
        }
    }

    @Override
    public char getActualPlayer() {
        return (plays % 2 == 0) ? p1 : p2;
    }

    @Override
    public boolean setJogada(int lin, int col) {
        positions[lin - 1][col - 1] = getActualPlayer();
        plays++;
        return true;
    }

    @Override
    public char checkResult() {
        // Diagonal '/'
        if (positions[0][0] == positions[1][1] && positions[1][1] == positions[2][2]
                && positions[0][0] != '\0')
            return positions[0][0];

        // Diagonal '\'
        if (positions[2][0] == positions[1][1] && positions[1][1] == positions[0][2]
                && positions[2][0] != '\0')
            return positions[2][0];
        for (int i = 0; i < positions.length; i++) {
            // Check Horinzontal
            if (positions[i][0] == positions[i][1] && positions[i][1] == positions[i][2]
                    && positions[i][0] != '\0')
                return positions[i][0];

            // Check Vertically
            if (positions[0][i] == positions[1][i] && positions[1][i] == positions[2][i]
                    && positions[0][i] != '\0')
                return positions[0][i];

        }
        return ' ';
    }

    @Override
    public boolean isFinished() {
        if (plays > 8 || checkResult() != ' ')
            return true;
        return false;
    }
}
