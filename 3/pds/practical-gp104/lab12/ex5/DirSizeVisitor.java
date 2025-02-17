package ex5;

import java.io.IOException;
import java.nio.file.FileVisitResult;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.ArrayList;
import java.util.List;


public class DirSizeVisitor extends SimpleFileVisitor<Path> {
    private long totalSize = 0;

    public long getTotalSize() {
        return totalSize;
    }

    public void recursiveSum(Path start) throws IOException {
        Files.walkFileTree(start, new SimpleFileVisitor<Path>() {
            long sum = 0;
            List<Path> subDirs = new ArrayList<>();

            @Override
            public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
                sum += Files.size(file);
                return FileVisitResult.CONTINUE;
            }

            @Override
            public FileVisitResult preVisitDirectory(Path dir, BasicFileAttributes attrs) throws IOException {
                if (dir.equals(start))
                    System.out.print(dir.getFileName() + ": ");
                else if (dir.getParent().equals(start))
                    subDirs.add(dir);
                return FileVisitResult.CONTINUE;
            }

            @Override
            public FileVisitResult postVisitDirectory(Path dir, IOException e) throws IOException {
                if (e == null) {
                    if (dir.equals(start)) {
                        totalSize += sum;
                        System.out.println(sum + " bytes");
                        for (Path subDir : subDirs) {
                            System.out.print("|-> ");
                            sum(subDir, true);
                        }
                    }
                    return FileVisitResult.CONTINUE;
                } else throw e;
            }
        });
    }

    public void sum(Path start, boolean recursive) throws IOException {
        Files.walkFileTree(start, new SimpleFileVisitor<Path>() {
            long sum = 0;

            @Override
            public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
                sum += Files.size(file);
                return FileVisitResult.CONTINUE;
            }

            @Override
            public FileVisitResult preVisitDirectory(Path dir, BasicFileAttributes attrs) throws IOException {
                if (dir.equals(start))
                    System.out.print(dir.getFileName() + ": ");
                return FileVisitResult.CONTINUE;
            }

            @Override
            public FileVisitResult postVisitDirectory(Path dir, IOException e) throws IOException {
                if (e == null) {
                    if(dir.equals(start)){
                        if(!recursive)
                            totalSize+=sum;
                        System.out.println(sum + " bytes");
                    }
                    return FileVisitResult.CONTINUE;
                }
                throw e;
            }

            @Override
            public FileVisitResult visitFileFailed(Path file, IOException e) {
                System.err.println("Invalid file: " + file.toString());
                return FileVisitResult.TERMINATE;
            }
        });
    }
}