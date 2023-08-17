package View;

import Controller.TicketCancellation;
import Controller.AvailableRoutes;
import Controller.FlightSearching;
import Controller.SpecialServices;

import java.sql.*;
import java.util.Scanner;

public class Flights {
    public void flightDetails(Connection connection) {
        boolean run = true;
        while (run) {
            System.out.println("Great... Welcome to the Flight search portal... Please select an option");
            System.out.println("1. Search for a Flight");
            System.out.println("2. Review your flight itineraries");
            System.out.println("3. Explore Travel Route Options");
            System.out.println("4. Special Services");
            System.out.println("5. Ticket Cancellation");
            System.out.println("6. Exit");

            try {
                Scanner scanner2 = new Scanner(System.in);
                int choice = scanner2.nextInt();

                switch (choice) {
                    case 1:
                        FlightSearching flightSearching1 = new FlightSearching();
                        flightSearching1.searchFlights(connection);
                        System.out.println("Thank you for using the Flight Search App. Goodbye!");
                        System.exit(0);
                        break;
                    case 2:
                        // Code for viewing booked flights
                        Reservations reservations = new Reservations();
                        reservations.viewFlights(connection);
                        break;
                    case 3:
                        AvailableRoutes available = new AvailableRoutes();
                        available.routes(connection);
                        System.out.println("Thanks for reaching us...");
                        break;
                    case 4:
                        SpecialServices services = new SpecialServices();
                        services.addSpecialStatus(connection);
                        break;

                    case 5:
                        TicketCancellation ticketCancellation = new TicketCancellation();
                        ticketCancellation.cancelTicket(connection);

                    case 6:
                        System.out.println("Thanks for using our SkyFly Airlines Reservation System");
                        run = false;
                        break;
                    default:
                        System.out.println("Invalid choice. Please try again.");
                        break;
                }
            } catch (SQLException exception) {
                exception.printStackTrace();
            }
        }
    }
}
