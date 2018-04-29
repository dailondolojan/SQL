import java.sql.*;
import java.util.*;

/**
 * The class implements methods of the video and bookstore database
 * interface.
 *
 * All methods of the class receive a Connection object through which all
 * communication to the database should be performed. Note: the
 * Connection object should not be closed by any method.
 *
 * Also, no method should throw any exceptions. In particular, in case
 * that an error occurs in the database, then the method should print an
 * error message and call System.exit(-1);
 * Please make sure that the methods are not prone to SQL Injection
 */
public class StoreApplication {

	/**
	 * Return a list of phone numbers of customers, given a first name and
	 * last name.
	 */
	public List<String> getCustomerPhoneFromFirstLastName(Connection connection,
			String firstName, String lastName) {
		List<String> result = new ArrayList<String>();
		String query = "SELECT phone FROM mg_customers mg_c, dv_address dv_a WHERE mg_c.address_id=dv_a.address_id AND first_name = ? AND last_name = ?";
		PreparedStatement stmt = null;
		ResultSet res = null;

		try {
			stmt = connection.prepareStatement(query);
			stmt.setString(1, firstName); 					// The first '?' is replaced with firstName
			stmt.setString(2, lastName);					// The seecond '?' is replaced with the lastName
			res = stmt.executeQuery();

			if (res != null) {
				// Retrieves results from ResultSet, tuple by tuple
				while (res.next()) {
					String phoneNum = res.getString(1); // Get 1st attribute
					result.add(phoneNum); // Add to end of result array
				}
			}
		} catch (SQLException e) {
			System.err.println("Error while executing query: " + e);
			e.printStackTrace();
		} finally {
			if (res != null) res.close(); //Releases this ResultSet object's database and JDBC resources
			if (stmt != null) stmt.close();
		}
		return result;
	}

	/**
	 * Return list of film titles whose length is is equal to or greater
	 * than the minimum length, and less than or equal to the maximum
	 * length.
	 */
	public List<String> getFilmTitlesBasedOnLengthRange(Connection connection,
			int minLength, int maxLength) {
		List<String> result = new LinkedList<String>();

		String query = "SELECT title FROM dv_film WHERE length >= ? AND length <= ?";
		PreparedStatement stmt = null;
		ResultSet res = null;

		try {
			stmt = connection.prepareStatement(query);
			stmt.setInt(1, minLength); // First '?' in query is replaced with minLength
			stmt.setInt(2, maxLength);
			res = stmt.executeQuery();
			if (res != null) {
				// Retrieving results from ResultSet, tuple by tuple
				while (res.next()) {
					String title = res.getString(1); // Get 1st attribute
					result.add(title); // Add to end of result array
				}
			}
		} catch (SQLException e) {
			System.err.println("Error while executing query: " + e);
			e.printStackTrace();
		} finally {
			if (res != null) res.close(); //Releases this ResultSet object's database and JDBC resources
			if (stmt != null) stmt.close();
		}

		return result;
	}

	/**
	 * Return the number of customers that live in a given district and
	 * have the given active status.
	 */
	public final int countCustomersInDistrict(Connection connection,
			String districtName, boolean active) {
		int result = -1;
		String query = "SELECT COUNT(district) FROM mg_customers mgc, dv_address dva WHERE mgc.address_id=dva.address_id AND active=? and district=? GROUP BY district";
		PreparedStatement stmt = null;
		ResultSet res = null;

		try {
			stmt = connection.prepareStatement(query);
			stmt.setBoolean(1, active);
			stmt.setString(2, districtName);
			res = stmt.executeQuery();
			if (res != null) {
				// Retrieving results from ResultSet, tuple by tuple
				while (res.next()) {
					result = res.getInt(1); // Get 1st attribute
				}
			}
		} catch (SQLException e) {
			System.err.println("Error while executing query: " + e);
			e.printStackTrace();
		} finally {
			if (res != null) res.close(); //Releases this ResultSet object's database and JDBC resources
			if (stmt != null) stmt.close();
		}

		return result;
	}

	/**
	 * Add a film to the inventory, given its title, description,
	 * length, and rating.
	 *
	 * Your query will need to cast the rating parameter to the
	 * enumerared type mpaa_rating. Whereas an uncast parameter is
	 * simply a question mark, casting would look like ?::mpaa_rating
	 */
	public void insertFilmIntoInventory(Connection connection, String
			title, String description, int length, String rating)
	{
		String insert = "INSERT INTO dv_film(title, description, length, rating) VALUES (?, ?, ?, ?::mpaa_rating);";
		PreparedStatement stmt = null;

		try {
			stmt = connection.prepareStatement(insert);
			stmt.setString(1, title);
			stmt.setString(2, description);
			stmt.setInt(3, length);
			stmt.setString(4, rating);
			stmt.executeUpdate();

		} catch (SQLException e) {
			System.err.println("Error while executing query: " + e);
			e.printStackTrace();
		} finally {
			if (stmt != null) stmt.close();
		}
	}

	/**
	 * Constructor
	 */
	public StoreApplication()
	{}

};
