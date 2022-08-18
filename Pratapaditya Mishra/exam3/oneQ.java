package Javame;
import java.util.Scanner;
public class oneQ{
    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        System.out.println("Enter a string:");
        String str = in.nextLine();
        String newStr = "r";
        int len = str.length();

        for (int i = 0; i < len; i++) {
            char ch = str.charAt(i);
            if (ch == 'a'||
            ch == 'e' ||
            ch == 'i' ||
            ch == 'o' ||
            ch == 'u'
            ) {
                newStr = newStr+ 'r';
            }
            else {
                newStr = newStr + ch;
            }
            
        }
        
        System.out.println(newStr);
    }
}