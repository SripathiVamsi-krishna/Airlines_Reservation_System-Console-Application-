package Controller;

import View.Flights;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Scanner;

public class UserAuthentication {
    private static final String LOGIN_TABLE_NAME = "LoginData";
    private static final String ADMIN_TABLE_NAME = "Admins";
    private static final String COLUMN_NAME_NAME = "Name";
    private static final String COLUMN_NAME_EMAIL = "email"; // Assuming you have this column in LoginData table
    private static final String COLUMN_NAME_PASSWORD = "UserPassword";

    public UserAuthentication(String adminEmail) {
    }

    public boolean verifyUserLogin(Connection connection, String email, String password) {
        String query = "SELECT * FROM " + LOGIN_TABLE_NAME + " WHERE " + COLUMN_NAME_EMAIL + " = ? AND " + COLUMN_NAME_PASSWORD + " = ?";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, email);
            statement.setString(2, password);

            try (ResultSet resultSet = statement.executeQuery()) {
                return resultSet.next();
            }
        } catch (SQLException sqlException) {
            System.out.println("Error occurred while verifying user login: " + sqlException.getMessage());
            return false;
        }
    }

    public boolean verifyAdminLogin(Connection connection, String email, String password) {
        String query = "SELECT * FROM " + ADMIN_TABLE_NAME + " WHERE AdminEmail = ? AND AdminPassword = ?";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, email);
            statement.setString(2, password);

            try (ResultSet resultSet = statement.executeQuery()) {
                return resultSet.next();
            }
        } catch (SQLException sqlException) {
            System.out.println("Error occurred while verifying admin login: " + sqlException.getMessage());
            return false;
        }
    }

    public void performLogin(Connection connection, boolean b) {
        try (Scanner scanner = new Scanner(System.in)) {
            boolean loginSuccessful = false;

            while (!loginSuccessful) {
                System.out.println("Email address:");
                String email = scanner.nextLine();

                char[] passwordChars;
                if (System.console() != null) {
                    System.out.println("Password:");
                    passwordChars = System.console().readPassword();
                } else {
                    System.out.println("Password:");
                    String password = scanner.nextLine();
                    passwordChars = password.toCharArray();
                }

                try {
                    String password = new String(passwordChars); // Convert char[] to String

                    if (verifyAdminLogin(connection, email, password)) {
                        performAdminActions(connection);
                        loginSuccessful = true;
                    } else if (verifyUserLogin(connection, email, password)) {
                        String name = getName(connection, email);
                        System.out.println("UserAuthentication Successful! Welcome, " + name + "! You can now proceed with your bookings.");

                        Flights flights = new Flights();
                        flights.flightDetails(connection);

                        loginSuccessful = true;
                    } else {
                        System.out.println("UserAuthentication Failed. Invalid Credentials. Please try again.");
                    }
                } catch (Exception exception) {
                    System.out.println("Error occurred during login: " + exception.getMessage());
                    // Clear the char[] containing the password after use in case of an error
                    Arrays.fill(passwordChars, ' ');
                }
            }
        }
    }

    private void performAdminActions(Connection connection) {
        // Implement admin actions here, e.g., manage flights, routes, bookings, etc.
        System.out.println("Admin Login Successful! You have access to admin functionalities.");
        AdminServices adminServices = new AdminServices(connection);
        adminServices.startAdminPanel();

    }

    private String getName(Connection connection, String email) {
        String query = "SELECT " + COLUMN_NAME_NAME + " FROM " + LOGIN_TABLE_NAME + " WHERE " + COLUMN_NAME_EMAIL + " = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, email);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getString(COLUMN_NAME_NAME);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error occurred while retrieving user name: " + e.getMessage());
        }
        return null;
    }
}
