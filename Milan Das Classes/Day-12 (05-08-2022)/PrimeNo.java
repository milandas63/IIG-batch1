
public class PrimeNo {

	public static void main(String[] args) {
		int x = 2000;
		int y = 5000;
		int count = 0;
		boolean yn;
		
		for(int i=x; i<=y; i++) {
			yn = true;
			for(int j=2; j<i; j++) {
				if(i%j==0) {
					yn = false;
					break;
				}
			}
			if(yn) {
				System.out.print(i+" ");
				count++;
				if(count>=15) {
					System.out.println();
					count = 0;
				}
			}
		}
	}

}
