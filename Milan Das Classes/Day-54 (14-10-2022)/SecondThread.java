package using.thread;

public class SecondThread implements Runnable {
	public SecondThread() {
		Thread t1 = new Thread(this);
		Thread t2 = new Thread(new ThirdThread());
		t1.start();
		t2.start();
		for(int i=65; i<=122; i++) {
			System.out.print( "  "+((char)i) );
		}
	}
	
	public static void main(String[] args) {
		new SecondThread();
	}

	@Override
	public void run() {
		for(int i=65; i<=90; i++) {
			System.out.print("  "+i);
		}
	}

}

class ThirdThread implements Runnable {
	@Override
	public void run() {
		for(int i=1001; i<=1050; i++) {
			System.out.print("  "+i);
		}
	}
}