public class AnsFirst{
static String text="Quick Brown Fox Jumps Over The Lazy Dog";
public static void main(String[] args) {
		 char[] vowels = {'a', 'e', 'i', 'o', 'u'};
 String insertrAfterVowel(String input){

	    char[] tmp=input.toCharArray();

	    for (int i = 0; i < tmp.length; i++) {
	        char[] vowels;
			if (tmp[i]== vowels[i]){
	            tmp[i]+='r';
	            return tmp.toString();
	        }
	    }
	    return "";

	    
}
}
