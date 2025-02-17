package ex2;

import java.io.*;
import java.util.*;
import ex1.WSSolver;

public class WSGenerator {

    private static int puzzleSize;
    private static String inputFile, outputFile = "";
    private static File input;
    private static FileWriter output;
    private static ArrayList<String> words = WSSolver.words;
    private static char[][] puzzle;

    public static void main(String[] args) {
        try {
            processArgs(args);
            if (outputFile.isEmpty()) {
                outputFile = "ex2/sopa" + inputFile.split("/")[1].charAt(5) + ".txt";
            }
            output = new FileWriter(outputFile);
            input = new File(inputFile);
            if (WSSolver.noEmptyLines(input)) {
                WSSolver.getWords(input);
            }

            puzzleGenerator(output);

            printOutput();

        } catch (Exception e) {
            System.err.println("\nError: " + e.getMessage());
            System.exit(1);
        }
    }

    private static void processArgs(String args[]) throws Exception {
        if (args.length < 2) {
            throw new Exception("Usage: java WSGenerator -i <inputFile>.txt -s <puzzleSize> -o <outputFile>.txt");
        }

        for (int i = 0; i < args.length; i++) {
            if ("-i".equals(args[i])) {
                if (i + 1 < args.length && validFileExtension(args[i + 1]) && args[i + 1].contains("wlist")) {
                    inputFile = args[i + 1];
                } else {
                    throw new Exception("Invalid input file format or missing argument after -i");
                }
            }
            if ("-s".equals(args[i])) {
                if (i + 1 < args.length) {
                    try {
                        puzzleSize = Integer.parseInt(args[i + 1]);
                        if (puzzleSize <= 0) {
                            throw new Exception("Puzzle size must be a positive integer");
                        }
                    } catch (NumberFormatException e) {
                        throw new Exception("Invalid puzzle size format. Please provide an integer.");
                    }
                } else {
                    throw new Exception("Missing argument after -s");
                }
            }
            if ("-o".equals(args[i])) {
                if (i + 1 < args.length && validFileExtension(args[i + 1])) {
                    outputFile = args[i + 1];
                }
            }
        }
    }

    private static boolean validFileExtension(String file) {
        if (file.endsWith(".txt")) {
            return true;
        }
        return false;
    }

    private static void puzzleGenerator(FileWriter file) throws IOException {
        Random random = new Random();
        puzzle = new char[puzzleSize][puzzleSize];

        insertWordsInPuzzle(words, puzzle);
        // Generate puzzle
        for (int i = 0; i < puzzleSize; i++) {
            for (int j = 0; j < puzzleSize; j++) {
                char c = (char) (random.nextInt('Z' - 'A' + 1) + 'A');
                if (puzzle[i][j] == '\0') {
                    puzzle[i][j] = c;
                }
                file.write(puzzle[i][j]);
            }
            file.write("\n");
        }

        // Write list of words
        Scanner sc = new Scanner(input);
        while (sc.hasNextLine()) {
            file.write(sc.nextLine() + "\n");
        }
        sc.close();

        file.close();
    }

