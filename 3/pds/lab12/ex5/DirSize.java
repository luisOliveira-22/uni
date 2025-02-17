package ex5;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

public class DirSize {
    public static void main(String[] args) throws IOException {
        String dirPath;
        boolean recursive = false;

        if (args.length == 0) {
            System.out.println("Usage: java DirSize [-r] <dir>");
            return;
        } else if (args.length > 1 && args[0].equalsIgnoreCase("-r")) {
            recursive = true;
            dirPath = args[1];
        } else
            dirPath = args[0];

        Path dir = Path.of(dirPath);
        DirSizeVisitor visitor = new DirSizeVisitor();
        
        if (recursive) {
            visitor.recursiveSum(Paths.get(dirPath));
        } else {
            visitor.sum(dir, false);
        }
    }
}