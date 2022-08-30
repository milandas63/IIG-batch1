package cosmos;

public class Pluto implements SolarSystem {
	 long distance;
     long area;
     boolean waterContent;
     int daysPerYear;
     
	@Override
	public long distance() {
		// TODO Auto-generated method stub
		this.distance = 505910000L;
		return this.distance;
	}

	@Override
	public long area() {
		// TODO Auto-generated method stub
		this.area = 167000000L;
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
		this.daysPerYear = 90560;
		return this.daysPerYear;
	}

	@Override
	public String getname() {
		// TODO Auto-generated method stub
		return "Pluto";
	}

}
