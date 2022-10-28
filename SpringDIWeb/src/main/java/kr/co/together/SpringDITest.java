package kr.co.together;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

class Car{}
class Engine{}
class Door{}

public class SpringDITest {
	
	public static void main(String[] args) {
		ApplicationContext ac = new GenericXmlApplicationContext("config.xml");
		Car car = (Car) ac.getBean("car");					// by name
		Car car2 = (Car) ac.getBean("car");					// by name
		Engine engine = (Engine) ac.getBean("engine");		// by name
		Door door = (Door) ac.getBean("door");				// by name
		
		System.out.println("car = " + car);
		System.out.println("car2 = " + car2);
		System.out.println("engine = " +engine);
		System.out.println("door = " +door);
	}

}
