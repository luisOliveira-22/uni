package Mediator;

class Colleague {
    private Mediator mediator;
    private String name;

    public Colleague(Mediator mediator, String name) {
        this.mediator = mediator;
        this.name = name;
    }

    public void sendMessage() {
        mediator.sendMessage("Hello from " + name + '\n', this);
    }

    public void receiveMessage(String message) {
        System.out.println(name + " received: " + message);
    }
}