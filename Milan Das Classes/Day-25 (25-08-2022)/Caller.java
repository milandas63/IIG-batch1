package io.stream;

public class Caller {
	public static void main(String[] args) {
		Complete i = new Complete();
		i.print();
		i.write();
		
		String s = "Good";
		System.out.println(s.getClass());
	}
}
