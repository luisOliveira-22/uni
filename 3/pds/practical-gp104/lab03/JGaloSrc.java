package lab03;

public class JGaloSrc implements JGaloInterface{
    private char[][] board;
    private char player;
    
    private JGaloSrc(char player) {
        board = newBoard();
        player = player;
    }

    private char[][] newBoard() {
        char[][] board = new char[3][3];
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++)
                board[i][j] = ' ';
        }
        return board;
    }

    public static JGaloSrc getInstance(Character firstPlayer) {
        return new JGaloSrc(firstPlayer);
    }

    public char getActualPlayer() {
        return player;
    }

    public boolean setJogada(int lin, int col) {
        if (board[lin - 1][col - 1] == ' ') {
            board[lin - 1][col - 1] = player;
            player = (player == 'X') ? 'O' : 'X';
            return true;
        }
        return false;
    }

    public boolean isFinished() {
        return checkResult() != ' ';
    }

    public char checkResult(){
        for (int i = 0; i < 3; i++) {
            if ((board[i][0] == board[i][1]) && (board[i][1] == board[i][2]) && (board[i][0] != ' ')) {
                return board[i][0];
            }
            if ((board[0][i] == board[1][i]) && (board[1][i] == board[2][i]) && (board[0][i] != ' ')) {
                return board[0][i];
            }
        }
        if ((board[0][0] == board[1][1]) && (board[1][1] == board[2][2]) && (board[0][0] != ' ')) {
            return board[0][0];
        }
        if ((board[0][2] == board[1][1]) && (board[1][1] == board[2][0]) && (board[0][2] != ' ')) {
            return board[0][2];
        }
        return ' ';
    }
}