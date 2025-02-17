package Ex2;

import java.util.ArrayList;
import java.util.List;
import java.io.*;

public class ContactsStorageBinary implements ContactsStorageInterface {
    // binary file with contacts (name and number)

    public List<Contact> loadContacts() {
        List<Contact> contacts = new ArrayList<Contact>();

    try (FileInputStream fis = new FileInputStream("contacts.bin");
            DataInputStream dis = new DataInputStream(fis)) {
        while (dis.available() > 0) {
            String name = dis.readUTF();
            int number = dis.readInt();
            contacts.add(new Contact(name, number));
        }
    } catch (IOException e) {
        e.printStackTrace();
    }

        return contacts;
    }

    public boolean saveContacts(List<Contact> list) {
        try (FileOutputStream fos = new FileOutputStream("out.bin");
                DataOutputStream dos = new DataOutputStream(fos)) {
            for (Contact contact : list) {
                dos.writeUTF(contact.getName());
                dos.writeInt(contact.getNumber());
            }
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }
    
}