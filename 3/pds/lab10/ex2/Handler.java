package ex2;

public abstract class Handler {
    private Handler successor = null;

    public Handler setSuccessor(Handler successor) {
        this.successor = successor;
        return this;
    }

    public void handleRequest(String request) {
        if (successor != null)
            successor.handleRequest(request);
        else
            System.out.println("We're sorry but that request can't be satisfied by our service!");
    }
}