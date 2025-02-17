
package ex2;

public class Plane {
    int[][] touristClass;
    int[][] executiveClass;
    boolean executiveAvailability;
    int numRows;

    public Plane(int[][] touristClass) {
        this.touristClass = touristClass;
        this.executiveAvailability = false;
        this.numRows = touristClass.length;
    }

    public Plane(int[][] touristClass, int[][] executiveClass) {
        this.touristClass = touristClass;
        this.executiveClass = executiveClass;
        this.executiveAvailability = true;
        this.numRows = touristClass.length + executiveClass.length;
    }

    public int[][] getTouristClass() {
        return touristClass;
    }

    public int[][] getExecutiveClass() {
        return executiveClass;
    }

    public boolean isExecutiveAvailability() {
        return executiveAvailability;
    }

    public void setTouristClass(int[][] touristClass) {
        this.touristClass = touristClass;
    }

    public void setExecutiveClass(int[][] executiveClass) {
        this.executiveClass = executiveClass;
    }

    public int getNumRows() {
        return this.numRows;
    }

    public int getNumTouristSeats() {
        int numRows = touristClass.length;
        int numCols = touristClass[0].length;

        return numRows * numCols;
    }

    public int getNumExecutiveSeats() {
        if(!isExecutiveAvailability()) return 0;
        int numRows = executiveClass.length;
        int numCols = executiveClass[0].length;

        return numRows * numCols;
    }

    public int getNumTakenTourSeats() {
        return calcTakenSeats(touristClass);
    }

    public int getNumTakenExecSeats() {
        if(!isExecutiveAvailability()) return 0;
        return calcTakenSeats(executiveClass);
    }

    public int calcTakenSeats(int[][] seatClass) {
        int row, col, taken = 0;

        for (row = 0; row < seatClass.length; row++) {
            for (col = 0; col < seatClass[0].length; col++) {
                if (seatClass[row][col] != 0)
                    taken++;
            }
        }

        return taken;
    }
}
