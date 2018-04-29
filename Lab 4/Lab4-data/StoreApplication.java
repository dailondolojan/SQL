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

		try{
			PreparedStatement st = connection.prepareStatement("SELECT phone FROM mg_customers mg_c, dv_address dv_a WHERE mg_c.address_id=dv_a.address_id AND first_name = ? AND last_name = ?");
			st.setString(1, firstName); //Insert firstName in Query
			st.setString(2,lastName); //Insert lastName in Query
			ResultSet rs = st.executeQuery();

			while (rs.next()) {
				String phoneN = rs.getString(1); // Get 1st attribute
				result.add(phoneN); // Add to results
				System.out.println("phone number is:"+phoneN);
			}
				rs.close();
				st.close();
			}

			catch (SQLException e) {
				System.err.println("Query failed in someMethod()");
				System.err.println("Message from Postgres: " + e.getMessage());
				System.exit(-1);
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

		try{
			PreparedStatement st = connection.prepareStatement("SELECT title FROM dv_film WHERE length >= ? AND length <= ?");
			st.setInt(1, minLength); //Sets first input as minLength
			st.setInt(2, maxLength); //Sets second input as maxLength
			ResultSet rs = st.executeQuery();

			while (rs.next()) {
				String title = rs.getString(1); // Get 1st attribute
				result.add(title); // Add to end of result array
				System.out.println("The Film Name is:"+title); //Print the names of titles
			}
				rs.close();
				st.close();
			}

			catch (SQLException e) {
				System.err.println("Query failed in someMethod()");
				System.err.println("Message from Postgres: " + e.getMessage());
				System.exit(-1);
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

		try{
			PreparedStatement st = connection.prepareStatement("SELECT COUNT(customer_id) FROM mg_customers mg_c, dv_address dv_a WHERE mg_c.address_id=dv_a.address_id AND district=? AND active=?");
			st.setString(1, districtName); //Sets 1st input as districtName
			st.setBoolean(2, active); //Sets 2nd input as active
			ResultSet rs = st.executeQuery();

			while (rs.next()) {
				result = Integer.parseInt(rs.getString(1)); // Get 1st attribute
				System.out.println("The count of customers is:"+result);
			}
				rs.close();
				st.close();
			}

			catch (SQLException e) {
				System.err.println("Query failed in someMethod()");
				System.err.println("Message from Postgres: " + e.getMessage());
				System.exit(-1);
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
		try{
			PreparedStatement st = connection.prepareStatement("INSERT INTO dv_film(title, description, length, rating) VALUES (?, ?, ?, ?::mpaa_rating);");
			st.setString(1, title); //Sets 1st input as title
			st.setString(2, description); //Sets 2nd input as description
			st.setInt(3, length); //Sets 3rd input as length
			st.setString(4, rating); //Sets 4th input as rating
			st.executeUpdate();
			}

			catch (SQLException e) {
				System.err.println("Query failed in someMethod()");
				System.err.println("Message from Postgres: " + e.getMessage());
				System.exit(-1);
			}
	}

	/**
	 * Constructor
	 */
	public StoreApplication()
	{}

};
