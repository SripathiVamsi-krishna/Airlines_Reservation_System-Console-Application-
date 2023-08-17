package Controller;

import java.util.*;
import java.sql.*;
import java.util.stream.Collectors;

class ClassesSelection {
    public Connection connection;

    public ClassesSelection(Connection connection) {
        this.connection = connection;
    }

    public void classTypesandSeats(List<Integer> flightIds, String departureDate) {
        try {

            String flightIdsList = flightIds.stream()
                    .map(String::valueOf)
                    .collect(Collectors.joining(", "));

            String query = "SELECT FlightId, EconomyPrice, EconomyAvailableSeats, BusinessPrice, BusinessAvailableSeats, PremiumPrice, PremiumAvailableSeats FROM Flights WHERE FlightId IN (" + flightIdsList + ") AND DepartureDate = ?";

            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, departureDate);
                ResultSet resultSet = preparedStatement.executeQuery();

                Map<Integer, FlightInfo> flightInfoMap = new HashMap<>();

                while (resultSet.next()) {
                    int flightId = resultSet.getInt("FlightId");
                    double economyPrice = resultSet.getDouble("EconomyPrice");
                    int economySeats = resultSet.getInt("EconomyAvailableSeats");
                    double businessPrice = resultSet.getDouble("BusinessPrice");
                    int businessSeats = resultSet.getInt("BusinessAvailableSeats");
                    double premiumPrice = resultSet.getDouble("PremiumPrice");
                    int premiumSeats = resultSet.getInt("PremiumAvailableSeats");

                    FlightInfo flightInfo = new FlightInfo(economyPrice, economySeats, businessPrice, businessSeats, premiumPrice, premiumSeats);
                    flightInfoMap.put(flightId, flightInfo);
                }

                System.out.println("Classes Availability and their prices:");
                System.out.println("--------------------------------------");

                for (int flightId : flightIds) {
                    FlightInfo flightInfo = flightInfoMap.get(flightId);
                    if (flightInfo != null) {
                        System.out.println("Flight ID: " + flightId);
                        System.out.println("Economy Class Price: " + flightInfo.economyPrice + " and available seats: " + flightInfo.economySeats);
                        System.out.println("Business Class Price: " + flightInfo.businessPrice + " and available seats: " + flightInfo.businessSeats);
                        System.out.println("Premium Economy Class Price: " + flightInfo.premiumPrice + " and available seats: " + flightInfo.premiumSeats);
                        System.out.println("-----------------------------------------------------");
                    }
                }

                resultSet.close();
            }
        } catch (SQLException sqlException) {
            sqlException.printStackTrace();
        }
    }
}


class FlightInfo {
    protected double economyPrice;



    protected int economySeats;
    protected double businessPrice;
    protected int businessSeats;
    protected double premiumPrice;
    protected int premiumSeats;

    public FlightInfo(double economyPrice, int economySeats, double businessPrice, int businessSeats, double premiumPrice, int premiumSeats) {
        this.economyPrice = economyPrice;
        this.economySeats = economySeats;
        this.businessPrice = businessPrice;
        this.businessSeats = businessSeats;
        this.premiumPrice = premiumPrice;
        this.premiumSeats = premiumSeats;
    }

    public int getEconomySeats() {
        return economySeats;
    }

    public void setEconomySeats(int economySeats) {
        this.economySeats = economySeats;
    }

    public double getEconomyPrice() {
        return economyPrice;
    }

    public void setEconomyPrice(double economyPrice) {
        this.economyPrice = economyPrice;
    }

    public int getBusinessSeats() {
        return businessSeats;
    }

    public void setBusinessSeats(int businessSeats) {
        this.businessSeats = businessSeats;
    }

    public double getPremiumPrice() {
        return premiumPrice;
    }

    public void setPremiumPrice(double premiumPrice) {
        this.premiumPrice = premiumPrice;
    }

    public int getPremiumSeats() {
        return premiumSeats;
    }

    public void setPremiumSeats(int premiumSeats) {
        this.premiumSeats = premiumSeats;
    }
}

