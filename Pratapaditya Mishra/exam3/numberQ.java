package Javame;

public class numberQ {
	public static void main(String argc[]) {
		int n = 728394879;
		System.out.println(digSum(n));
	}

	static int digSum(int n) {
		int sum = 0;
		while (n > 0 || sum > 9) {
			if (n == 0) {
				n = sum;
				sum = 0;
			}
			sum += n % 10;
			n /= 10;
		}
		return sum;
	}
}