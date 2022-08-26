package ExAm;



public class Row {
	public static void main(String[] args)
	    {
	  
			String[][] ch ={{"Mahatma","Gandhi","Father of the Nation","India","1869 AD"},{"Narendra","Modi","Prime Minister","India","1950 AD"},{"Nelson","Mandela","President","S. Africa","1918 AD"},{"Goutam","Buddha","Spiritual Teacher","India","624 BC"}};
	  
	        for (int i = 0; i < 4; i++) {
	            for (int j = 0; j < 5; j++) {
	                System.out.print(ch[i][j] + " ");
	            }
	  
	            System.out.println();
	        }
	    }
	}