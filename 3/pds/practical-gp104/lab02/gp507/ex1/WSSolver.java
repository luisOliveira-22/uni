package ex1;
import java.io.*;
import java.util.*;

public class WSSolver {
    private static char[][] puzzle;
    private static String outFile;
    private static int[][] solvedPuzzle;
    private static StringBuilder wordsOutput = new StringBuilder();
    public static ArrayList<String> words = new ArrayList<String>();

    public static void main(String[] args) throws FileNotFoundException {

        if (args.length < 1) {
            System.err.println("Usage: java WSSolver <filename>.txt");
            System.exit(1);
        }

        File f = new File(args[0]);
        outFile = "ex1/out" + args[0].split("/")[1].charAt(5) + ".txt";
        System.out.println(outFile);
        try {
            if (noEmptyLines(f)) {
                createMatrix(f);
                getWords(f);
                searchWords();
                printSolution();
                generateOutput();
            }
        } catch (Exception e) {
            System.err.println("\nError: " + e.getMessage());
            System.exit(1);
        }

    }

    public static boolean noEmptyLines(File f) throws Exception {
        Scanner sc = new Scanner(f);

        while (sc.hasNextLine()) {
            String line = sc.nextLine();
            if (line.trim().isEmpty()) {
                sc.close();
                throw new Exception("File contains empty line(s)");
            }
        }

        sc.close();
        return true;
    }

    private static void createMatrix(File f) throws Exception {
        Scanner sc = new Scanner(f);
        String line;
        int n_rows = 0;
        int n_cols = 0;

        while (sc.hasNextLine()) {
            line = sc.nextLine();
            if (line.matches("[A-Z]*")) { // Stop reading when it reaches the words to find
                n_cols = Math.max(n_cols, line.length());
                n_rows++;
            }
        }
        sc.close();

        if (n_cols > 40 || n_rows > 40) {
            throw new Exception("Puzzle is bigger than 40x40\n");
        }

        if (n_rows != n_cols) {
            throw new Exception("Puzzle is not a square matrix\n");
        }

        // Initialize matrix
        puzzle = new char[n_rows][n_cols];

        // Initialize matrix for found words
        solvedPuzzle = new int[n_rows][n_cols];

        fillMatrix(n_rows, n_cols, f);
    }

    private static void fillMatrix(int n_rows, int n_cols, File f) throws Exception {
        Scanner sc = new Scanner(f);
        int i = 0;

        while (i != n_rows) {
            String line = sc.nextLine();
            // Check if every char is in Caps
            if (line.matches("[A-Z]*")) {
                // Add char
                int j = 0;
                for (char c : line.toCharArray()) {
                    puzzle[i][j] = c;
                    j++;
                }
                i++;
            } else {
                sc.close();
                throw new Exception("Every puzzle letter must be capital\n");
            }
        }

        sc.close();
    }

    public static void getWords(File f) throws Exception {
        Scanner sc = new Scanner(f);

        while (sc.hasNextLine()) {
            String line = sc.nextLine();
            if (!line.matches("[A-Z]*")) {
                for (String word : line.split("[\\s,;]+")) {
                    if (word.matches("[a-z A-Z]*")) {
                        words.add(word);
                    } else {
                        System.err.printf("\nError: Word \"%s\" was ignored because contains non alphabetical chars",
                                word);
                    }
                }
            }
        }

        sc.close();

    }

    private static void searchWords() throws Exception {
        for (String word : words) {
            searchWord(word);
        }
    }

    private static boolean searchWord(String word) throws Exception {
        int rows = puzzle.length;
        int cols = puzzle[0].length;

        // Check in all possible directions
        for (int row = 0; row < rows; row++) {
            for (int col = 0; col < cols; col++) {
                if (searchInDirection(word, row, col, 1, 0) || // RIGHT
                        searchInDirection(word, row, col, -1, 0) || // LEFT
                        searchInDirection(word, row, col, 0, 1) || // DOWN
                        searchInDirection(word, row, col, 0, -1) || // UP
                        searchInDirection(word, row, col, -1, -1) || // UPLEFT
                        searchInDirection(word, row, col, -1, 1) || // UPRIGHT
                        searchInDirection(word, row, col, 1, -1) || // DOWNLEFT
                        searchInDirection(word, row, col, 1, 1)) { // DOWNRIGHT
                    return true;
                }
            }
        }
        return false;
    }

    private static boolean searchInDirection(String word, int startRow, int startCol, int rowDir, int colDir)
            throws FileNotFoundException {
        int wordLength = word.length();
        int size = puzzle.length;

        int endRow = startRow + (wordLength - 1) * rowDir;
        int endCol = startCol + (wordLength - 1) * colDir;

        // Check if the word fits within the puzzle boundaries
        if (endRow < 0 || endRow >= size || endCol < 0 || endCol >= size) {
            return false;
        }

        // Check if the word matches in the given direction
        for (int i = 0; i < wordLength; i++) {
            char puzzleChar = Character.toLowerCase(puzzle[startRow + i * rowDir][startCol + i * colDir]);
            char wordChar = Character.toLowerCase(word.charAt(i));
            if (puzzleChar != wordChar) {
                return false;
            }
        }
        for (int i = 0; i < wordLength; i++) {
            solvedPuzzle[startRow + i * rowDir][startCol + i * colDir] = 1;
        }

        String direction = getDirection(rowDir, colDir);
        wordsOutput.append(
                String.format("%-20s %-5d %-8s %-10s\n", word, word.length(), (startRow + 1) + "," + (startCol + 1),
                        direction));
        System.out.printf("%-20s %-5d %-8s %-10s\n", word, word.length(), (startRow + 1) + "," + (startCol + 1),
                direction);

        return true;
    }

    private static String getDirection(int rowDir, int colDir) {
        if (rowDir == 1) {
            if (colDir == 0)
                return "Down";
            else if (colDir == 1)
                return "DownRight";
            return "DownLeft";
        } else if (rowDir == -1) {
            if (colDir == 0)
                return "Up";
            else if (colDir == 1)
                return "UpRight";
            return "UpLeft";
        } else {
            if (colDir == 1) {
                return "Right";
            }
            return "Left";
        }
    }

    private static void printSolution() throws FileNotFoundException {
        System.out.println();
        for (int i = 0; i < puzzle.length; i++) {
            for (int j = 0; j < puzzle[i].length; j++) {
                if (solvedPuzzle[i][j] == 1)
                    System.out.printf(puzzle[i][j] + " ");
                else
                    System.out.printf(". ");
            }
            System.out.println();
        }
    }

    private static void generateOutput() throws Exception {
        File output = new File(outFile);

        try (PrintWriter writer = new PrintWriter(output)) {

            writer.print(wordsOutput);

            writer.println();

            for (int i = 0; i < puzzle.length; i++) {
                for (int j = 0; j < puzzle[i].length; j++) {
                    if (solvedPuzzle[i][j] == 1) {
                        writer.print(puzzle[i][j] + " ");
                    } else {
                        writer.print(". ");
                    }
                }
                writer.println();
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("Error writing output to file");
        }
    }

}
