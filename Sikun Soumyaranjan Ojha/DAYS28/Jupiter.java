package cosmos;

public class Jupiter implements SolarSystem {
	 long distance;
     long area;
     boolean waterContent;
     int daysPerYear;
     
	@Override
	public String getname() {
		return "Jupiter";
	}
	
	public long distance() {
		// TODO Auto-generated method stub
		this.distance = 606960000L;
		return this.distance;
	}

	@Override
	public long area() {
		// TODO Auto-generated method stub
		this.area = 6142000000L; 
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
		this.daysPerYear = 4272;
		return this.daysPerYear;
	}

}
