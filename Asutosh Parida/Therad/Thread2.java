package Thread;

public class Thread2 implements Runnable{
	public Thread2() {
		Thread t1 = new Thread(this);
		Thread t2 = new Thread(new ThirdThread());
		t1.start();
		t2.start();
		for(int i=1001; i<=1050; i++) {
			System.out.print( "  "+i );
		} 
	}
	
	public static void main(String[] args) {
		new Thread2();
	}

	@Override
	public void run() {
		
		for(int i=1051; i<=2100; i++) {
			System.out.print("  "+i);
		}
	}

}

class ThirdThread implements Runnable {
	@Override
	public void run() {
		for(int i=3001; i<=3050; i++) {
			System.out.print("  "+i);
		}
	}

	public static void main(String[] args) {
		
	}

}
