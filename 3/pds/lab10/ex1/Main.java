package ex1;

import java.util.Iterator;
import java.util.ListIterator;

public class Main {
    public static void main(String[] args) {
        VectorGeneric<Person> VG = new VectorGeneric<>();
        for(int i = 0; i < 50; i++)
            VG.addElem(new Person("Someone" + i, 1000+i));

        Iterator<Person> i = VG.iterator();
        ListIterator<Person> lstI = VG.listIterator();
        ListIterator<Person> lstIt = VG.listIterator(23);

        // System.out.println("Iterator:");
        // while(i.hasNext())
        //     System.out.println(i.next());
        // System.out.println();

        // System.out.println("ListIterator:");
        // while(lstI.hasNext())
        //     System.out.println(lstI.next());
        // System.out.println();

        // System.out.println("ListIterator(23):");
        // while(lstIt.hasNext())
        //     System.out.println(lstIt.next());
        // System.out.println();

        // for(int j = 0; j < 23; j++)
        //     lstI.next();
        // System.out.println(lstI.next());
        // System.out.println("Previous: " + lstI.previous());
        // lstI.next();
        // lstI.next();
        // System.out.println("Next: " + lstI.nextIndex());

        Iterator<Person> i2 = VG.iterator();
        Iterator<Person> i3 = VG.iterator();

        for (int j = 0; j < 23; j++)
            i2.next();
        while (i2.hasNext()) {
            System.out.println(i2.next());
            System.out.println(i3.next());
        }

        System.out.println(lstI.previous());
    }
}