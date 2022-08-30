import cosmos.Earth;
import cosmos.Mercury;
import cosmos.SolarSystem;

public class Planet {
	public static void main(String[] args) {
		SolarSystem ss = new Mercury();
		System.out.println("Distance of "+ss.getName()+" to Sun: " + ss.getDistance() + " Km.");
		System.out.println("Area of "+ss.getName()+": " + ss.getArea() + " Sq. Km.");
	}
}
