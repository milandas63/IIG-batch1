import java.lang.reflect.Method;

public class Reflection {
	public Reflection() throws ClassNotFoundException {
		Class c = Class.forName("java.lang.String");
		Method[] m = c.getDeclaredMethods();
		for(int i=0; i<m.length; i++) {
			System.out.println(m[i]);
		}
	}
	
	public static void main(String[] args) throws Exception {
		new Reflection();
	}

}
