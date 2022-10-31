package kr.co.work;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class UserValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		// validator가 동작할 조건을 정의, 주로 class의 타입을 비교
		// 이 검증기로 검증가능한 객체인지 알려주는 메서드
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		// 원하는 검증을 진행함. 객체(Object target)를 검증하는 메서드
		
	}

}
