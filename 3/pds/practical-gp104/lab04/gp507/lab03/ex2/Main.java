package ex2;

import java.io.File;
import java.util.Scanner;
import java.util.HashMap;

public class Main {
    public static void main(String[] args) {
        String flight_code, num_seats_executive, num_seats_tourist;
        int number_seats;
        HashMap<String, Flight> list_of_flights = new HashMap<>();

        try {
            Scanner inputSc = new Scanner(System.in);
            System.out.println("Escolha uma opção: (H para ajuda)");
            while (inputSc.hasNextLine()) {
                String line = inputSc.nextLine();
                String inputs[] = line.split(" ");
                if (inputs[0].equals("Q") && inputs.length == 1)
                    break;
                switch (inputs[0]) {
                    case "H":
                        if (inputs.length == 1) {
                            System.out.println("I <filename>");
                            System.out.println("M <flight_code> - Shows the map of reservations");
                            System.out.println(
                                    "F <flight_code> <num_seats_executive> <num_seats_tourist> - Add a flight");
                            System.out.println(
                                    "R <flight_code> <class> <number_seats> - Make a reservation. Format 'flight_code:sequential_reservation_number'");
                            System.out.println(
                                    "C <reservation_code> - Cancel a reservation. Format 'flight_code:sequential_reservation_number'");
                            System.out.println("Q - End program");
                            break;
                        }
                    case "I":
                        if (inputs.length == 2) {
                            String filePath = inputs[1];
                            File file = new File(filePath);
                            Scanner fileSc = new Scanner(file);

                            // First line on the file is Information about the plane
                            String[] planeInformation = fileSc.nextLine().split(" ");
                            flight_code = planeInformation[0].substring(1);
                            // Assuming the file text has the correct syntax
                            Plane plane;
                            if (planeInformation.length == 3) {
                                num_seats_executive = planeInformation[1];
                                num_seats_tourist = planeInformation[2];
                                plane = createPlane(num_seats_executive, num_seats_tourist);
                            } else {
                                num_seats_tourist = planeInformation[1];
                                plane = createPlane(num_seats_tourist);
                            }
                            Flight flight = new Flight(flight_code, plane);
                            list_of_flights.put(flight_code, flight);

                            System.out.println(flight);

                            while (fileSc.hasNext() && fileSc.hasNextLine()) {
                                char seatClass = fileSc.next().charAt(0);
                                number_seats = fileSc.nextInt();
                                flight.makeReservation(seatClass, number_seats);
                            }
                            fileSc.close();
                            break;
                        }
                    case "M":
                        if (inputs.length == 2) {
                            flight_code = inputs[1];
                            Flight flight = list_of_flights.get(flight_code);
                            flight.showReservationMap();
                            break;
                        }
                    case "F":
                        if (inputs.length == 3 || inputs.length == 4) {
                            Plane plane;
                            flight_code = inputs[1];
                            if (inputs.length == 4) {
                                num_seats_executive = inputs[2];
                                num_seats_tourist = inputs[3];

                                plane = createPlane(num_seats_executive, num_seats_tourist);
                            } else {
                                num_seats_tourist = inputs[2];
                                plane = createPlane(num_seats_tourist);
                            }
                            Flight flight = new Flight(flight_code, plane);
                            list_of_flights.put(flight_code, flight);

                            break;
                        }
                    case "R":
                        if (inputs.length == 4) {
                            // "R <flight_code> <class> <num_seats>"

                            String flightCode = inputs[1];
                            char flightClass = inputs[2].charAt(0);
                            int numOfSeats = Integer.parseInt(inputs[3]);
                            Flight flight = list_of_flights.get(flightCode);

                            String output = flight.makeReservation(flightClass, numOfSeats);

                            System.out.println(output);

                            break;
                        }
                    case "C":
                        if (inputs.length == 2) {
                            String[] reservationCode = inputs[1].split(":");
                            String flightCode = reservationCode[0];
                            int reservNumber = Integer.parseInt(reservationCode[1]);

                            Flight flight = list_of_flights.get(flightCode);

                            if (!flight.cancelReservation(reservNumber)) {
                                System.out.println("Reservation not found");
                            }

                            break;
                        }
                    default:
                        System.out.println("Command not available");
                        break;
                }
                System.out.println("\nEscolha uma opção: (H para ajuda)");
            }
            inputSc.close();
            System.exit(0);
        } catch (Exception e) {
            System.err.println("\nError: " + e.getMessage());
            System.exit(1);
        }
    }

    static public Plane createPlane(String num_seats_executive, String num_seats_tourist) {
        String[] rowColE = num_seats_executive.split("x");
        String[] rowColT = num_seats_tourist.split("x");
        int[][] executiveClass = new int[Integer.parseInt(rowColE[0])][Integer.parseInt(rowColE[1])];
        int[][] touristClass = new int[Integer.parseInt(rowColT[0])][Integer.parseInt(rowColT[1])];

        return new Plane(touristClass, executiveClass);
    }

    static public Plane createPlane(String num_seats_tourist) {
        String[] rowColT = num_seats_tourist.split("x");
        int[][] touristClass = new int[Integer.parseInt(rowColT[0])][Integer.parseInt(rowColT[1])];

        return new Plane(touristClass);
    }
}
