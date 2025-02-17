package Ex2;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.io.PrintWriter;
import java.io.File;

public class ContactsStorageTXT implements ContactsStorageInterface {
    // txt file with contacts (name and number in each line, separated by tab)

    public List<Contact> loadContacts() {
        List<Contact> contacts = new ArrayList<Contact>();

        try {
            Scanner scanner = new Scanner(new File("contacts.txt"));

            while (scanner.hasNextLine()) {
                String line = scanner.nextLine();
                String[] params = line.split("\t");
                contacts.add(new Contact(params[0], Integer.parseInt(params[1])));
            }
            
            scanner.close();

        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return contacts;
    }

    public boolean saveContacts(List<Contact> list) {
        try {
            PrintWriter writer = new PrintWriter("out.txt");

            for (int i = 0; i < list.size(); i++) {
                writer.println(list.get(i).getName() + "\t" + list.get(i).getNumber());
            }

            writer.close();

        } catch (Exception e) {
            return false;
        }
        return true;
    }
    
}