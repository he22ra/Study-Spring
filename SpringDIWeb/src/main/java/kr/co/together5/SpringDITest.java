package kr.co.together5;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Component;



@Component class Engine{}
@Component class Door{}

@Component
class Car{
	@Value("blue") String color;
	@Value("300") int oil;
	@Autowired Engine engine;
	@Autowired Door[] doors;
	
	public Car() {}			// 기본 생성자

	public Car(String color, int oil, Engine engine, Door[] doors) {
		super();
		this.color = color;
		this.oil = oil;
		this.engine = engine;
		this.doors = doors;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public void setOil(int oil) {
		this.oil = oil;
	}

	public void setEngine(Engine engine) {
		this.engine = engine;
	}

	public void setDoors(Door[] doors) {
		this.doors = doors;
	}

	@Override
	public String toString() {
		return "Car [color=" + color + ", oil=" + oil + ", engine=" + engine + ", doors=" + Arrays.toString(doors)
				+ "]";
	}
	
	
	
}

public class SpringDITest {
	
	public static void main(String[] args) {
		ApplicationContext ac = new GenericXmlApplicationContext("config5.xml");
		Car car = (Car) ac.getBean("car");					// by name
//		Engine engine = (Engine) ac.getBean("engine");		// by name
		Engine engine = ac.getBean(Engine.class);			// by type
		Door door = (Door) ac.getBean("door");				// by name
		
		
		
		System.out.println("car = " + car);
		
	}

}
