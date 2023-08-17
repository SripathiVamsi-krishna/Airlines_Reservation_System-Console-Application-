package Model;

import java.sql.*;

public class FlightPriceCalculator {
    public double calculatePrice(Connection connection, int flightID, String classType, int age) {
        try {

            String columnName;
            switch (classType) {
                case "ECO":
                    columnName = "EconomyPrice";
                    break;
                case "BUS":
                    columnName = "BusinessPrice";
                    break;
                case "PrEco":
                    columnName = "PremiumPrice";
                    break;
                default:
                    throw new IllegalArgumentException("Invalid class type: " + classType);
            }


            String query = "SELECT " + columnName + " FROM Flights WHERE FlightId = ?";

            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setInt(1, flightID);

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        double basePrice = resultSet.getDouble(columnName);
                        double tax = calculateTax(basePrice); // Calculate tax on the base price
                        //double discount = calculateDiscountBasedOnAge(age);
                        //double discountedPrice = basePrice - (basePrice * discount);
                        return basePrice + tax;
                    } else {
                        throw new SQLException("Invalid flight ID: " + flightID);
                    }
                }
            }
        }
        catch (SQLException sqlException)
        {
            System.out.println("Error Occured while calculating the price : "+sqlException.getMessage());
            sqlException.printStackTrace();
        }
        return 0;
    }




    public double calculateTax(double price) {
        double taxPercentage = 0.18; // 18% tax
        return price * taxPercentage;
    }

    public double calculateBasePrice(Connection connection, int flightID, String classType) throws SQLException {
        String columnName;
        switch (classType) {
            case "ECO":
                columnName = "EconomyPrice";
                break;
            case "BUS":
                columnName = "BusinessPrice";
                break;
            case "PrEco":
                columnName = "PremiumPrice";
                break;
            default:
                throw new IllegalArgumentException("Invalid class type: " + classType);
        }

        String query = "SELECT " + columnName + " FROM Flights WHERE FlightId = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, flightID);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getDouble(columnName);
                } else {
                    throw new SQLException("Invalid flight ID: " + flightID);
                }
            }
        }
    }

    /*public double calculateDiscountBasedOnAge(int age) {
        if (age >= 1 && age <= 14) {
            return 0.02;
        } else if (age >= 15 && age <= 20) {
            System.out.println();
            return 0.05; // 5% discount for students
        } else if (age >= 60) {
            return 0.05; // 5% discount for senior citizens
        } else {
            return 0.0; // No discount for others
        }
    }*/
}
