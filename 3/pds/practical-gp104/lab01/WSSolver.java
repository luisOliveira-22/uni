import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class WSSolver {
    public static void main(String[] args) {
        if (args.length != 1) {
            System.out.println("Por favor, forneça o nome do arquivo como argumento.");
            return;
        }

        String fileName = args[0];

        try {
            BufferedReader br = new BufferedReader(new FileReader(fileName));
            StringBuilder conteudo = new StringBuilder();
            String linha;

            while ((linha = br.readLine()) != null) {
                conteudo.append(linha).append(System.lineSeparator());
            }
            br.close();

            // Separar letras maiúsculas
            char[][] letras = separarLetras(conteudo.toString());
            String[] palavras = separarPalavras(conteudo.toString());

            // Verificar tamanho máximo da sopa de letras
            if (letras.length > 40 || letras.length != letras[0].length) {
                System.out.println("Erro: A sopa de letras deve ser quadrada e ter no máximo 40x40.");
                return;
            }

            // Verificar letras maiúsculas
            if (!verificarLetrasMaiusculas(letras)) {
                System.out.println("Erro: As letras da sopa de letras devem ser maiúsculas.");
                return;
            }

            for (String palavra : palavras) {
                printInfo(letras, palavra);
            }

            printSopaDeLetras(letras, palavras);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static char[][] separarLetras(String texto) {
        String maiusculas = texto.replaceAll("[^A-Z]", "");
        int tamanho = (int) Math.ceil(Math.sqrt(maiusculas.length()));
        char[][] letras = new char[tamanho][tamanho];

        int index = 0;
        for (int i = 0; i < tamanho; i++) {
            for (int j = 0; j < tamanho; j++) {
                if (index < maiusculas.length()) {
                    letras[i][j] = maiusculas.charAt(index++);
                }
            }
        }
        return letras;
    }

    private static String[] separarPalavras(String texto) {
        String minusculas = texto.replaceAll("[^a-z ;]", "");
        String[] palavras = minusculas.split("[;\\s]+");

        for (int i = 0; i < palavras.length; i++) {
            palavras[i] = palavras[i].toUpperCase();
        }
        return palavras;
    }

    private static boolean verificarLetrasMaiusculas(char[][] letras) {
        for (char[] linha : letras) {
            for (char letra : linha) {
                if (!Character.isUpperCase(letra)) {
                    return false;
                }
            }
        }
        return true;
    }

    private static void printInfo(char[][] letras, String palavra) {
        int tamanho = letras.length;
        int comprimento = palavra.length();
    
        if (comprimento == 0) {
            System.out.println("Palavra vazia");
            return;
        }
    
        for (int i = 0; i < tamanho; i++) {
            for (int j = 0; j < tamanho; j++) {
                if (letras[i][j] == palavra.charAt(0) && verificarPalavra(letras, palavra, i, j)) {
                    String direction = findDirection(letras, palavra, i, j);
                    System.out.printf("%-15s %-5d %2d,%-5d %s\n", palavra, palavra.length(), (i + 1), (j + 1), direction);
                    return;
                }
            }
        }
    
        System.out.println("Palavra não encontrada: " + palavra);
    }
    

    private static boolean verificarPalavra(char[][] letras, String palavra, int linha, int coluna) {
        int tamanho = letras.length;
        int comprimento = palavra.length();
    
        for (int dirLinha = -1; dirLinha <= 1; dirLinha++) {
            for (int dirColuna = -1; dirColuna <= 1; dirColuna++) {
                if (dirLinha == 0 && dirColuna == 0) {
                    continue;
                }
    
                int i, j;
                for (int k = 0; k < comprimento; k++) {
                    i = linha + k * dirLinha;
                    j = coluna + k * dirColuna;
    
                    if (i < 0 || i >= tamanho || j < 0 || j >= tamanho || i >= letras.length || j >= letras[i].length || letras[i][j] != palavra.charAt(k)) {
                        break;
                    }
    
                    if (k == comprimento - 1) {
                        return true;
                    }
                }
            }
        }
        return false;
    }
    

    private static String findDirection(char[][] letras, String palavra, int linha, int coluna) {
        int tamanho = letras.length;
        int comprimento = palavra.length();

        for (int dirLinha = -1; dirLinha <= 1; dirLinha++) {
            for (int dirColuna = -1; dirColuna <= 1; dirColuna++) {
                if (dirLinha == 0 && dirColuna == 0) {
                    continue;
                }

                int i, j;
                for (int k = 0; k < comprimento; k++) {
                    i = linha + k * dirLinha;
                    j = coluna + k * dirColuna;

                    if (i < 0 || i >= tamanho || j < 0 || j >= tamanho || letras[i][j] != palavra.charAt(k)) {
                        break;
                    }

                    if (k == comprimento - 1) {
                        return getDirectionName(dirLinha, dirColuna);
                    }
                }
            }
        }
        return "Unknown";
    }

    private static String getDirectionName(int dirLinha, int dirColuna) {
        if (dirLinha == -1 && dirColuna == 0) return "Up";
        if (dirLinha == 1 && dirColuna == 0) return "Down";
        if (dirLinha == 0 && dirColuna == 1) return "Right";
        if (dirLinha == 0 && dirColuna == -1) return "Left";
        if (dirLinha == -1 && dirColuna == -1) return "UpLeft";
        if (dirLinha == -1 && dirColuna == 1) return "UpRight";
        if (dirLinha == 1 && dirColuna == -1) return "DownLeft";
        if (dirLinha == 1 && dirColuna == 1) return "DownRight";
        return "Unknown";
    }

    private static void printSopaDeLetras(char[][] letras, String[] palavras) {
        int tamanho = letras.length;
    
        for (int i = 0; i < tamanho; i++) {
            for (int j = 0; j < tamanho; j++) {
                char letra = letras[i][j];
                boolean pertencePalavra = false;
    
                // Verificar se a letra pertence a alguma palavra na posição correta
                for (String palavra : palavras) {
                    if (verificarPalavra(letras, palavra, i, j)) {
                        pertencePalavra = true;
                        break;
                    }
                }
    
                // Imprimir a letra ou ponto, dependendo se pertence a alguma palavra
                System.out.print(pertencePalavra ? letra + " " : ". ");
            }
            System.out.println(); // Nova linha para a próxima linha da sopa de letras
        }
    }    
    
}