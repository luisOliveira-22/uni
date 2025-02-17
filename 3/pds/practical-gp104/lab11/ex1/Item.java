package ex1;

import java.util.ArrayList;

public class Item {
    private static int counter = 0;
    private int code;
    private String description;
    private double basePrice;
    private Status status;
    private ArrayList<SubscriberInterface> subscribers;

    private Item(String description, double basePrice) {
        this.code = Item.counter++;
        this.description = description;
        this.basePrice = basePrice;
        this.status = Status.STOCK;
        this.subscribers = new ArrayList<SubscriberInterface>();
    }

    public int getCode() {
        return this.code;
    }

    public Status getStatus() {
        return this.status;
    }

    public void setStatus(Status status) {
        // Manager gets notified when a new bid is placed
        if (this.status == Status.STOCK && status == Status.AUCTION) {
            this.status = status;
            this.notifyManagers("A new item is in auction");
        }
        // Client and Manager get notified when item is sold
        else if (this.status == Status.AUCTION && status == Status.SALES) {
            this.status = status;
            this.notifySubscribers("Item " + this.code + " was sold");
        }
        else {
            throw new RuntimeException("Invalid status change");
        }
    }

    public void subscribe(SubscriberInterface subscriber) {
        if (!this.subscribers.contains(subscriber)) {
            this.subscribers.add(subscriber);
            return;
        }

        throw new RuntimeException("Subscriber already exists");
    }

    public void unsubscribe(SubscriberInterface subscriber) {
        if (this.subscribers.contains(subscriber)) {
            this.subscribers.remove(subscriber);
            return;
        }

        throw new RuntimeException("Subscriber not found");
    }

    public void setBid(double bid) {
        if (this.status != Status.AUCTION) {
            throw new RuntimeException("Item is not in auction");
        }

        if (bid > this.basePrice) {
            this.basePrice = bid;
            this.notifySubscribers("New highest bid on item " + this.code + ": " + bid);
        }
        else {
            this.notifyManagers("New bid on item " + this.code + ": " + bid);
        }

        
    }

    private void notifyManagers(String msg) {
        for (SubscriberInterface subscriber : this.subscribers) {
            if (subscriber instanceof Manager) {
                subscriber.update(msg);
            }
        }
    }

    private void notifySubscribers(String msg) {
        for (SubscriberInterface subscriber : this.subscribers) {
            subscriber.update(msg);
        }
    }
    
    public static Item getInstance(String description, double basePrice) {
        return new Item(description, basePrice);
    }

    @Override
    public String toString() {
        return "Item " + this.code + ": " + this.description + " - " + this.basePrice + " - " + this.status;
    }

}