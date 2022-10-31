package kr.co.work;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class UserValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		// validator가 동작할 조건을 정의, 주로 class의 타입을 비교
		// 이 검증기로 검증가능한 객체인지 알려주는 메서드
//		return User.class.equals(clazz);	// 검증하려는 객체가 User 타입인지 확인
		return User.class.isAssignableFrom(clazz);	// clazz가 User 타입 또는 그 자손인지 확인(상속관계)
	}

	@Override
	public void validate(Object target, Errors errors) {
		// 원하는 검증을 진행함. 객체(Object target)를 검증하는 메서드
		System.out.println("UserValidator.validate() is called");
		
		User user = (User)target ;
		String id = user.getId();
//		if (id == null || "".equals(id.trim())) {
//			errors.rejectValue("id", "required");
//		}
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pwd", "required");
		
		if(id == null || id.length() < 5 || id.length() > 12) {
			errors.rejectValue("id", "invalidLength", new String[] {"5","12"}, null);
		}
	}

}
