package Controller;

import View.Flights;

import java.sql.*;
import java.util.Scanner;

public class TicketCancellation {
    public void cancelTicket(Connection connection) throws SQLException {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Ticket Cancellation");
        System.out.println("----------------------------------------");

        System.out.println("Please enter the Booking ID: ");
        String bookingId = scanner.nextLine();

        // Check if the booking with the provided ID exists and get its details
        String query = "SELECT flightId, passengerName, totalPrice, classType, seatsBooked FROM Bookings WHERE bookingId = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, bookingId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    // Fetch details from the result set
                    int flightId = resultSet.getInt("flightId");
                    String passengerName = resultSet.getString("passengerName");
                    String Airlines = getFlightName(connection, flightId);
                    String departureDate = getDepartureDateTime(connection, flightId);
                    String departureTime = getDepartureDateTime(connection, flightId);
                    String classType = resultSet.getString("classType");
                    int seatsBooked = resultSet.getInt("seatsBooked");

                    // Print ticket details
                    System.out.println("Ticket Details");
                    System.out.println("---------------------------------------------------------------");
                    System.out.println("Booking ID: " + bookingId);
                    System.out.println("Flight ID: " + flightId);
                    System.out.println("Flight Name: " + Airlines);
                    System.out.println("Passenger Name: " + passengerName);
                    System.out.println("Departure Date and Time: " + departureDate);
                    System.out.println("Booked Class : " + classType);
                    System.out.println("Total Seats Booked : " + seatsBooked);



                    // Ask for cancellation reason
                    System.out.println("\nPlease provide the cancellation reason (optional): ");
                    String cancellationReason = scanner.nextLine();

                    // Calculate refund amount
                    double refundAmount = calculateRefund(connection, bookingId);

                    // Update booking status to "cancelled" in the database
                    updateBookingStatus(connection, bookingId, "cancelled");

                    // Update cancellation reason in the database
                    updateCancellationReason(connection, bookingId, cancellationReason);

                    System.out.println("\nTicket cancellation successful.");
                    System.out.println("Refund Amount: ₹" + refundAmount);

                    // After calculating the refundAmount, update the seats
                    updateSeats(connection, flightId, classType, seatsBooked);

                } else {
                    System.out.println("No booking found with the provided Booking ID: " + bookingId);
                }
            }
        }
    }

    private String getFlightName(Connection connection, int flightId) throws SQLException {
        String query = "SELECT Airlines FROM Flights WHERE flightId = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, flightId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                return resultSet.next() ? resultSet.getString("Airlines") : "N/A";
            }
        }
    }



    private String getDepartureDateTime(Connection connection, int flightId) throws SQLException {
        String query = "SELECT DepartureDate, DepartureTime FROM Flights WHERE flightId = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, flightId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    String departureDate = resultSet.getString("DepartureDate");
                    String departureTime = resultSet.getString("DepartureTime");
                    return departureDate + " " + departureTime;
                } else {
                    return "N/A";
                }
            }
        }
    }

    private double calculateRefund(Connection connection, String bookingId) throws SQLException {
        double totalAmount = 0.0;
        // Fetch total amount from the database
        String query = "SELECT totalPrice FROM Bookings WHERE bookingId = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, bookingId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    totalAmount = resultSet.getDouble("totalPrice");
                }
            }
        }

        // Calculate the refund amount after deducting 20% for privacy policies
        double refundAmount = totalAmount - (totalAmount * 0.2);
        return refundAmount;
    }

    private void updateBookingStatus(Connection connection, String bookingId, String status) throws SQLException {
        String query = "UPDATE Bookings SET bookingStatus = ? WHERE bookingId = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, status);
            preparedStatement.setString(2, bookingId);
            preparedStatement.executeUpdate();
        }
    }

    private void updateCancellationReason(Connection connection, String bookingId, String cancellationReason) throws SQLException {
        String query = "UPDATE Bookings SET cancellationReason = ? WHERE bookingId = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, cancellationReason);
            preparedStatement.setString(2, bookingId);
            preparedStatement.executeUpdate();
        }
    }


    private void updateSeats(Connection connection, int flightId, String classType, int seatsBooked) throws SQLException {
        String columnName;
        String columnNameBooked;
        switch (classType) {
            case "Economy":
            case "ECO":
                columnName = "EconomyAvailableSeats";
                columnNameBooked = "EconomyBookedSeats";
                break;
            case "Business":
            case "BUS":
                columnName = "BusinessAvailableSeats";
                columnNameBooked = "BusinessBookedSeats";
                break;
            case "Premium":
            case "PrEco": // Handle "PrEco" class type
                columnName = "PremiumAvailableSeats";
                columnNameBooked = "PremiumBookedSeats";
                break;
            default:
                throw new IllegalArgumentException("Invalid class type: " + classType);
        }

        String query = "UPDATE Flights SET " +
                columnName + " = " + columnName + " + ?, " +
                columnNameBooked + " = " + columnNameBooked + " - ? " +
                "WHERE FlightId = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, seatsBooked);
            preparedStatement.setInt(2, seatsBooked);
            preparedStatement.setInt(3, flightId);
            preparedStatement.executeUpdate();
        }

        Flights flights = new Flights();
        flights.flightDetails(connection);
    }

}
