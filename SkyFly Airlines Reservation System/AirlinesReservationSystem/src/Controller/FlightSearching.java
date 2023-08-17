package Controller;

import View.Flights;

import java.sql.*;
import java.util.*;

public class FlightSearching {
    public void searchFlights(Connection connection) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Flight Search");
        System.out.println("-------------");

        System.out.println("Enter Departure City:");
        String departureCity = scanner.nextLine();

        System.out.println("Enter Destination City:");
        String destinationCity = scanner.nextLine();

        String query = "SELECT FlightId, Airlines, FlightNumber, DepartureCity, DestinationCity, DepartureDate, DepartureTime FROM Flights WHERE DepartureCity = ? AND DestinationCity = ? ";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, departureCity);
            preparedStatement.setString(2, destinationCity);

            ResultSet resultSet = preparedStatement.executeQuery();

            List<Integer> flightIDs = new ArrayList<>();
            System.out.println("Search Results:");
            System.out.println("----------------");

            System.out.println("-----------------------------------------------------------------------------------------------------------------------");
            System.out.printf("%-10s %-15s %-15s %-20s %-20s %-20s %-20s%n", "Flight ID", "Airlines", "Flight Number", "Departure City",
                    "Destination City", "Departure Date", "Departure Time");
            System.out.println("-----------------------------------------------------------------------------------------------------------------------");

            while (resultSet.next()) {
                int flightId = resultSet.getInt("FlightId");
                String airlines = resultSet.getString("Airlines");
                String departureCityResult = resultSet.getString("DepartureCity");
                String destinationCityResult = resultSet.getString("DestinationCity");
                String flightNumber = resultSet.getString("FlightNumber");
                String departureDateTime = resultSet.getString("DepartureDate") + " and " + resultSet.getString("DepartureTime");

                System.out.printf("%-10s %-15s %-15s %-20s %-20s %-20s %-20s%n", flightId, airlines, flightNumber, departureCityResult,
                        destinationCityResult, resultSet.getString("DepartureDate"), resultSet.getString("DepartureTime"));

                flightIDs.add(flightId);
            }
            System.out.println("-----------------------------------------------------------------------------------------------------------------------");

            if (flightIDs.isEmpty()) {
                System.out.println("Sorry for the inconvenience caused... We don't serve that route. You can try exploring other routes as well.");
                System.out.println();

                Flights flights = new Flights();
                flights.flightDetails(connection);
            } else {
                System.out.println();
                System.out.println("Enter your Departure Date (in this format YYYY-MM-DD):");
                String departureDate = scanner.nextLine();

                System.out.println("Filtered Search Results for Departure Date: " + departureDate);
                System.out.println("-------------------------------------------------------");

                System.out.println("-----------------------------------------------------------------------------------------------------------------------");
                System.out.printf("%-10s %-15s %-15s %-20s %-20s %-20s %-20s%n", "Flight ID", "Airlines", "Flight Number", "Departure City",
                        "Destination City", "Departure Date", "Departure Time");
                System.out.println("-----------------------------------------------------------------------------------------------------------------------");

                for (int flightId : flightIDs) {
                    String date = departureDate.trim();
                    String queryFiltered = "SELECT FlightId, Airlines, FlightNumber, DepartureCity, DestinationCity, DepartureDate, DepartureTime FROM Flights WHERE FlightId = ? AND DepartureDate = ?";

                    try (PreparedStatement preparedStatementFiltered = connection.prepareStatement(queryFiltered)) {
                        preparedStatementFiltered.setInt(1, flightId);
                        preparedStatementFiltered.setString(2, date);

                        ResultSet resultSetFiltered = preparedStatementFiltered.executeQuery();

                        while (resultSetFiltered.next()) {
                            String airlines = resultSetFiltered.getString("Airlines");
                            String departureCityResult = resultSetFiltered.getString("DepartureCity");
                            String destinationCityResult = resultSetFiltered.getString("DestinationCity");
                            String flightNumber = resultSetFiltered.getString("FlightNumber");
                            String departureDateTime = resultSetFiltered.getString("DepartureDate") + " and " + resultSetFiltered.getString("DepartureTime");

                            System.out.printf("%-10s %-15s %-15s %-20s %-20s %-20s %-20s%n", flightId, airlines, flightNumber, departureCityResult,
                                    destinationCityResult, resultSetFiltered.getString("DepartureDate"), resultSetFiltered.getString("DepartureTime"));
                        }
                        resultSetFiltered.close();
                    }
                }
                System.out.println("-----------------------------------------------------------------------------------------------------------------------");

                System.out.println();
                ClassesSelection classesSelection = new ClassesSelection(connection);
                classesSelection.classTypesandSeats(flightIDs, departureDate);
                System.out.println();

                System.out.println("Please find below the comprehensive information regarding the classes and seat availability for each scheduled flight:");
                System.out.println("----------------------------------------------------------------------------------------");
                System.out.println("Do you want to book the flight (Y or N)");
                String proceedBooking = scanner.nextLine();

                if (proceedBooking.equalsIgnoreCase("Y")) {
                    FlightBooking booking = new FlightBooking();
                    booking.booking(connection);
                }
            }

            resultSet.close();
        } catch (SQLException e) {
            // Handle the exception appropriately
            e.printStackTrace();
        }
    }
}