    private static void insertWordsInPuzzle(List<String> words, char[][] puzzle) {
        Random random = new Random();

        for (String word : words) {
            word = word.toUpperCase();
            int wordLength = word.length();
            int direction = random.nextInt(8); // 8 directions (up, down, left, right, diagonals)

            int row = random.nextInt(puzzleSize);
            int col = random.nextInt(puzzleSize);

            // Insert the word into the puzzle based on the chosen direction
            switch (direction) {
                case 0: // Up
                    do {
                        do {
                            col = random.nextInt(puzzleSize);
                            row = random.nextInt(puzzleSize);
                        } while (row - wordLength < 0);
                    } while (insertionAvailable(row, col, direction, wordLength) == false);
                    if (row - wordLength >= 0) {
                        for (int i = 0; i < wordLength; i++) {
                            puzzle[row - i][col] = word.charAt(i);
                        }
                    }
                    break;
                case 1: // Down
                    do {
                        do {
                            col = random.nextInt(puzzleSize);
                            row = random.nextInt(puzzleSize);
                        } while (row + wordLength > puzzleSize);
                    } while (insertionAvailable(row, col, direction, wordLength) == false);
                    if (row + wordLength <= puzzleSize) {
                        for (int i = 0; i < wordLength; i++) {
                            puzzle[row + i][col] = word.charAt(i);
                        }
                    }
                    break;
                case 2: // Left
                    do {
                        do {
                            col = random.nextInt(puzzleSize);
                            row = random.nextInt(puzzleSize);
                        } while (col - wordLength < 0);
                    } while (insertionAvailable(row, col, direction, wordLength) == false);
                    if (col - wordLength >= 0) {
                        for (int i = 0; i < wordLength; i++) {
                            puzzle[row][col - i] = word.charAt(i);
                        }
                    }
                    break;
                case 3: // Right
                    do {
                        do {
                            col = random.nextInt(puzzleSize);
                            row = random.nextInt(puzzleSize);
                        } while (col + wordLength > puzzleSize);
                    } while (insertionAvailable(row, col, direction, wordLength) == false);
                    if (col + wordLength <= puzzleSize) {
                        for (int i = 0; i < wordLength; i++) {
                            puzzle[row][col + i] = word.charAt(i);
                        }
                    }
                    break;
                case 4: // Diagonal up-left
                    do {

                        do {
                            row = random.nextInt(puzzleSize);
                        } while (row - wordLength < 0);
                        do {
                            col = random.nextInt(puzzleSize);
                        } while (col - wordLength < 0);
                    } while (insertionAvailable(row, col, direction, wordLength) == false);
                    if (row - wordLength >= 0 && col - wordLength >= 0) {
                        for (int i = 0; i < wordLength; i++) {
                            puzzle[row - i][col - i] = word.charAt(i);
                        }
                    }
                    break;
                case 5: // Diagonal up-right
                    do {
                        do {
                            row = random.nextInt(puzzleSize);
                        } while (row - wordLength < 0);
                        do {
                            col = random.nextInt(puzzleSize);
                        } while (col + wordLength > puzzleSize);
                    } while (insertionAvailable(row, col, direction, wordLength) == false);
                    if (row - wordLength >= 0 && col + wordLength <= puzzleSize) {
                        for (int i = 0; i < wordLength; i++) {
                            puzzle[row - i][col + i] = word.charAt(i);
                        }
                    }
                    break;
                case 6: // Diagonal down-left
                    do {
                        do {
                            row = random.nextInt(puzzleSize);
                        } while (row + wordLength > puzzleSize);
                        do {
                            col = random.nextInt(puzzleSize);
                        } while (col - wordLength < 0);
                    } while (insertionAvailable(row, col, direction, wordLength) == false);
                    if (row + wordLength <= puzzleSize && col - wordLength >= 0) {
                        for (int i = 0; i < wordLength; i++) {
                            puzzle[row + i][col - i] = word.charAt(i);
                        }
                    }
                    break;
                case 7: // Diagonal down-right
                    do {
                        do {
                            row = random.nextInt(puzzleSize);
                        } while (row + wordLength > puzzleSize);
                        do {
                            col = random.nextInt(puzzleSize);
                        } while (col + wordLength > puzzleSize);
                    } while (insertionAvailable(row, col, direction, wordLength) == false);
                    if (row + wordLength <= puzzleSize && col + wordLength <= puzzleSize) {
                        for (int i = 0; i < wordLength; i++) {
                            puzzle[row + i][col + i] = word.charAt(i);
                        }
                    }
                    break;
            }
        }
    }

    private static boolean insertionAvailable(int row, int col, int direction, int wordLength) {
        switch (direction) {
            case 0:
                for (int i = 0; i < wordLength; i++) {
                    if (puzzle[row - i][col] != '\0')
                        return false;
                }
                break;
            case 1:
                for (int i = 0; i < wordLength; i++) {
                    if (puzzle[row + i][col] != '\0')
                        return false;
                }
                break;
            case 2:
                for (int i = 0; i < wordLength; i++) {
                    if (puzzle[row][col - i] != '\0')
                        return false;
                }
                break;
            case 3:
                for (int i = 0; i < wordLength; i++) {
                    if (puzzle[row][col + i] != '\0')
                        return false;
                }
                break;
            case 4:
                for (int i = 0; i < wordLength; i++) {
                    if (puzzle[row - i][col - i] != '\0')
                        return false;
                }
                break;
            case 5:
                for (int i = 0; i < wordLength; i++) {
                    if (puzzle[row - i][col + i] != '\0')
                        return false;
                }
                break;
            case 6:
                for (int i = 0; i < wordLength; i++) {
                    if (puzzle[row + i][col - i] != '\0')
                        return false;
                }
                break;
            case 7:
                for (int i = 0; i < wordLength; i++) {
                    if (puzzle[row + i][col + i] != '\0')
                        return false;
                }
                break;
        }
        return true;
    }

    private static void printOutput() throws FileNotFoundException {
        File out = new File(outputFile);
        Scanner sc = new Scanner(out);

        while (sc.hasNextLine()) {
            String line = sc.nextLine();
            System.out.println(line);
        }
        sc.close();
    }

}
