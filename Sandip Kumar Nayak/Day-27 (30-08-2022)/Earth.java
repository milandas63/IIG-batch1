package Cosmos;

public class Earth implements SolarSystem {
	 long distance;
     long area;
     boolean waterContent;
     int daysPerYear;
     
	@Override
	public String getname() {
		return "Earth";
	}
	public long distance() {
		// TODO Auto-generated method stub
		this.distance = 151050000L;
		return this.distance;
	}

	@Override
	public long area() {
		// TODO Auto-generated method stub
		this.area = 510100000L;
		return this.area;
	}

	@Override
	public boolean waterContent() {
		// TODO Auto-generated method stub
		this.waterContent = true;
		return this.waterContent;
	}

	@Override
	public int daysPerYear() {
		// TODO Auto-generated method stub
		this.daysPerYear = 365;
		return this.daysPerYear;
	}
}