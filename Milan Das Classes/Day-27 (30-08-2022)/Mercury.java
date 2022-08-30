package cosmos;

public class Mercury implements SolarSystem {
	public long distance;
	public long area;
	public boolean waterContent;
	public int daysPerYear;
	
	@Override
	public String getName() {
		return "Mercury";
	}
	
	@Override
	public long getDistance() {
		this.distance = 69800000L;
		return this.distance;
	}

	@Override
	public long getArea() {
		this.area = 5595080000L;
		return this.area;
	}

	@Override
	public boolean getWaterContent() {
		this.waterContent = false;
		return this.waterContent;
	}

	@Override
	public int getDaysPerYear() {
		this.daysPerYear = 88;
		return this.daysPerYear;
	}
}
