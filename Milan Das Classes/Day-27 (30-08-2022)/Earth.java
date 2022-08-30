package cosmos;

public class Earth implements SolarSystem {
	public long distance;
	public long area;
	public boolean waterContent;
	public int daysPerYear;

	@Override
	public String getName() {
		return "Earth";
	}
	
	@Override
	public long getDistance() {
		this.distance = 151050000L;
		return this.distance;
	}

	@Override
	public long getArea() {
		this.area = 2602020115L;
		return this.area;
	}

	@Override
	public boolean getWaterContent() {
		this.waterContent = true;
		return this.waterContent;
	}

	@Override
	public int getDaysPerYear() {
		this.daysPerYear = 365;
		return this.daysPerYear;
	}

}
