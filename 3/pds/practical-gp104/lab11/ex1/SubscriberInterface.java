package ex1;

import java.util.ArrayList;

public interface SubscriberInterface {
    public void update(String msg);
    public ArrayList<Item> listAuctionItems(Auction auction);
}
