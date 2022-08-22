import java.lang.reflect.Method;

public class Reflection {
	public Reflection() throws ClassNotFoundException {
		Class c = Class.forName("java.util.Date");
		Method[] m = c.getDeclaredMethods();
		for(int i=0; i<m.length; i++) {
			System.out.println(m[i]);
			System.out.println(srink(m[i].toString()));
			System.out.println();
		}
	}
	
	public static void main(String[] args) throws Exception {
		new Reflection();
	}

	private String srink(String data) {
		StringBuffer buf = new StringBuffer();
		boolean yesno = true;
		char c;
		for(int i=data.length()-1; i>=0; i--) {
			c = data.charAt(i);
			switch(c) {
			case '.': yesno = false; break;
			case ' ': yesno = true; break;
			case ',': yesno = true; break;
			case '[': yesno = true; break;
			case ']': yesno = true; break;
			case '(': yesno = true; break;
			case ')': yesno = true; break;
			}
			if(yesno) buf.insert(0, c);
		}
		
		return buf.toString();
	}
}
