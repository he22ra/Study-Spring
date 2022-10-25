package kr.co.ezenweb;

import java.io.InputStream;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RequestMessage {
	
	@RequestMapping("/requestmessage")
	public void ezen(HttpServletRequest request) {
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
			byte[] content = new byte[CONTENT_LENGTH];
			InputStream in;
			try {
				in = request.getInputStream();
				in.read(content, 0, CONTENT_LENGTH);
				
				System.out.println();
				System.out.println(new String(content, "utf-8"));
				
				
			} catch (Exception e2) {e2.printStackTrace();}
		}
	}

}
