package Controller;

import Model.FlightPriceCalculator;
import Model.Booking;
import View.Flights;

import java.sql.*;
import java.util.*;

public class FlightBooking {
    public void booking(Connection connection) throws SQLException {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Booking Flight ... ");
        System.out.println("----------------------------------------");

        System.out.println("Enter the number of seats you want... ");
        int seatsCount = scanner.nextInt();
        scanner.nextLine();

        List<Booking> Bookings = new ArrayList<>();
        double total = 0.0;
        double basePrice = 0.0;
        double taxAmount = 0.0;
        //double discount = 0.0;
        //double discountedTotal = 0.0;

        System.out.println("Please enter Flight ID: ");
        int flightId = scanner.nextInt();
        scanner.nextLine();

        FlightPriceCalculator priceCalculator = new FlightPriceCalculator();

        for (int i = 0; i < seatsCount; i++) {

            String passengerName;
            do {
                System.out.println("Please provide us with the passenger's name:");
                passengerName = scanner.nextLine();
                if (!isValidNameLength(passengerName)) {
                    System.out.println("Invalid name length. Name should have at least three characters.");
                }
            }while (!isValidNameLength(passengerName));

            if (!isValidNameLength(passengerName)) {
                System.out.println("Invalid name length. Name should have at least three characters.");
            }

            flightId = flightId;

            System.out.println("Please provide us with your nationality (If you are from India - please type - IND or If you are from United States - please type - US. If other states type accordingly):");
            String nationality = scanner.nextLine();

            System.out.println("Please enter passenger's Passport Number (optional): ");
            String passportNumber = scanner.nextLine();

            System.out.println("Date of Expiry of passenger's passport (Optional): ");
            String date = scanner.nextLine();
            if (date.isEmpty()) {
                date = null;
            }

            System.out.println("Passport Issue Country (optional): ");
            String country = scanner.nextLine();

            System.out.println("Please provide us with other details:");

            System.out.println("Provide us with passenger's address:");
            String address = scanner.nextLine();

            System.out.println("Please enter passenger's email ID: ");
            String email = scanner.nextLine();

            System.out.println("Enter passenger's phone number: ");
            String mobileNumber = scanner.nextLine();

            int age = getPassengerAge();

            System.out.println("Please select your seat - 1 for aisle, 2 for middle, and 3 for window seats:");
            int seatNumber = scanner.nextInt();
            scanner.nextLine();

            Random random = new Random();
            char alphabets = (char) (random.nextInt(26) + 'A');
            String seatSelection = String.valueOf(alphabets) + seatNumber;

            System.out.println("Flight Meals Options - VEG or Non-VEG:");
            String meals = scanner.nextLine();

            System.out.println("Enter which class you want to travel... " +
                    "Economy(ECO) / Business (BUS) / Premium Economy(PrEco):");
            String classType = scanner.nextLine();

            boolean isBookingSuccessful = false;
            while (!isBookingSuccessful) {
                try {
                    isBookingSuccessful = updateSeatAvailability(connection, flightId, classType);
                } catch (SQLException e) {
                    System.out.println(e.getMessage());
                    System.out.println("Please choose another class type.");
                    classType = scanner.nextLine();
                }
            }
            String bookingId = BookingIdGenerator.generateBookingId();
            registration(connection, bookingId, flightId, passengerName, nationality, passportNumber, date, country, address, email, mobileNumber, seatSelection, meals, classType, seatsCount, age);
            basePrice = priceCalculator.calculateBasePrice(connection, flightId, classType);
            double price = priceCalculator.calculatePrice(connection, flightId, classType, age);
            taxAmount = priceCalculator.calculateTax(price);
            double totalAmount = price + taxAmount; // Calculate total price including tax

            //Discount
            //discount = (priceCalculator.calculateDiscountBasedOnAge(age) * 100);
            //discountedTotal = basePrice - (basePrice * discount);

            Booking booking = new Booking(bookingId, passengerName, basePrice, totalAmount - basePrice, totalAmount); // No discount
            Bookings.add(booking);

            total += totalAmount;
        }
        double taxPercentage = 0.18;
        double grandTotal = total;
        String updateQuery = "UPDATE Bookings SET totalPrice = ? WHERE flightId = ? AND bookingId = ?";
        try (PreparedStatement updateStatement = connection.prepareStatement(updateQuery)) {
            updateStatement.setDouble(1, grandTotal);
            updateStatement.setInt(2, flightId);
            updateStatement.setString(3, Bookings.get(0).getBookingId());
            updateStatement.executeUpdate();
        }
        for (Booking booking : Bookings) {
            double totalAmount = booking.getTicketPrice();
            taxAmount = priceCalculator.calculateTax(basePrice);
            total = taxAmount + basePrice;


            System.out.println("---------------------------------------------------------------");
            System.out.println("Summary of the bill for Passenger: " + booking.getPassengerName());
            System.out.println("---------------------------------------------------------------");
            System.out.println("Booking Id: " + booking.getBookingId());

            System.out.printf("%-30s || %-10s%n", "Ticket price", "₹" + basePrice);

            //System.out.printf("%-30s || %-10s%n", "Discount applied", "₹" + (discount * 100) , "%");
            //System.out.printf("%-30s || %-10s%n", "Updated price (after discount)", "₹" +discountedTotal);
            System.out.printf("%-30s || %-10s%n", "Seats selected", 1);
            System.out.printf("%-30s || %-10s%n", "Inclusive taxes (" + (taxPercentage * 100) + "%)", "₹" + taxAmount);

            //basePrice += taxAmount;
            System.out.printf("%-30s || %-10s%n", "Grand total", "₹" + total);

            System.out.println("---------------------------------------------------------------");
        }

        System.out.println("Congratulations! You have successfully booked the flight tickets...");
        System.out.println("-------------------------------------------------------------------------------------------------------------------------------------");
        System.out.println("NOTE: Each passenger is allowed with 20kg weighted luggage to carry... ");
        System.out.println("For additional luggage support, please select 'Special Services' from the menu");
        System.out.println("-------------------------------------------------------------------------------------------------------------------------------------");
        System.out.println("If you wish to go on a round trip... you can choose option 1 to go with another trip... ");
        System.out.println("-------------------------------------------------------------------------------------------------------------------------------------");
        System.out.println("You can explore the other options as well.");

        Flights flights = new Flights();
        flights.flightDetails(connection);
    }

