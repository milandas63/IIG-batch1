package Veg;
import Veg.Price;

public class Potato implements Price {

	@Override
	public String getVegetableName() {
		return "POTATO";
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
