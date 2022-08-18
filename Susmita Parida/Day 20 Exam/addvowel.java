
public class addvowel {

	public static void main(String[] args) {
	}
	static char[] vowel = {'a', 'e', 'i', 'o', 'u'};
	static String text = "Quick Brown Fox Jumps Over The Lazy Dog";

	
		char[] vowels = {'A','E','I','O','U','a','e','i','o','u'};
		char each;
		int count = 0;{
      for(int i=0; i<text.length(); i++) {
			each = text.charAt(i);
			for(int j=0; j<vowels.length; j++) {
				if(each==vowels[j]) {
					count++;
					break;
				}
			}
		}
		System.out.println("Total vowels = "+count);
		System.out.println("---------------------------------------");

		StringBuffer buf = new StringBuffer();
		for(int i=0; i<text.length(); i++) {
			each = text.charAt(i);
			if(each>=65 && each<=90) {
				each=(char) (each+32);
				buf.append(String.valueOf(each));
			} else if(each>=97 && each<=122) {
				each=(char) (each-32);
				buf.append(String.valueOf(each));
			} else {
				buf.append(each);} 
		}
		}
		
		public static String insertrAfterWovel(String input){

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
		

