package exam;
import java.util.Scanner;

public class MainMenu {
	Stretch s;
	Scanner scan;

	public MainMenu() {
		s = new Stretch();
		scan = new Scanner(System.in);
		String response = "0";

		while(!response.equals("5")) {
			for(int i=0; i<10; i++) System.out.println();
			System.out.println(s.spaces(25) + "Main Menu");
			System.out.println(s.spaces(25) + "1. Contact Group");
			System.out.println(s.spaces(25) + "2. Contact Location");
			System.out.println(s.spaces(25) + "3. Contact People");
			System.out.println(s.spaces(25) + "4. Exit Program");
			System.out.println();
			System.out.print(s.spaces(25) + "Enter Choice [1-5]: ");
			response = scan.nextLine();
			if(response.equals("1")) {
				new ContactGroup(s);
			} else if(response.equals("2")) {
				new ContactLocation(s);
			} else if(response.equals("3")) {
                new ContactPeople(s);
			} else if(response.equals("4")) {

			} else if(response.equals("5")) {
				System.out.println("Program is terminated!");
				break;
			}
		}
	}
	
	public static void main(String[] args) {
		new MainMenu();
	}
}