package ashu2;

public class railway {

	Object loco[][] = { 
			{90, false, false, false},
			{55, false, true,  false},
			{65, true,  false, false},
			{70, false, false, true},
			{25, false, false, false}
						    	    };
   public railway(){
	for(int i=0; i<loco.length; i++) {
		try {
			checkForValidSpeed1(loco[i]);
			System.out.println(loco[i]+" is a valid speed");		
		} catch(SpeedAboveMaxLimitException e) {
			System.out.println(loco[i] + " " + e.getMessage());
		} catch(SpeedBelowMinLimitException e) {
			System.out.println(loco[i] + " " + e.getMessage());
		}
   }
   
}
private void checkForValidSpeed1(Object[] objects) throws 
                                                         SpeedAboveMaxLimitException,
                                                         SpeedBelowMinLimitException
                                                         
                                                          {
   int Speed = 0;
if(Speed>80) {
		throw new SpeedAboveMaxLimitException("Speed is Max");
	} else if(Speed<30) {
		throw new SpeedBelowMinLimitException("Speed is Min");
	
	}
  }
public static void main(String[] args) {
	new railway();
}
			
			
		}


