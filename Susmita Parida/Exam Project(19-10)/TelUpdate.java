package tel.dir;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TelUpdate {
	Connection conn;
	PreparedStatement stmt;
	ResultSet rs;
	public TelUpdate() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/teldir","root","");
			stmt = conn.prepareStatement("UPDATE ContactGroup SET contact_name=? WHERE contact_id=5",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			stmt.setString(1, "Keonjhar");
			stmt.executeUpdate();

			conn.close();

		} catch(ClassNotFoundException e) {
			System.out.println(e);
		} catch(SQLException e) {
			System.out.println(e);
		} catch(Exception e) {
			System.out.println(e);
		}
	}

	public static void main(String[] args) {
		new TelUpdate();
	}
	}

