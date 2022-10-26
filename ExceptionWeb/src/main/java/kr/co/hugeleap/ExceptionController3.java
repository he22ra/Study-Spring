package kr.co.hugeleap;

import java.io.FileNotFoundException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ExceptionController3 {
	

	@RequestMapping("/ex")
	public void ezen(Model m) throws Exception {
//		try {
//			throw new Exception("예외가 발생했습니다.");
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		}	
		m.addAttribute("msg", "message from ExceptionController2.ezen()");
		throw new Exception("예외가 발생했습니다.");
	}
	
	@RequestMapping("/ex2")
	public String ezen2(Model m) throws Exception {
		throw new Exception("예외가 발생했습니다.");
	}
		
	@RequestMapping("/ex3")
	public String ezen3(Model m) throws Exception {
		throw new NullPointerException("널포인터 예외가 발생했습니다.");
	}
	
	@RequestMapping("/ex4")
	public void ezen4(Model m) throws FileNotFoundException {
		throw new FileNotFoundException("파일이 존재하지 않는 예외가 발생했습니다.");
	}
	
	
}
