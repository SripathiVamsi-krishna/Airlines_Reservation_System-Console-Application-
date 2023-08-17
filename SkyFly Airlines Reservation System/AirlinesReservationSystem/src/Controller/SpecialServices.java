package Controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class SpecialServices {
    public void addSpecialStatus(Connection connection) {
        boolean run = true;
        Scanner scanner = new Scanner(System.in);

        while (run) {
            System.out.println("If you want certain services that are not included in your flight ticket, " +
                    "you must directly request them from the airline.");

            System.out.println();
            System.out.println("PASSENGERS !!! PLEASE NOTE THAT THE SPECIAL SERIVES YOU SELECT WILL BE CAREFULLY REVIEWED THROUGH THE PRIVACY AND POLICIES " +
                    "IN THE RESPECTIVE AIRPORTS AND WILL BE BILLED APART FROM THE TICKET COST");
            System.out.println("The following services fall under this category:");
            System.out.println("---------------------------------------------------------");
            System.out.println("1. Special baggage");
            System.out.println("2. Special meals on board");
            System.out.println("3. Special assistance at the airport");
            System.out.println("4. Travellers with reduced mobility or needing a wheelchair");
            System.out.println("5. Travellers travelling with animals");

            System.out.println("Enter the number corresponding to the special service you require (or 0 to exit):");
            int choice = scanner.nextInt();
            scanner.nextLine();

            if (choice == 0) {
                break;
            }

            System.out.println("Enter the booking ID for which you want to add special services:");
            String bookingId = scanner.nextLine();

            if (bookingId.equals("0")) {
                break;
            }

            switch (choice) {
                case 1:
                    System.out.println("This service includes (bicycles, wheelchairs, sports equipment, musical instruments, etc.");
                    addSpecialBaggage(connection, bookingId);
                    break;
                case 2:
                    System.out.println("If you require any customized meals, please let us know.");
                    addSpecialMeals(connection, bookingId);
                    break;
                case 3:
                    System.out.println("If you require any special assistance like Wheelchair Assistance, " +
                            "Boarding and Deplaning Assistance, " +
                            "Extra Legroom and Seat Assignments, " +
                            "Medical Equipment and Oxygen, " +
                            "Hearing and Vision Impairment Assistance, " +
                            "Assistance for Unaccompanied Minors");
                    addSpecialAssistance(connection, bookingId);
                    break;
                case 4:
                    System.out.println("Wheelchair assistance\n" +
                            "Priority boarding\n" +
                            "Boarding assistance\n" +
                            "Seating accommodations\n" +
                            "Onboard assistance\n" +
                            "Accessible lavatories\n" +
                            "Connecting flight assistance\n" +
                            "Arrival assistance");
                    addReducedMobility(connection, bookingId);
                    break;
                case 5:
                    System.out.println("If you wish to travel with pet animals");
                    System.out.println("Note: you will be allowed to take a cat or small dog in the cabin for an additional fee.. " +
                            "Please Note that it will checked for the policies regarding animal travel in the respective airport.");

                    addAnimalTravelAssistance(connection, bookingId);
                    break;
                default:
                    System.out.println("Invalid choice. Please try again.");
                    break;
            }
        }
    }

    private boolean isBookingExists(Connection connection, String bookingId) {
        String query = "SELECT COUNT(*) FROM SpecialServices WHERE bookingId=?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, bookingId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count > 0;
            }
        } catch (SQLException sqlException) {
            System.out.println("Error occurred while checking booking: " + sqlException.getMessage());
        }
        return false;
    }

    private void insertSpecialService(Connection connection, String bookingId, String column, String value) {
        String insert = "INSERT INTO SpecialServices (bookingId, " + column + ") VALUES (?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(insert)) {
            preparedStatement.setString(1, bookingId);
            preparedStatement.setString(2, value);
            preparedStatement.executeUpdate();
        } catch (SQLException sqlException) {
            System.out.println("Error occurred while inserting special service: " + sqlException.getMessage());
        }
    }

    private void updateSpecialService(Connection connection, String bookingId, String column, String value) {
        String update = "UPDATE SpecialServices SET " + column + "=? WHERE bookingId=?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(update)) {
            preparedStatement.setString(1, value);
            preparedStatement.setString(2, bookingId);
            preparedStatement.executeUpdate();
        }
        catch (SQLException sqlException)
        {
            System.out.println("Error Occured while updating special services : "+sqlException.getMessage());
        }
    }

    private void addSpecialBaggage(Connection connection, String bookingId) {
        System.out.println("Special Baggage");
        System.out.println("----------------");

        Scanner scanner = new Scanner(System.in);

        System.out.println("Enter which service you would like to use:");
        String baggage = scanner.nextLine();

        try {
            if (isBookingExists(connection, bookingId)) {
                updateSpecialService(connection, bookingId, "specialBaggage", baggage);
            } else {
                insertSpecialService(connection, bookingId, "specialBaggage", baggage);
            }
        } catch (Exception Exception) {
            Exception.printStackTrace();
        }

        System.out.println("Special Baggage details are updated...");
        System.out.println("------------------------------------------------------------");
        System.out.println("NOTE !!! THE SPECIAL BAGGAGES YOU SELECT WILL BE CHARGED AFTER APPROVING BY THE AIRPORT STAFF...");
        System.out.println("------------------------------------------------------------");
    }

    private void addSpecialMeals(Connection connection, String bookingId) {
        System.out.println("Special Meals on board...");
        System.out.println("-------------------------------------");

        Scanner scanner = new Scanner(System.in);
        System.out.println("Please Enter your meal preferences or any dietary restrictions");
        String mealPreferences = scanner.nextLine();

        try {
            if (isBookingExists(connection, bookingId)) {
                updateSpecialService(connection, bookingId, "specialMeals", mealPreferences);
            } else {
                insertSpecialService(connection, bookingId, "specialMeals", mealPreferences);
            }
        } catch (Exception sqlException) {
            sqlException.printStackTrace();
        }

        System.out.println("Special Meals are updated successfully...");
        System.out.println("-------------------------------------------------------");
    }

    private void addSpecialAssistance(Connection connection, String bookingId) {
        System.out.println("Special Assistance");
        System.out.println("-------------------------------------------------------");

        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter the sort of special assistance or preference needed.");

        String special = scanner.nextLine();

        try {
            if (isBookingExists(connection, bookingId)) {
                updateSpecialService(connection, bookingId, "specialAssistance", special);
            } else {
                insertSpecialService(connection, bookingId, "specialAssistance", special);
            }
        } catch (Exception sqlException) {
            sqlException.printStackTrace();
        }

        System.out.println("Special Assistance is updated successfully...");
        System.out.println("-------------------------------------------------------");
        System.out.println("This Special Assistance is a complimentary service from our side. No Charges are applied on this...");
        System.out.println("------------------------------------------------------------");
    }

    private void addReducedMobility(Connection connection, String bookingId) {
        System.out.println("Travelers with Reduced Mobility or Needing a Wheelchair");
        System.out.println("-------------------------------------------------------");

        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter any specific requirements you need from the above given options");
        String mobility = scanner.nextLine();

        try {
            if (isBookingExists(connection, bookingId)) {
                updateSpecialService(connection, bookingId, "reducedMobilityAssistance", mobility);
            } else {
                insertSpecialService(connection, bookingId, "reducedMobilityAssistance", mobility);
            }
        } catch (Exception sqlException) {
            sqlException.printStackTrace();
        }

        System.out.println("Reduced Mobility details are updated successfully...");
        System.out.println("-------------------------------------------------------");
        System.out.println("These Services are compliementary to your travel... Happy Journey!!!");
    }

    private void addAnimalTravelAssistance(Connection connection, String bookingId) {
        System.out.println("Traveling with Animals");
        System.out.println("----------------------");

        Scanner scanner = new Scanner(System.in);

        System.out.println("Please enter which animal you would like to travel with..." +
                "\n you must call the airline well in advance; there are limits to the number of animals allowed in the cabin. ");
        String animalAssistance = scanner.nextLine();

        try {
            if (isBookingExists(connection, bookingId)) {
                updateSpecialService(connection, bookingId, "animalTravelAssistance", animalAssistance);
            } else {
                insertSpecialService(connection, bookingId, "animalTravelAssistance", animalAssistance);
            }
        } catch (Exception sqlException) {
            sqlException.printStackTrace();
        }

        System.out.println("Animal travel assistance information updated successfully!");
        System.out.println("-----------------------------------------------");
        System.out.println("PASSENGER'S NOTE:" +
                "If you wish to travel with your pets... Please make sure you provide us with the required documents while check-in");

        System.out.println("Animal's Health (Is it having any health issues) - Please make sure you provide a Verified doctor's" +
                "Medical Certificate");
        System.out.println("Crate or Carrier\n" +
                "Leash and Harness\n" +
                "Food and Water Bowls\n" +
                "Sufficient Food and Treats\n" +
                "Water\n" +
                "Absorbent Pads or Towels\n" +
                "Waste Bags\n" +
                "Medications and First Aid Kit\n" +
                "Comforting Items");

        System.out.println("After all the successful verfication... Airport staff will charge you seperately to travel with your pet...");
    }
}
