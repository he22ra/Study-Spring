package kr.co.work.aop;

import java.lang.reflect.Method;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.transaction.annotation.Transactional;



public class AopMain {

	public static void main(String[] args) throws Exception {
		MyAdvice myAdvice = new MyAdvice();
		
		Class myClass = Class.forName("kr.co.work.aop.MyClass");
		Object obj = myClass.newInstance();
		
		for(Method m : myClass.getDeclaredMethods()) {
			myAdvice.invoke(m, obj, null);
		}

	}

}

//핵심 기능(메서드)에 공통 코드를 추가해야함
class MyClass{
	
	@Transactional
	void ezen1() {
		System.out.println("ezen1() is called");
	}
	void ezen2() {
		System.out.println("ezen2() is called");
	}
	void itezen1() {
		System.out.println("itezen1() is called");
	}
	
}

//보조기능
class MyAdvice{
	
	//e로 시작하는 단어 호출하는 패턴 p 생성
	Pattern p = Pattern.compile("e.*");
	boolean matches(Method m) {
		Matcher matcher = p.matcher(m.getName());
		return matcher.matches();
	}
	
	
	void invoke(Method m, Object obj, Object... args) throws Exception {
		
		// matches 메소드m에 충족되는 것만 출력
//		if(matches(m))
		if(m.getAnnotation(Transactional.class) != null)	// Transactional 어노테이션 있는 메소드에만 적용
			System.out.println("[이전 before] {");
		m.invoke(obj, args);
//		if(matches(m))
		if(m.getAnnotation(Transactional.class) != null)
			System.out.println("}  [이후 after] ");
		
		}
	
}