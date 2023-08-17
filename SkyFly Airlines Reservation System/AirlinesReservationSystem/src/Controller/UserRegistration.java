package Controller;

import java.sql.*;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class UserRegistration {
    public void performSignUp(Connection connection, String adminEmail) {
        try {

            Scanner scanner = new Scanner(System.in);
            System.out.println("Please enter the details required for signing you up to start the exciting journey");
            String name;
            do {
                System.out.println("Enter your Full name:");
                name = scanner.nextLine();

                if (!isValidNameLength(name)) {
                    System.out.println("Invalid name length. Name should have at least three characters.");
                    return;
                }
            } while (!isValidNameLength(name));
            System.out.println("Enter your age:");
            String ageString = scanner.nextLine();
            int age = Integer.parseInt(ageString);

            String email;
            do {
                System.out.println("Please provide your email address:");
                email = scanner.nextLine();
                if (!isValidEmail(email)) {
                    System.out.println("Invalid email address. Please enter a valid email.");
                    return;
                }
            } while (!isValidEmail(email));

            // Validate the email address using regular expressions

            System.out.println("Enter your password:");
            String password = scanner.nextLine();
            System.out.println("Final requirement has come...");

            String mobileno;
            // Validate the mobile number using regular expressions
            do {
                System.out.println("Please provide us with your phone number:");
                mobileno = scanner.nextLine();
                if (!isValidMobileNumber(mobileno)) {
                    System.out.println("Invalid mobile number. Please enter a valid mobile number.");
                    return;
                }
            } while (!isValidMobileNumber(mobileno));

            addUser(connection, name, age, email, password, mobileno);
            System.out.println("Congratulations!!! We have signed you up successfully. Excited to start the journey with you...");
            System.out.println("Now you can login to the portal ...!!!");

            UserAuthentication userAuthentication1 = new UserAuthentication(adminEmail);
            if (isAdmin(email, connection)) {
                userAuthentication1.performLogin(connection, true);
            } else {
                userAuthentication1.performLogin(connection, false);
            }

        } catch (Exception exception) {
            System.out.println("Error Occurred while performing signing up : " + exception.getMessage());
            exception.printStackTrace();
        }
    }

    public void addUser(Connection connection, String name, int age, String email, String password, String mobileno) {
        String query = "INSERT INTO SignUpData (ID, NAME, AGE, email, UserPassword, MobileNo)\n" +
                "VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setNull(1, Types.INTEGER);
            preparedStatement.setString(2, name);
            preparedStatement.setInt(3, age);
            preparedStatement.setString(4, email);
            preparedStatement.setString(5, password);
            preparedStatement.setString(6, mobileno);

            preparedStatement.executeUpdate();
        } catch (SQLException sqlException) {
            System.out.println("Error occurred while adding user: " + sqlException.getMessage());
            sqlException.printStackTrace();
        }
    }

    private boolean isValidEmail(String email) {
        String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
        Pattern pattern = Pattern.compile(emailRegex);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

    private boolean isValidMobileNumber(String mobileno) {
        String mobileRegex = "^[0-9]{10}$";
        Pattern pattern = Pattern.compile(mobileRegex);
        Matcher matcher = pattern.matcher(mobileno);
        return matcher.matches();
    }

    private boolean isValidNameLength(String name) {
        return name.length() >= 3;
    }

    private boolean isAdmin(String email, Connection connection) {
        String query = "SELECT * FROM Admins WHERE AdminEmail = ?";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, email);

            try (ResultSet resultSet = statement.executeQuery()) {
                return resultSet.next();
            }
        } catch (SQLException sqlException) {
            System.out.println("Error occurred while verifying admin status: " + sqlException.getMessage());
            return false;
        }
    }
}
