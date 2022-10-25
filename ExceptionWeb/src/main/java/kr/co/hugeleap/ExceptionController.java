package kr.co.hugeleap;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

public class ExceptionController {
	

	@RequestMapping("/ex")
	public void ezen(Model m) throws Exception {
		try {
			throw new Exception("예외가 발생했습니다.");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}	
	}
	
	@RequestMapping("/ex2")
	public String ezen2(Model m) throws Exception {
		try {
			throw new Exception("예외가 발생했습니다.");
		} catch (Exception e) {
			// TODO: handle exception
			return "error";
		}
	}
		
	@RequestMapping("/ex3")
	public String ezen3(Model m) throws Exception {
		try {
			throw new Exception("예외가 발생했습니다.");
		} catch (Exception e) {
			// TODO: handle exception
			return "error";
		}	
	}
}
