package cosmos;

public class Mercury implements SolarSystem {
	 long distance;
     long area;
     boolean waterContent;
     int daysPerYear;
  	
	@Override
	public String getname() {
		return "Mercury";
	}
	
	public long distance() {
		// TODO Auto-generated method stub
		this.distance = 69800000L;
		return this.distance;
	}
	
    
	@Override
	public long area() {
		// TODO Auto-generated method stub
		this.area = 5595080000L;
		return this.area;
	}
	
 
	@Override
	public boolean waterContent() {
		// TODO Auto-generated method stub
		this.waterContent = false;
		return this.waterContent;
	}
	
     
	@Override
	public int daysPerYear() {
		// TODO Auto-generated method stub
		
		return this.daysPerYear;
	}

}
