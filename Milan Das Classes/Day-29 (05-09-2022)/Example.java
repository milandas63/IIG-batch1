
public class Example {
	public static void main() {
		System.out.println("main()");
	}
	public static void main(int x) {
		System.out.println("main(int)");
	}
	public static void main(String x) {
		System.out.println("main(String)");
	}
	public static void main(boolean x) {
		System.out.println("main(boolean)");
	}
	public static void main(char arg) {
		System.out.println("main(char)");
	}
	
	public static void main(String[] args) {
		for(int i=0; i<args.length; i++) {
			System.out.println(args[i]);
		}
		System.out.println("main(String[])");
	}

}
