package Veg;

import Veg.Potato;

public class Market {
	public Potato price;

	public void setPrice(Potato price) {
		this.price = price;
		System.out.println("Vegetable Called...");
	}

	public void printPriceData() {
		System.out.println("VEGETABLE NAME IS " + price.getVegetableName());
		System.out.println("AVAILABLE STATUS IS " + (price.getAvailableStatus()?"Yes":"No"));
		System.out.println("PRICE IN K.G. is " + price.getPrice());
	}
}
