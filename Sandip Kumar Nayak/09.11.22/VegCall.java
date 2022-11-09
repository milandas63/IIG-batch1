package Veg;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class VegCall {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("bean.xml");
		//Market market = (Market) context.getBean("market");
		Market market = context.getBean("market",Market.class);
		market.printPriceData();
	}

}
