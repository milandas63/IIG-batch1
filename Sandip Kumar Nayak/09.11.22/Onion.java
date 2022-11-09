package Veg;
import Veg.Price;

public class Onion implements Price {

	@Override
	public String getVegetableName() {
		return "ONION";
	}

	@Override
	public boolean getAvailableStatus() {
		return true;
	}

	@Override
	public int getPrice() {
		return 50;
	}
}
