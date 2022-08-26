package test4;

import java.util.Scanner;

public class q_3 {

	public static void main(String args[])
	{
		Scanner s = new Scanner(System.in);
    		System.out.println("Enter base");
    		int b=s.nextInt();
    		System.out.println("Enter exponent");
    		int e=s.nextInt();
    		System.out.println("P("+b+"^"+e+") = "+p(b,e));
		
    	}
	
	static int p(int b,int e)
	{
		if(e==0)
        		return 1;
    		else 
        		return (b*p(b,e-1));	
	}
	}


