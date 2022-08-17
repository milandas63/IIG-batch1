
public class Instance {
	String father = "Jawaharlal";
	static String child = "Indira";

	public static void main(String[] args) {
		Instance a = new Instance();
		Instance b = new Instance();
		Instance c = new Instance();

		System.out.println(a.father + " " + a.child);
		System.out.println(b.father + " " + b.child);
		System.out.println(c.father + " " + c.child);
		System.out.println();

		a.father = "Biju";
		a.child = "Naveen";
		System.out.println(a.father + " " + a.child);
		System.out.println(b.father + " " + b.child);
		System.out.println(c.father + " " + c.child);
		System.out.println();
		
		a.call();
		System.out.println(child);
		//System.out.println(this);
	}

	public String toString() {
		String rValue = "Instance"+hashCode();
		return rValue;
		
	}
	
	public void call() {
		System.out.println(this);
	}
}
