package ex1;

public class Main {
    public static void main(String[] args) throws InterruptedException {
        // Create 5 items, 3 clients and 1 manage
        Item item1 = Item.getInstance("Item 1", 10);
        // Item item2 = Item.getInstance("Item 2", 20);
        // Item item3 = Item.getInstance("Item 3", 30);
        // Item item4 = Item.getInstance("Item 4", 40);
        // Item item5 = Item.getInstance("Item 5", 50);

        Client client1 = Client.getInstance("John");
        Client client2 = Client.getInstance("Frank");
        Client client3 = Client.getInstance("Mary");

        Manager manager = Manager.getInstance("Peter");

        // Create auction
        Auction auction = Auction.getInstance();

        // Add items to auction
        auction.addItem(item1);
        // auction.addItem(item2);
        // auction.addItem(item3);
        // auction.addItem(item4);
        // auction.addItem(item5);

        // Add users to auction
        auction.addUser(client1);
        auction.addUser(client2);
        auction.addUser(client3);
        auction.addUser(manager);

        // Subscribe users to items
        item1.subscribe(client1);
        item1.subscribe(client2);
        item1.subscribe(client3);
        

        // Start auction
        auction.startBidding(item1);
        // Bid on item1
        client1.bid(auction, item1, 15);
        Thread.sleep(4000);
        client2.bid(auction, item1, 25);
        Thread.sleep(5000);
        client3.bid(auction, item1, 35);
        Thread.sleep(7000);
        client1.bid(auction, item1, 25);



    }
}
