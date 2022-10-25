package kr.co.ezensignup;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RegisterController2 {
	
	//@RequestMapping(value = "/register/add2")	//신규회원 가입 화면
//	@GetMapping("/register/add2")
//	public String register() {
//		return "registerForm";					// /WEB-INT/views/registerForm.jsp
//	}
	//@RequestMapping(value ="/register/save2")
	@PostMapping("/register/save2")
	public String save(User user) throws UnsupportedEncodingException {
		
		//1. 유효성 검사
		if(!isValid(user)) {
			String msg = URLEncoder.encode("id를 잘못입력했습니다.", "utf-8");
			return "redirect:/register/add2?msg="+msg;
		}
		
		return "registerInfo";					// /WEB-INT/views/registerInfo.jsp
		
	}
	
	private boolean isValid(User user) {
		// 현재 유효하지 못하게 false로 설정함
		return false;
	}
}
