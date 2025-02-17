package Ex2;

public class Main {
    public static void main(String[] args) {
        ContactsMaster master = new ContactsMaster();
        master.openAndLoad(new ContactsStorageTXT());
        master.add(new Contact("John", 123234126));
        master.add(new Contact("Mary", 456853763));
        master.add(new Contact("John", 789863222));
        
        // Print
        for (Contact contact : master.getContacts()) {
            System.out.println(contact.getName() + " " + contact.getNumber());
        }
        master.saveAndClose();


        System.out.println("-----------------------------------------");


        master.openAndLoad(new ContactsStorageBinary());
        master.add(new Contact("a", 123234126));
        master.add(new Contact("b", 456853763));
        master.add(new Contact("c", 789863222));
        
        // Print
        for (Contact contact : master.getContacts()) {
            System.out.println(contact.getName() + " " + contact.getNumber());
        }
        master.saveAndClose();


        System.out.println("-----------------------------------------");


        //master.openAndLoad(new ContactsStorageJSON());
        //master.add(new Contact("d", 123456789));
        //master.add(new Contact("e", 917364872));
        //master.add(new Contact("f", 927385637));

        // Print
        //for (Contact contact : master.getContacts()) {
        //    System.out.println(contact.getName() + " " + contact.getNumber());
        //}
        //master.saveAndClose();
        // Output:

        // Ana 966243536
        // Jorge 954234134
        // Rui 966358243
        // Joao 922645294
        // Ricardo 986143745
        // John 123234126
        // Mary 456853763
        // John 789863222
        // -----------------------------------------
        // John 123234126
        // Mary 456853763
        // John 789863222
        // a 123234126
        // b 456853763
        // c 789863222
        // -----------------------------------------
        // Beto 986526723
        // Ana 963452452
        // Cris 912115980
        // d 123456789
        // e 917364872
        // f 927385637
        
    }
}