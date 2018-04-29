import java.sql.*;
import java.io.*;
import java.util.*;

/**
 * A sample class that connects to PostgreSQL and runs a simple query.
 *
 * Note: Your database name is your login name, so for login jsmith,
 * you would have
 *    getConnection("jdbc:postgresql://cmps180-db.lt.ucsc.edu/jsmith",
 *    "jsmith" , "password");
 */
public class Driver
{
    public static void main(String[] args) throws
        ClassNotFoundException, FileNotFoundException, IOException, SQLException {
        Connection connection;

   	Class.forName("org.postgresql.Driver");  //Registering the driver
    connection = DriverManager.getConnection(
            "jdbc:postgresql://cmps180-db.lt.ucsc.edu/ddolojan",
            "ddolojan", "ucsc123");  //Making the Connection

    StoreApplication app = new StoreApplication();

    List<String> phoneNumbers = app.getCustomerPhoneFromFirstLastName(connection, "John", "Smith");

    List<String> filmTitles = app.getFilmTitlesBasedOnLengthRange(connection, 60, 120);

    int count = app.countCustomersInDistrict(connection, "Buenos Aires", false);

    app.insertFilmIntoInventory(connection, "Sequel to the Prequel", "Memorable", 98, "PG-13");
}
        catch (SQLException | ClassNotFoundException e) {
            System.out.println("Error while connecting to database: " + e);
            e.printStackTrace();
        } finally {
            if (connection != null) {
                // Closing Connection
                try {
                    connection.close(); //Closing Connection
                    } catch (SQLException e) {
                    System.out.println("Failed to close connection: " + e);
                    e.printStackTrace();
                }
            }
        }
}
