package cosmos;

import cosmos.Mercury;
import cosmos.Earth;
import cosmos.Jupiter;
import cosmos.Mars;
import cosmos.Saturn;
import cosmos.Pluto;

public class Planet {
	public static void main(String[] args) {
		SolarSystem ss = new Mercury();
		System.out.println("Distance of "+ss.getname()+" to Sun: " + ss.distance() + " Km.");
		System.out.println("Area of "+ss.getname()+": " + ss.area() + " Sq. Km.");
		SolarSystem ss1 = new Earth();
		System.out.println("Distance of "+ss1.getname()+" to Sun: " + ss1.distance() + " Km.");
		System.out.println("Area of "+ss1.getname()+": " + ss1.area() + " Sq. Km.");
		SolarSystem ss2 = new Jupiter();
		System.out.println("Distance of "+ss2.getname()+" to Sun: " + ss2.distance() + " Km.");
		System.out.println("Area of "+ss2.getname()+": " + ss2.area() + " Sq. Km.");
		SolarSystem ss3 = new Mars();
		System.out.println("Distance of "+ss3.getname()+" to Sun: " + ss3.distance() + " Km.");
		System.out.println("Area of "+ss3.getname()+": " + ss3.area() + " Sq. Km.");
		SolarSystem ss4 = new Saturn();
		System.out.println("Distance of "+ss4.getname()+" to Sun: " + ss4.distance() + " Km.");
		System.out.println("Area of "+ss4.getname()+": " + ss4.area() + " Sq. Km.");
		SolarSystem ss5 = new Pluto();
		System.out.println("Distance of "+ss5.getname()+" to Sun: " + ss5.distance() + " Km.");
		System.out.println("Area of "+ss5.getname()+": " + ss5.area() + " Sq. Km.");
	}
}
