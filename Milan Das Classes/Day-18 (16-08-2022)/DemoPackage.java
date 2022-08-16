import string.helper.Stretcher;

public class DemoPackage {

	public static void main(String[] args) {
		Stretcher s = new Stretcher();
		System.out.println(s.padL("ÍIG Versity",70,'-'));
		System.out.println(s.padC("ÍIG Versity",70,'-'));
		System.out.println(s.padR("ÍIG Versity",70,'-'));

		System.out.println(s.justifyLeft("ÍIG Versity",70,'.'));
		System.out.println(s.justifyCenter("ÍIG Versity",70,'.'));
		System.out.println(s.justifyRight("ÍIG Versity",70,'.'));

	}

}
