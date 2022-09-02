package exception;
import RailwayTrack.SpeedAboveMaxLimitException;
import RailwayTrack.SpeedBelowMaxLimitException;
public class RailwayEx {
	Object loco[][] = { 
			{90, false, false, false},
			{55, false, true,  false},
			{65, true,  false, false},
			{70, false, false, true},
			{25, false, false, false}
						    	    };
   public RailwayEx(){
	for(int i=0; i<loco.length; i++) {
		try {
			checkForValidSpeed(loco[i]);
			System.out.println(loco[i]+" is a valid speed");		
		} catch(SpeedAboveMaxLimitException e) {
			System.out.println(loco[i] + " " + e.getMessage());
		} catch(SpeedBelowMaxLimitException e) {
			System.out.println(loco[i] + " " + e.getMessage());
		}
   }
   
}
private void checkForValidSpeed(Object[] objects) throws 
                                                         SpeedAboveMaxLimitException,
                                                         SpeedBelowMaxLimitException
                                                         
                                                          {
   int loco = 0;
if(loco>80) {
		throw new SpeedAboveMaxLimitException("Speed is Max");
	} else if(loco<30) {
		throw new SpeedBelowMaxLimitException("Speed is Min");
	
	}
  }
public static void main(String[] args) {
	new RailwayEx();
}
}