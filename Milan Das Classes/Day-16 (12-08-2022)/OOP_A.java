package oops;

public class OOP_A {
	int x = 10;
	String name = "Varsity";
	final String location = "Bhubaneswar";
	final String place;
	
	public String getName() {
		return "James Gosling";
	}

	public final int getAge() {
		return 68;
	}

	public int getAge(boolean yn) {
		return 68;
	}

	public String getGender() {
		location = "Delhi";
		return "Male";
	}

	public void print() {
		System.out.println("J Nehru");
	}
	
	public void run() {
		System.out.println(hashCode());
	}
	
	private String hello() {
		print();
		return "Hello! ";
	}
	
	OOP_A() {
		place = "Bhubaneswar";
	}
	OOP_A(String name) {
		place = "Bhubaneswar";
	}
	OOP_A(String name, int age, int gender) {
		place = "Bhubaneswar";
	}

	void OOP_A() {
		
	}
}

final class OOP_B extends OOP_A {
	public void getData() {
		System.out.println("Name:   "+getName());
		System.out.println("Age:    "+getAge());
		System.out.println("Gender: "+getGender());
		//System.out.println(hello());
		System.out.println(hashCode());
		
	}

	public int getAge() {
		return 52;
	}
	
	public double getWeight() {
		return 100.0;
	}
}

class OOP_C extends OOP_B {
	public static void main(String[] args) {
		OOP_A a = new OOP_A();
		
	}
}

class OOP_D {
	public void say() {
		OOP_A a = new OOP_A() 
		{
			private void sysout() {
				print();
			}
		};
	}
}
