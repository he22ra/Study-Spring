package kr.co.error;

import java.text.DateFormat;

import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * Handles requests for the application home page.
 */

@ResponseStatus(HttpStatus.BAD_REQUEST)			// error 400
class MyException extends RuntimeException{
	public MyException (String msg) {
		super(msg);
	}
	public MyException() {
		this("");
	}
}
@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)			// error 500
class MyException2 extends RuntimeException{
	public MyException2 (String msg) {
		super(msg);
	}
	public MyException2() {
		this("");
	}
}

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
//	error 400
	@RequestMapping("/test")
	public String ezen(Model m) {
		throw new MyException("사용자 정의 예외가 발생했습니다.");
	}
	
//	error 500	
	@RequestMapping("/test2")
	public String ezen2(Model m) {
		throw new MyException2("사용자 정의 예외가 발생했습니다.");
	}
}
