package Ex2;

import java.util.List;

public class ContactsMaster implements ContactsInterface{
    private ContactsStorageInterface store;
    private List<Contact> contacts;

    public void openAndLoad(ContactsStorageInterface store) {
        this.store = store;
        contacts = store.loadContacts();
    }

    public void saveAndClose() {
        store.saveContacts(contacts);
        contacts = null;
    }

    public void saveAndClose(ContactsStorageInterface store) {
        store.saveContacts(contacts);
        contacts = null;
    }

    public boolean exist(Contact contact) {
        return contacts.contains(contact);
    }

    public Contact getByName(String name) {
        for (Contact contact : contacts) {
            if (contact.getName().equals(name)) {
                return contact;
            }
        }
        return null;
    }

    public boolean add(Contact contact) {
        if (exist(contact)) {
            return false;
        }
        contacts.add(contact);
        return true;
    }

    public boolean remove(Contact contact) {
        if (!exist(contact)) {
            return false;
        }
        contacts.remove(contact);
        return true;
    }

    public List<Contact> getContacts() {
        return contacts;
    }
    
}