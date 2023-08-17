package Controller;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Airlines_Properities {
    private static final Logger logger = Logger.getLogger(Airlines_Properities.class.getName());

    public static void initiate() {
        final Logger LOGGER = Logger.getLogger(AirlinesReservationSystem.class.getName());

        try {
            logger.info("Starting SkyFly Airlines Reservation System...");
            Connection connection = Airlines_Properities.getConnectionFromProperties("D:\\Aspire\\SkyFly Airlines Reservation System\\AirlinesReservationSystem\\src\\config.properties");
            String adminEmail = "sripathivamsikrishna@admin.com";
            Airlines_Properities.performLoginOrSignUp(connection, adminEmail);
            connection.close();
            logger.info("SkyFly Airlines Reservation System is closed.");
        } catch (Exception exception) {
            logger.log(Level.SEVERE, "An error occurred in the main method.", exception);
        }
    }

    public static Connection getConnectionFromProperties(String filePath) {
        logger.info("Loading properties from file: " + filePath);
        Properties properties = loadPropertiesFile(filePath);

        if (properties != null) {
            String url = properties.getProperty("url");
            String username = properties.getProperty("username");
            String password = properties.getProperty("password");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                return DriverManager.getConnection(url, username, password);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            logger.severe("Failed to load configuration. Exiting the application.");
            System.out.println("Failed to load configuration. Exiting the application.");
        }

        return null;
    }

    public static Properties loadPropertiesFile(String filePath) {
        Properties properties = new Properties();

        try (FileInputStream fis = new FileInputStream(filePath)) {
            properties.load(fis);
        } catch (Exception e) {
            e.printStackTrace();
            properties = null;
        }

        return properties;
    }

    public static void performLoginOrSignUp(Connection connection, String adminEmail) {
        Scanner scanner = new Scanner(System.in);
        int option = 0;

        do {
            System.out.println("Please select an option:");
            System.out.println("1. UserAuthentication");
            System.out.println("2. Register (Sign Up)");

            option = scanner.nextInt();

            if (option != 1 && option != 2) {
                System.out.println("Invalid option selected. Please choose a valid option.");
            }
        } while (option != 1 && option != 2);

        try {
            if (option == 1) {
                logger.info("You have chosen UserAuthentication.");
                System.out.println("\nWelcome to SkyFly Airlines Reservation System");
                System.out.println("Please enter your credentials to proceed.");

                UserAuthentication userAuthentication = new UserAuthentication(adminEmail);
                userAuthentication.performLogin(connection, true);
            } else if (option == 2) {
                logger.info("You have chosen to register (sign up).");
                System.out.println("\nWelcome to SkyFly Airlines Reservation System");
                System.out.println("To create an account, please provide the following information:");

                adminEmail = loadAdminEmailFromConfig();

                UserRegistration userRegistration = new UserRegistration();
                userRegistration.performSignUp(connection, adminEmail);
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, "An error occurred during login or signup.", e);
        }
    }

    private static String loadAdminEmailFromConfig() {
        Properties properties = loadPropertiesFile("D:\\Aspire\\SkyFly Airlines Reservation System\\AirlinesReservationSystem\\src\\config.properties"); // Update the path
        return properties.getProperty("adminEmail");
    }

}


