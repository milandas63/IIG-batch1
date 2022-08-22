
public class ReplFromArr {
	String text = "Hello";
	//String text = "Quick Brown Fox Jumps Over The Lazy Dog";
	String[][] ch = {{"a","ae"},{"e","ii"},{"i","ai"},{"o","aw"},{"u","yu"}};
	char eachText;
	public ReplFromArr() {
		StringBuffer buf = new StringBuffer();
		boolean yesno = true;
		int j=0;
		for(int i=0; i<text.length(); i++) {
			yesno = false;
			eachText = text.charAt(i);
			for(j=0; j<ch.length; j++) {
				if(eachText==ch[j][0].charAt(0)) {
					yesno = true;
					break;
				}
			}
			if(yesno) buf.append(ch[j][1]);
			else buf.append(eachText);
		}
		System.out.println(buf);
	}
	public static void main(String[] args) {
		new ReplFromArr();
	}

}
