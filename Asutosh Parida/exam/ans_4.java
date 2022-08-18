package java4;

public class ans_4 {

	public static void main(String[] args) {
		int s = 10;
		for (int i = 1; i <= s; i++) {
			for (int j = i; j < s; j++) {
				System.out.print(" ");
			}
			for (int t = 1; t<= (2 * i - 1); t++) {
				if (t == 1 || i == s || t == (2 * i - 1)) {
					System.out.print("*");
				} else {
					System.out.print(" ");
				}
			}
			System.out.println("");
		}

	}

}
