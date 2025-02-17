package ex2;

public class Flight {
    String flightCode;
    Plane plane;
    int numTourSeats, numExecSeats, numTakenTourSeats, numTakenExecSeats;
    int numReservations = 1;

    public Flight(String flightCode, Plane plane) {
        this.flightCode = flightCode;
        this.plane = plane;
        this.numTourSeats = plane.getNumTouristSeats();
        this.numExecSeats = plane.getNumExecutiveSeats();
        this.numTakenTourSeats = plane.getNumTakenTourSeats();
        this.numTakenExecSeats = plane.getNumTakenExecSeats();
    }

    public String getFlightCode() {
        return flightCode;
    }

    public Plane getPlane() {
        return plane;
    }

    public int getNumTourSeats() {
        return numTourSeats;
    }

    public int getNumExecSeats() {
        return numExecSeats;
    }

    public String makeReservation(char seatClass, int numOfSeats) {
        int[][] seats;
        int numRows, numCols, row, col, reservationSeats = 0;
        String reservationOutput = this.flightCode + ":" + numReservations + " = ";

        if (seatClass == 'E' && this.plane.isExecutiveAvailability()
                && (numExecSeats - numTakenExecSeats >= numOfSeats)) {
            seats = this.plane.getExecutiveClass();
        } else if (seatClass == 'T' && numTourSeats - numTakenTourSeats >= numOfSeats) {
            seats = this.plane.getTouristClass();
        } else {
            System.out.printf("Não foi possível obter lugares para a reserva: %c %d\n", seatClass, numOfSeats);
            return "";
        }

        numRows = seats.length;
        numCols = seats[0].length;

        for (row = 0; row < numRows && reservationSeats < numOfSeats; row++) {
            for (col = 0; col < numCols && reservationSeats < numOfSeats; col++) {
                if (seats[row][col] == 0) {
                    seats[row][col] = numReservations;

                    if (reservationSeats + 1 == numOfSeats) {
                        reservationOutput += row + 1;
                        reservationOutput += (char) ('A' + col);

                    } else {
                        reservationOutput += row + 1;
                        reservationOutput += (char) ('A' + col) + " | ";
                    }

                    reservationSeats++;
                }
            }

        }
        if (seatClass == 'E')
            this.numTakenExecSeats += numOfSeats;
        if (seatClass == 'T')
            this.numTakenTourSeats += numOfSeats;

        if (seatClass == 'E')
            this.plane.setExecutiveClass(seats);
        if (seatClass == 'T')
            this.plane.setTouristClass(seats);

        numReservations++;
        return reservationOutput;
    }

    public void showReservationMap() {
        int numRowsE = 0;
        int numColsE = 0;
        int seatNumber = 0;
        int numCols = plane.getTouristClass()[0].length;
        if (this.plane.isExecutiveAvailability()) {
            numRowsE = this.plane.getExecutiveClass().length; // Number of Executive Class Rows
            numColsE = this.plane.getExecutiveClass()[0].length;
            numCols = Math.max(numCols,
                    plane.getExecutiveClass()[0].length);
        }
        int numRows = this.plane.getNumRows();

        // Print rows numbers
        System.out.printf("  ");
        for (int i = 1; i < numRows + 1; i++) {
            System.out.printf("%2d ", i);
        }
        System.out.println();

        // Print each label and reservations
        for (int col = 0; col < numCols; col++) {
            char rowLabel = (char) ('A' + col);
            System.out.printf("%c ", rowLabel);

            for (int row = 0; row < numRows; row++) {
                if (plane.isExecutiveAvailability())
                    if (row < numRowsE) {
                        if (col < numColsE)
                            seatNumber = this.plane.getExecutiveClass()[row][col];
                        else {
                            System.out.printf("   ");
                            continue;
                        }
                    } else {
                        seatNumber = this.plane.getTouristClass()[row - numRowsE][col];
                    }
                else {
                    seatNumber = this.plane.getTouristClass()[row][col];
                }
                System.out.printf("%2d ", seatNumber);
            }
            System.out.println();
        }
    }

    public boolean cancelReservation(int numReservations) {
        int[][] touristClass = this.plane.getTouristClass();
        int[][] executiveClass = this.plane.getExecutiveClass();
        int numRowsE = this.plane.executiveClass.length;
        int numRowsT = this.plane.touristClass.length;
        boolean reservationFound = false;

        for (int row = 0; row < numRowsE; row++) {
            for (int col = 0; col < executiveClass[0].length; col++) {
                if (executiveClass[row][col] == numReservations) {
                    executiveClass[row][col] = 0;
                    reservationFound = true;
                }
            }
        }

        for (int row = 0; row < numRowsT; row++) {
            for (int col = 0; col < touristClass[0].length; col++) {
                if (touristClass[row][col] == numReservations) {
                    touristClass[row][col] = 0;
                    reservationFound = true;
                }
            }
        }

        return reservationFound;
    }

    @Override
    public String toString() {
        String toString = "";
        String seatsAvailable;
        if (this.plane.isExecutiveAvailability())
            seatsAvailable = String.format("%d lugares em classe Executiva; ", getNumExecSeats())
                    + String.format("%d lugares em classe Turística.", getNumTourSeats());
        else
            seatsAvailable = String.format("%d lugares em classe Turística.\n", getNumTourSeats()) +
                    "Classe executiva não disponível neste voo.";
        toString += String.format("Código de voo %s. ", this.flightCode) +
                String.format("Lugares disponíveis: ") +
                seatsAvailable;
        return toString;
    }
}