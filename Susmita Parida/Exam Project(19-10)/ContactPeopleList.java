package tel.dir;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class ContactPeopleList {
	public Connection conn;
	public Statement stmt;
	public ResultSet rs;
	public ResultSetMetaData rsmd;
	private Scanner scan;
	private int[] colWidth;
	private Stretcher s;
	private String response;

	public ContactPeopleList(Stretcher s) {
		this.s = s;
		scan = new Scanner(System.in);
		String response = "0";
		
		
			

			while(true) {
				for(int i=0; i<10; i++) System.out.println();
				System.out.println(s.spaces(25) + "Contact People List");
				System.out.println(s.spaces(25) + "1. List1");
				System.out.println(s.spaces(25) + "2. List2");
				System.out.println(s.spaces(25) + "3. List3");
				System.out.println(s.spaces(25) + "4. List4");
				System.out.println(s.spaces(25) + "5. Add");
				System.out.println(s.spaces(25) + "6. Edit");
				System.out.println(s.spaces(25) + "7. Delete");
				System.out.println(s.spaces(25) + "8. Exit");
				System.out.println();
				System.out.print(s.spaces(25) + "Enter Choice [1-5]: ");
				response = scan.nextLine();
				if(response.equals("1")) {
					new List1();
					System.out.println("Hit enter to continue...");
					scan.nextLine();
				} else if(response.equals("2")) {
					new List2();
				} else if(response.equals("3")) {
					new List3();
				} else if(response.equals("4")) {
					new List4();
				} else if(response.equals("5")) {
					new TelAdd();
				} else if(response.equals("6")) {
					new TelDelete();
				} else if(response.equals("7")) {
					new TelUpdate();
                } else if(response.equals("8")) {
				System.out.println("Program is terminated!");
					break;
				}
			}
	}
	}