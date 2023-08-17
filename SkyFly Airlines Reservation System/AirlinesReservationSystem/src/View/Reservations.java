package View;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.*;


public class Reservations {
    public void viewFlights(Connection connection) {
        try {
            Scanner scanner = new Scanner(System.in);
            System.out.println();
            System.out.println("Please enter the booking id: ");
            String userInputBookingId = scanner.next(); // Store user-input booking ID separately
            String query = "SELECT F.FlightNumber, F.Airlines, F.DepartureCity, F.DestinationCity, F.DepartureDate, F.DepartureTime, F.ArrivalTime, B.seatSelection, B.classType, B.passengerName, B.bookingDate, COUNT(B.flightId) AS seatsBooked, SUM(B.totalPrice) AS totalPrice, B.bookingId " +
                    " FROM Flights F " +
                    " JOIN Bookings B ON F.FlightId = B.flightId " +
                    " WHERE B.bookingId = ? " + // Use B.bookingId here
                    " GROUP BY B.bookingId";

            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, userInputBookingId); // Use user-input booking ID

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    int ticketCount = 0;

                    while (resultSet.next()) {
                        String flightNumber = resultSet.getString("FlightNumber");
                        String airlines = resultSet.getString("Airlines");
                        String bookingId = resultSet.getString("bookingId"); // Use a different variable for bookingId
                        String departureCity = resultSet.getString("DepartureCity");
                        String arrivalCity = resultSet.getString("DestinationCity");
                        String departureDate = resultSet.getString("DepartureDate");
                        String departureTime = resultSet.getString("DepartureTime");
                        String arrivalTime = resultSet.getString("ArrivalTime");
                        String seatSelected = resultSet.getString("seatSelection");
                        String classType = resultSet.getString("classType");
                        String passengerName = resultSet.getString("passengerName");
                        int seatsBooked = resultSet.getInt("seatsBooked");
                        double totalPrice = resultSet.getDouble("totalPrice");
                        LocalDate bookingDate = LocalDate.now();

                        ticketCount++;

                        // Displaying ticket summary to the user
                        System.out.println("Ticket Summary #" + ticketCount + ":");
                        System.out.println("------------------------------");
                        System.out.println("Passenger Name: " + passengerName);
                        System.out.println("Flight Number: " + flightNumber);
                        System.out.println("Airlines Travelling: " + airlines);
                        System.out.println("Booking Id: " + bookingId);
                        System.out.println("From: " + departureCity);
                        System.out.println("To: " + arrivalCity);
                        System.out.println("Departure Date: " + departureDate);
                        System.out.println("Departure Time: " + departureTime);
                        System.out.println("Arrival Time: " + arrivalTime);
                        System.out.println("Booking Date: " + bookingDate);
                        System.out.println("Seat Selection: " + seatSelected);
                        System.out.println("Class traveling: " + classType);
                        System.out.println("Total no. of seats booked: " + seatsBooked);
                        System.out.println("Total Ticket Cost: " + totalPrice);
                        System.out.println("---------------------------------------------------------");
                        System.out.println("If you wish to go with round trip ");
                    }

                    if (ticketCount == 0) {
                        System.out.println("No ticket found for booking ID: " + userInputBookingId);
                    }
                }
            }
        } catch (SQLException sqlException) {
            System.out.println("Error Occured while Viewing the flight details : " + sqlException.getMessage());
            sqlException.printStackTrace();
        }
    }
}

