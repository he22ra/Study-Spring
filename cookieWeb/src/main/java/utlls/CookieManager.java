package utlls;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieManager {
	
	public static void makeCookie (HttpServletResponse response, String cName, String cValue, int cTime) {
		Cookie cookie = new Cookie(cName, cValue);
		cookie.setPath("/");
		cookie.setMaxAge(cTime);
		response.addCookie(cookie);
	}
	
	// 쿠키 이름 삭제
	public static void deleteCookie(HttpServletResponse response, String cName) {
		makeCookie(response, cName, "", 0);
	}
	
	// 특정 이름의 쿠키를 찾아 그 값을 반영
	public static String readCookie(HttpServletRequest request, String cName) {
		String cookieValue = "";
		
    	Cookie[] cookies = request.getCookies();	// 요청 헤더의 모든 쿠키 읽기
    	if(cookies != null) {
        	for (Cookie c : cookies) {
        		String cookieName = c.getName();
        		if(cookieName.equals(cName)) {
        			cookieValue = c.getValue();
        		}
        	}
    	}

		
		return cookieValue;
	}
}
