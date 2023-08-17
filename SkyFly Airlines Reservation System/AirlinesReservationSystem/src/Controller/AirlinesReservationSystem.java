package Controller;

/*
 * Project Title : SkyFly Airlines Reservation System
 * Author : Sripathi Vamsi Krishna
 * Date Created : 22-06-2023
 * Dependencies : mysql connector, JDK 20
 * Project Reviewed on :
 * Reviewed by:
 * */



import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AirlinesReservationSystem {
    public static void main(String[] args) {
        Airlines_Properities airlinesProperities = new Airlines_Properities();
        airlinesProperities.initiate();

    }
}
