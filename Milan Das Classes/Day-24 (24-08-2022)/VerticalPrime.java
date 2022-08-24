
public class VerticalPrime {
	public static int start = 2000;
	public static int end = 5000;
	public static int[][] output;
	public static int maxRow = 25;
	public static int maxCol = 15;

	public static void main(String[] args) {
		output = new int[maxRow][maxCol];
		generate();
		print();
	}

	private static void generate() {
		boolean yesno;
		int row = 0, col = 0;

		for(int i=start; i<=end; i++) {
			yesno = true;
			for(int j=2; j<(i/2); j++) {
				if(i%j==0) {
					yesno = false;
					break;
				}
			}
			if(yesno) {
				output[row][col] = i;
				row++;
				if(row>=maxRow) {
					row = 0;
					col++;
					if(col>=maxCol) {
						return;
					}
				}
			}
		}
	}

	private static void print() {
		for(int row=0; row<output.length; row++) {
			System.out.println();
			for(int col=0; col<output[row].length; col++) {
				if(output[row][col]>0)
					System.out.print(output[row][col] + " ");
			}
		}
	}
}
