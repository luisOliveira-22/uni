package ex1;

import java.util.ArrayList;

public class Client  implements SubscriberInterface {
    private String name;

    private Client(String name) {
        this.name = name;
    }

    public void update(String msg) {
        System.out.println("Client " + this.name + ":\n\t\t-" + msg);
    }

    public ArrayList<Item> listAuctionItems(Auction auction) {
        return auction.getItems(Status.AUCTION);
    }

    public void bid(Auction auction, Item item, double price) {
        auction.placeBid(this, item, price);
    }
    public static Client getInstance(String name) {
        return new Client(name);
    }
}
