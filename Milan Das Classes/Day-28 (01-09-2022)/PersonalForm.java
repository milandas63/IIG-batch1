package io.stream;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

public class PersonalForm {
	BufferedReader r;
	BufferedWriter w;
	boolean more;
	Stretcher s;

	StringBuffer buf;
	String fname, lname, father, gender, dob, location, email, mobile;

	public PersonalForm() {
		try {
			more = true;
			r = new BufferedReader(new InputStreamReader(System.in));
			w = new BufferedWriter(new OutputStreamWriter(new FileOutputStream("personal.csv",true)));
			s = new Stretcher();
			
			while(more) {
				buf = new StringBuffer();
				for(int i=0; i<20; i++) System.out.println();
				System.out.println(s.padLeft("PERSONAL DATA FORM",30));
				System.out.println(s.padLeft("------------------",30));
				
				System.out.print(s.padLeft("First name: ", 40));
				fname = r.readLine();
				buf.append(fname + ", ");

				System.out.print(s.padLeft("Last name: ", 40));
				lname = r.readLine();
				buf.append(lname + ", ");

				System.out.print(s.padLeft("Father's name: ", 40));
				father = r.readLine();
				buf.append(father + ", ");

				System.out.print(s.padLeft("Gender [M/F]: ", 40));
				gender = r.readLine();
				buf.append(gender + ", ");

				System.out.print(s.padLeft("Date of birth [dd-mm-yyyy]: ", 40));
				dob = r.readLine();
				buf.append(dob+ ", ");

				System.out.print(s.padLeft("Location: ", 40));
				location = r.readLine();
				buf.append(location + ", ");

				System.out.print(s.padLeft("Email-id: ", 40));
				email = r.readLine();
				buf.append(email + ", ");

				System.out.print(s.padLeft("Mobile number: ", 40));
				mobile = r.readLine();
				buf.append(mobile + "\r\n");

				w.write(buf.toString().toCharArray());
				w.flush();
				
				System.out.println();
				System.out.print(s.padLeft("More [Y/N]: ", 40));
				more = r.readLine().toUpperCase().startsWith("Y");
			}
		} catch(FileNotFoundException e) {
			System.out.println(e);
			e.printStackTrace();
		} catch(IOException e) {
			System.out.println(e);
			e.printStackTrace();
		} catch(Exception e) {
			System.out.println(e);
			e.printStackTrace();
		} finally {
			try {
				w.close();
				r.close();
			} catch(Exception ee) {
			}
		}
	}

	public static void main(String[] args) {
		new PersonalForm();
	}

}
