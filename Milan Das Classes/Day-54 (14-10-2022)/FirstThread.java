package using.thread;

import java.lang.Thread;

public class FirstThread extends Thread {
	public FirstThread() {
		this.start();
		for(int i=65; i<=90; i++) {
			System.out.print( "  "+((char)i) );
		}
	}

	public void run() {
		for(int i=65; i<=90; i++) {
			System.out.print("  "+i);
		}
	}
	
	public static void main(String[] args) {
		new FirstThread();
	}
}
