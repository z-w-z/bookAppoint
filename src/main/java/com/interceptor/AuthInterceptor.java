package com.interceptor;

import javax.servlet.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * Description: 登录验证
 * @author Administrator
 */
@Controller
public class AuthInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		String url = request.getRequestURI();
		System.out.println(url);
		if(url.split("/appoint/").length == 1){
			return true;  //true表示放行
		}
		Long stuId = (Long)request.getSession().getAttribute("stuId");
		if(stuId!=null){
			return true;
		}
		request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
		return false;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,Object handler, ModelAndView modelAndView){
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response,Object handler, Exception exception){
	}	
}
