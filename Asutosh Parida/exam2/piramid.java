package java4;

public class piramid {

	public static void main(String[] args) {
Scanner scan=new Scanner(System.in);
System.out.println("Enter the number of rows");
int rows=scan.nextInt();
int i,j;
for(i=1; i<=rows; i++){
   for(j=1; j<=rows-i; j++){
   System.out.print(" ");
}
   for(j=i; j>0; j--){
   System.out.print((char)(j+64));
}
    for(j=2; j<=i; j++){
   System.out.print((char)(j+64));
}
System.out.println();

	}

}
