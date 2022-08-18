package Javame;

public class TrangleQ {
	public static void main(String[] args) {
		int n = 10;
		for (int i = 1; i <= n; i++) {
			for (int j = i; j < n; j++) {
				System.out.print(" ");
			}
			for (int p = 1; p <= (2 * i - 1); p++) {
				if (p == 1 || i == n || p == (2 * i - 1)) {
					System.out.print("*");
				} else {
					System.out.print(" ");
				}
			}
			System.out.println("");
		}
	}
}