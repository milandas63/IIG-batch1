import java.util.Scanner;
class PiramidAlphabet{
public static void main(String args[]){
Scanner scan=new Scanner(System.in);
System.out.println("Enter the number of rows");
int rows=scan.nextInt();
int i,j;
for(i=1; i<=rows; i++){
   for(j=1; j<=rows-i; j++){
   System.out.print(" ");
}
   for(j=1; j<=i; j++){
   System.out.print((char)(j+64));
}
    for(j=i-1; j>=1; j--){
   System.out.print((char)(j+64));
}
System.out.println();
}
}
}
