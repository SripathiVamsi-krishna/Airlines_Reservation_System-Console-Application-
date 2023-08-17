package Controller;

import java.sql.*;

public class AvailableRoutes {
    public void routes(Connection connection) {
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT DISTINCT DepartureCity, DestinationCity, Airlines FROM Flights");

            System.out.println("Discover a world of possibilities with our wide range of available flights, connecting you to captivating destinations across the globe.");

            System.out.println("Departure City\t\t || Destination City\t\t || Airlines");
            System.out.println("---------------------------------------------------------------");

            while (resultSet.next()) {
                String depCity = resultSet.getString("DepartureCity");
                String destCity = resultSet.getString("DestinationCity");
                String airline = resultSet.getString("Airlines");

                System.out.printf("%-20s|| \t %-20s||\t  %-20s%n", depCity, destCity, airline);
            }

            resultSet.close();
            statement.close();
        } catch (SQLException exception) {
            System.out.println("Oh.. Ho... Error fetching the available flights... Sorry for the inconvenience");
            System.out.println();
        }
    }
}
