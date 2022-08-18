package hhh;

public class question1 {

	public static void main(String[] args) {
		
	}
		static char[] vowel = {'a', 'e', 'i', 'o', 'u'};

	    public static String insertrAfterWovel(String input){
System.out.println(string);
	    char[] tmp=input.toCharArray();

	    for (int i = 0; i < tmp.length; i++) {
	        if (tmp[i]== vowel[i]){
	            tmp[i]+='r';
	            return tmp.toString();
	        }
	    }
	    return "";

	    }
}