    private boolean updateSeatAvailability(Connection connection, int flightId, String classType) throws SQLException {
        String columnName;
        String columnNameBooked;
        switch (classType) {
            case "ECO":
                columnName = "EconomyAvailableSeats";
                columnNameBooked = "EconomyBookedSeats";
                break;
            case "BUS":
                columnName = "BusinessAvailableSeats";
                columnNameBooked = "BusinessBookedSeats";
                break;
            case "PrEco":
                columnName = "PremiumAvailableSeats";
                columnNameBooked = "PremiumBookedSeats";
                break;
            default:
                throw new IllegalArgumentException("Invalid class type: " + classType);
        }

        String checkAvailabilityQuery = "SELECT " + columnName + " FROM Flights WHERE FlightId = ?";
        String updateQuery = "UPDATE Flights SET " +
                columnName + " = CASE WHEN " + columnName + " > 0 THEN " + columnName + " - 1 ELSE " + columnName + " END, " +
                columnNameBooked + " = CASE WHEN " + columnName + " > 0 THEN " + columnNameBooked + " + 1 ELSE " + columnNameBooked + " END " +
                "WHERE FlightId = ? AND " + columnName + " > 0";

        try (PreparedStatement checkStatement = connection.prepareStatement(checkAvailabilityQuery);
             PreparedStatement updateStatement = connection.prepareStatement(updateQuery)) {
            checkStatement.setInt(1, flightId);
            ResultSet resultSet = checkStatement.executeQuery();
            if (resultSet.next()) {
                int availableSeats = resultSet.getInt(1);
                if (availableSeats > 0) {
                    updateStatement.setInt(1, flightId);
                    int rowsAffected = updateStatement.executeUpdate();

                    if (rowsAffected == 0) {
                        throw new SQLException("Invalid flight ID: " + flightId);
                    }

                    return true;
                } else {
                    throw new SQLException("No available seats for class type: " + classType + " on flight ID: " + flightId + ". Please try with other classes.");
                }
            } else {
                throw new SQLException("Invalid flight ID: " + flightId);
            }
        }
    }

    private int getPassengerAge() {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Please enter passenger's age: ");
        return scanner.nextInt();
    }

    public void registration(Connection connection, String bookingId, int flightId, String passengerName, String nationality, String passportNumber, String date, String country, String address, String email, String mobileNumber, String seatSelection, String meals, String classType, int seatsBooked, int age) throws SQLException {
        String query = "INSERT INTO Bookings (bookingId, flightId, passengerName, nationality, passportNumber, dateOfExpiry, passportIssueCountry, address, email, mobileNumber, seatSelection, inFlightMeal, classType, seatsBooked, age) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, bookingId);
            preparedStatement.setInt(2, flightId);
            preparedStatement.setString(3, passengerName);
            preparedStatement.setString(4, nationality);
            preparedStatement.setString(5, passportNumber);
            preparedStatement.setString(6, date);
            preparedStatement.setString(7, country);
            preparedStatement.setString(8, address);
            preparedStatement.setString(9, email);
            preparedStatement.setString(10, mobileNumber);
            preparedStatement.setString(11, seatSelection);
            preparedStatement.setString(12, meals);
            preparedStatement.setString(13, classType);
            preparedStatement.setInt(14, seatsBooked);
            preparedStatement.setInt(15, age);

            preparedStatement.executeUpdate();
        }
    }

    private boolean isValidNameLength(String name) {
        return name.length() >= 3;
    }
}

class BookingIdGenerator {
    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

    public static String generateBookingId() {
        Random random = new Random();
        StringBuilder bookingId = new StringBuilder();

        for (int i = 0; i < 12; i++) {
            int index = random.nextInt(CHARACTERS.length());
            char randomChar = CHARACTERS.charAt(index);
            bookingId.append(randomChar);
        }

        return bookingId.toString();
    }
}
