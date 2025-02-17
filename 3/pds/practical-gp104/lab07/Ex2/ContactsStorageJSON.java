package Ex2;


import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;
import java.io.File;
import java.io.PrintWriter;
import org.json.JSONObject;


public class ContactsStorageJSON implements ContactsStorageInterface {
    public List<Contact> loadContacts() {
        List<Contact> contacts = new ArrayList<Contact>();

        try {
            Scanner scanner = new Scanner(new File("contacts.json"));

            // Read file into a string
            String json = "";
            while (scanner.hasNextLine()) {
                json += scanner.nextLine();
            }
            scanner.close();

            // Parse the string into a JSON object
            JSONObject obj = new JSONObject(json);

            Iterator<String> keys = obj.keys();
            while (keys.hasNext()) {
                String key = keys.next();
                contacts.add(new Contact(key, obj.getInt(key)));
            }

            

        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return contacts;
    }

    public boolean saveContacts(List<Contact> list) {
        try {
            JSONObject obj = new JSONObject();

            for (int i = 0; i < list.size(); i++) {
                obj.put(list.get(i).getName(), list.get(i).getNumber());
            }

            PrintWriter writer = new PrintWriter("out.json");
            writer.println(obj.toString());
            writer.close();

        } catch (Exception e) {
            return false;
        }
        return true;
    }
    
}