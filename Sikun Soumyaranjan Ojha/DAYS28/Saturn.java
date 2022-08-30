package cosmos;

public class Saturn implements SolarSystem {
	 long distance;
     long area;
     boolean waterContent;
     int daysPerYear;
     
	@Override
	public long distance() {
		// TODO Auto-generated method stub
		this.distance = 132820000L;
		return this.distance;
	}

	@Override
	public long area() {
		// TODO Auto-generated method stub
		this.area = 42700000L;
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
		this.daysPerYear = 10759;
		return this.daysPerYear;
	}

	@Override
	public String getname() {
		// TODO Auto-generated method stub
		return "Saturn";
	}

}
