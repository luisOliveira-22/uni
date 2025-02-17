package ex3;

public class Status {
    private StatusEnum status;

    public Status() {
        this.status = StatusEnum.INVENTORY;
    }

    public void register() {
        switch (this.status) {
            case INVENTORY:
                this.status = StatusEnum.AVAILABLE;
                break;
            default:
                throw new RuntimeException("Invalid operation");
        }
    }

    public void request() {
        switch (this.status) {
            case AVAILABLE:
                this.status = StatusEnum.BORROWED;
                break;
            default:
                throw new RuntimeException("Invalid operation");
        }
    }

    public void _return() {
        switch (this.status) {
            case BORROWED:
                this.status = StatusEnum.AVAILABLE;
                break;
            default:
                throw new RuntimeException("Invalid operation");
        }
    }

    public void rent() {
        switch (this.status) {
            case AVAILABLE:
                this.status = StatusEnum.RENTED;
                break;
            default:
                throw new RuntimeException("Invalid operation");
        }
    }

    public void cancel() {
        switch (this.status) {
            case RENTED:
                this.status = StatusEnum.AVAILABLE;
                break;
            default:
                throw new RuntimeException("Invalid operation");
        }
    }



    @Override
    public String toString() {
        return "Status [" + status + "]";
    }
}