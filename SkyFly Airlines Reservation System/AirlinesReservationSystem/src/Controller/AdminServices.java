package Controller;

import java.sql.Connection;
import java.util.Scanner;
import java.sql.*;

public class AdminServices {
    private Connection connection;

    public AdminServices(Connection connection) {
        this.connection = connection;
    }

    public void startAdminPanel() {
        Scanner scanner = new Scanner(System.in);

        while (true) {
            System.out.println("Admin Menu:");
            System.out.println("1. Manage Users");
            System.out.println("2. Exit");

            int choice = scanner.nextInt();
            scanner.nextLine(); // Consume newline

            switch (choice) {
                case 1:
                    manageUsers();
                    break;
                case 2:
                    System.out.println("Exiting Admin Panel");

                    Airlines_Properities airlinesProperities = new Airlines_Properities();
                    airlinesProperities.initiate();
                    return;
                default:
                    System.out.println("Invalid choice. Please choose a valid option.");
            }
        }
    }
    private void manageUsers() {
        Scanner scanner = new Scanner(System.in);
        int choice;

        do {
            System.out.println("User Management");
            System.out.println("1. View Users");
            System.out.println("2. Edit User");
            System.out.println("3. Delete User");
            System.out.println("0. Back to Main Menu");
            System.out.print("Enter your choice: ");

            choice = scanner.nextInt();
            scanner.nextLine(); // Consume the newline

            switch (choice) {
                case 1:
                    viewUsers(connection);
                    break;
                case 2:
                    editUser(connection);
                    break;
                case 3:
                    deleteUser(connection);
                    break;
                case 0:
                    System.out.println("Returning to main menu...");
                    break;
                default:
                    System.out.println("Invalid choice. Please try again.");
            }
        } while (choice != 0);
    }

    private void viewUsers(Connection connection) {
        String query = "SELECT * FROM SignUpData";

        try (PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            System.out.println("List of Users:");
            while (resultSet.next()) {
                String name = resultSet.getString("Name");
                String email = resultSet.getString("email");
                String mobileNo = resultSet.getString("MobileNo");

                System.out.println("Name: " + name);
                System.out.println("Email: " + email);
                System.out.println("Mobile No: " + mobileNo);
                System.out.println("---------------------");
            }

        } catch (SQLException sqlException) {
            System.out.println("Error occurred while viewing users: " + sqlException.getMessage());
        }
    }

    private void editUser(Connection connection) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter the email of the user you want to edit:");
        String email = scanner.nextLine();

        String query = "SELECT * FROM SignUpData WHERE email = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, email);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    String name = resultSet.getString("Name");
                    int age = resultSet.getInt("AGE");
                    String mobileNo = resultSet.getString("MobileNo");

                    System.out.println("Current User Details:");
                    System.out.println("Name: " + name);
                    System.out.println("Age: " + age);
                    System.out.println("Mobile No: " + mobileNo);

                    System.out.println("Enter new details:");

                    System.out.println("Enter new name:");
                    String newName = scanner.nextLine();

                    System.out.println("Enter new age:");
                    int newAge = Integer.parseInt(scanner.nextLine());

                    System.out.println("Enter new mobile number:");
                    String newMobileNo = scanner.nextLine();

                    // Update the user details in the database
                    updateUser(connection, email, newName, newAge, newMobileNo);

                    System.out.println("User edited successfully.");
                } else {
                    System.out.println("User with the specified email not found.");
                }
            }
        } catch (SQLException sqlException) {
            System.out.println("Error occurred while editing user: " + sqlException.getMessage());
        }
    }

    private void updateUser(Connection connection, String email, String newName, int newAge, String newMobileNo) {
        String query = "UPDATE SignUpData SET Name = ?, AGE = ?, MobileNo = ? WHERE email = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, newName);
            statement.setInt(2, newAge);
            statement.setString(3, newMobileNo);
            statement.setString(4, email);

            statement.executeUpdate();
        } catch (SQLException sqlException) {
            System.out.println("Error occurred while updating user: " + sqlException.getMessage());
        }
    }


    private void deleteUser(Connection connection) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter the email of the user you want to delete:");
        String email = scanner.nextLine();

        String query = "DELETE FROM SignUpData WHERE email = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, email);
            int rowsAffected = statement.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("User deleted successfully.");
            } else {
                System.out.println("User with the specified email not found.");
            }
        } catch (SQLException sqlException) {
            System.out.println("Error occurred while deleting user: " + sqlException.getMessage());
        }
    }


}
