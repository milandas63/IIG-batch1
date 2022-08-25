package io.stream;

public abstract class Incomplete {
	public void print() {
		System.out.println("Some text to print");
	}
	
	public void write() {
		System.out.println("Hello World");
	}
	
	public abstract String read();
}
