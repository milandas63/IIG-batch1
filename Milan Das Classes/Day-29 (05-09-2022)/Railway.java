package excep;

public class Railway {
	Object loco[][] = { {90, false, false, false},
						{55, false, true,  false},
						{65, true,  false, false},
						{70, false, false, true},
						{25, false, false, false}
			    	  };
	
	public static void main(String[] args) {
		new Railway();
	}

	public Railway() {
		for(Object[] obj : loco) {
			try {
				this.checkForGoodTrack(obj[0], obj[1], obj[2], obj[3]);
				System.out.println("The Track is good!");
			} catch(SpeedAboveMaxLimitException e) {
			} catch(SpeedBelowMinLimitException e) {
			} catch(BrokenTrackException e) {
			} catch(TrackDerailException e) {
			} catch(TrackTamperingException e) {
			}
		}
	}

	public void checkForGoodTrack(int speed, boolean broken, boolean derail, boolean tamper) 
			throws SpeedAboveMaxLimitException,SpeedBelowMinLimitException,BrokenTrackException,TrackDerailException,TrackTamperingException {
		if(broken) throw new BrokenTrackException();
		else if(derail) throw new TrackDerailException();
		else if(tamper) throw new TrackTamperingException();
		else if(speed>100) throw new SpeedAboveMaxLimitException();
		else if(speed<30) throw new SpeedBelowMinLimitException();
	}
	
}
