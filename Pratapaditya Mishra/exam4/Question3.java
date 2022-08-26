package examMe;

public class Question3 {

	static int power(int x, int y) {
		if (y == 0)
			return 1;
		else
			return x * power(x, y - 1);
	}

	public static void main(String[] args) {
		int x = 2;
		int y = 4;

		System.out.println(power(x, y));
	}
}