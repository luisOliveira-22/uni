package ex1;

import java.util.ArrayList;

public class Manager implements SubscriberInterface {
    private String name;

    private Manager(String name) {
        this.name = name;
    }

    public void update(String msg) {
        System.out.println("Manager " + this.name + ":\n\t\t-" + msg);
    }

    public ArrayList<Item> listAuctionItems(Auction auction) {
        return auction.getItems(Status.AUCTION);
    }

    public ArrayList<Item> listSalesItems(Auction auction) {
        return auction.getItems(Status.SALES);
    }

    public ArrayList<Item> listStockItems(Auction auction) {
        return auction.getItems(Status.STOCK);
    }

    public static Manager getInstance(String name) {
        return new Manager(name);
    }
}