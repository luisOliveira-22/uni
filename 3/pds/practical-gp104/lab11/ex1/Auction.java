package ex1;

import  java.util.ArrayList;

public class Auction {
    private static final int MAX_BIDDING_TIME = 60;
    private ArrayList<Item> items;
    private ArrayList<SubscriberInterface> users;

    private Auction() {
        this.items = new ArrayList<Item>();
        this.users = new ArrayList<SubscriberInterface>();
    }

    public void addUser(SubscriberInterface user) {
        if (!this.users.contains(user)) {
            this.users.add(user);
            return;
        }

        throw new RuntimeException("User already exists");
    }

    public void removeUser(SubscriberInterface user) {
        if (this.users.contains(user)) {
            this.users.remove(user);
        }
        else {
            throw new RuntimeException("User not found");
        }

        // Unsubscribe user from all items
        for (Item item : this.items) {
            try {
                item.unsubscribe(user);
            }
            catch (Exception e) {
                continue;
            }
        }
    }

    public void addItem(Item item) {
        if (!this.items.contains(item)) {
            this.items.add(item);
            return;
        }

        throw new RuntimeException("Item already exists");
    }

    public ArrayList<Item> getItems(Status status) {
        ArrayList<Item> items = new ArrayList<Item>();
        for (Item item : this.items) {
            if (item.getStatus() == status) {
                items.add(item);
            }
        }
        return items;
    }

    public void placeBid(Client client, Item item, double bid) {
        if (this.items.contains(item) ) {
            item.setBid(bid);
        }
        else {
            throw new RuntimeException("Item not found");
        }
    }

    public void startBidding(Item item) {
        if (this.items.contains(item)) {
            item.setStatus(Status.AUCTION);
        }
        else {
            throw new RuntimeException("Item not found");
        }
    
        // Subscribe all managers to item
        for (SubscriberInterface user : this.users) {
            if (user instanceof Manager) {
                item.subscribe(user);
            }
        }
        
        Thread t = new Thread(new Runnable() {
            public void run() {
                    // Wait for MAX_BIDDING_TIME seconds
                try {
                    Thread.sleep(Auction.MAX_BIDDING_TIME * 1000);
                }
                catch (InterruptedException e) {
                    e.printStackTrace();
                }
                item.setStatus(Status.SALES);
            }
        });
        t.start();
    }

    public static Auction getInstance() {
        return new Auction();
    }
}