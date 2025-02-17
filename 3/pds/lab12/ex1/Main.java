package ex1;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Main {

    public static void main(String[] args) {
        long startTime, endTime;
        List<Long> times = new ArrayList<>();

        Phone phone1 = new Phone("Samsung Galaxy S10", "Snapdragon 855", 1000, 8);
        Phone phone2 = new Phone("iPhone 11", "A13 Bionic", 1100, 4);
        Phone phone3 = new Phone("Huawei P30 Pro", "Kirin 980", 900, 6);
        Phone phone4 = new Phone("OnePlus 7 Pro", "Snapdragon 855", 700, 8);
        
        Phone[] phones = {phone1, phone2, phone3, phone4};
        Context c = new Context(new BubbleSort());
        startTime = System.nanoTime();
        c.sort(phones.clone());
        endTime = System.nanoTime();
        times.add(endTime - startTime);
        System.out.println("BubbleSort: " + (endTime - startTime) + " nanoseconds");

        c.setStrategy(new InsertionSort());
        startTime = System.nanoTime();
        c.sort(phones.clone());
        endTime = System.nanoTime();
        times.add(endTime - startTime);
        System.out.println("InsertionSort: " + (endTime - startTime) + " nanoseconds");

        c.setStrategy(new SelectionSort());
        startTime = System.nanoTime();
        c.sort(phones.clone());
        endTime = System.nanoTime();
        times.add(endTime - startTime);
        System.out.println("SelectionSort: " + (endTime - startTime) + " nanoseconds");

        int minIndex = times.indexOf(Collections.min(times));
        System.out.println("The fastest algorithm is " + (minIndex == 0 ? "BubbleSort" : minIndex == 1 ? "InsertionSort" : "SelectionSort"));
        switch(minIndex) {
            case 0:
                c.setStrategy(new BubbleSort());
                break;
            case 1:
                c.setStrategy(new InsertionSort());
                break;
            case 2:
                c.setStrategy(new SelectionSort());
                break;
        }

        c.sort(phones);
        System.out.println("\nSorted phones using " + c.getStrategy().getClass().getSimpleName() + ":");
        for(Phone phone : phones) {
            System.out.println(phone);
        }
    }
}