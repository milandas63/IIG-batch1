import string.helper.Stretcher;

public class DemoPackage {

	public static void main(String[] args) {
		Stretcher s = new Stretcher();
		System.out.println(s.padL("�IG Versity",70,'-'));
		System.out.println(s.padC("�IG Versity",70,'-'));
		System.out.println(s.padR("�IG Versity",70,'-'));

		System.out.println(s.justifyLeft("�IG Versity",70,'.'));
		System.out.println(s.justifyCenter("�IG Versity",70,'.'));
		System.out.println(s.justifyRight("�IG Versity",70,'.'));

	}

}
