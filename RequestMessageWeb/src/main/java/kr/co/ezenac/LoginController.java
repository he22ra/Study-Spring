package kr.co.ezenac;

import java.io.InputStream;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("loginController")
public class LoginController {
	
	@RequestMapping(value = {"/req/loginForm.do", "/req/loginForm2.do"}, method = {RequestMethod.GET})
	public ModelAndView loginForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("requestMessage/loginForm");
		return mav;
	}
	@RequestMapping(value = "/req/login.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		

		String requestLine = request.getMethod();	  // GET 또는 POST
		requestLine += " " + request.getRequestURI();
		
		String queryString = request.getQueryString();
		requestLine += queryString == null ? "" : "?" + queryString;
		requestLine += " " + request.getProtocol();
		System.out.println(requestLine);
		
		//requestHeader
		Enumeration<String> e = request.getHeaderNames();
		
		while(e.hasMoreElements()){
			String name = e.nextElement();
			System.out.println(name +" : "+ request.getHeader(name));
		}
		
		// request body -- POST일 때만 해당, GET은 body가 없음
		final int CONTENT_LENGTH = request.getContentLength();
		System.out.println("content length" + CONTENT_LENGTH);
		
		if (CONTENT_LENGTH > 0) {
			try {
				request.setCharacterEncoding("utf-8");
				mav.setViewName("/requestMessage/result");
				
				String userId = request.getParameter("userID");
				String userName = request.getParameter("userName");
				
				mav.addObject("userId", userId);
				mav.addObject("userName", userName);
				System.out.println();
				System.out.println("userId = "+userId+ ", userName = "+userName);
				
			} catch (Exception e2) {e2.printStackTrace();}
		}
				
	    return mav;
	}
	
}
