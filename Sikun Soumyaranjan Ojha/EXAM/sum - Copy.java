import java.util.Scanner;
public class sum
{
    public static void main(String[] args)
    {
        Scanner sc = new Scanner(System.in);
        
        System.out.print("Enter the value of n: ");
        int n = sc.nextInt();
        int k=1;
        
        for(int i=1;i<=n;i+=2)
        {
            k *= 1;
            System.out.print((k*i)+",");
        }
    }
}
	
