package com.controller;

import javax.servlet.http.*;

import com.po.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.exception.CustomException;
import com.service.StudentService;
import sun.plugin2.message.Message;

@Controller
@RequestMapping("/stu")
public class StudentController {
	@Autowired
	private StudentService stuService;
	
	//请求登录页面
	@RequestMapping(value="/login")
	private String login(){
		return "login";
	}	
	
	//验证信息
	@RequestMapping(value="/validate")
	private String validateStu(HttpServletRequest request, HttpServletResponse response) throws Exception{ 
		long stuId;
		long password;
		try{
			stuId = Long.parseLong(request.getParameter("stuId"));
			password = Long.parseLong(request.getParameter("password"));
		}catch(Exception e)
		{
			//捕获类型转换失败等异常,会跳转至login页面
			throw new CustomException("用户名或密码错误");
		}		
		Boolean boo = stuService.validateStu(stuId, password);
		if(boo){
			request.getSession().setAttribute("stuId", stuId);
			return "redirect:/books/listBooks.action"; 
		}
		throw new CustomException("用户名或密码错误");
	}
	@RequestMapping("/register")
	public String register(){
		return "register";
	}

	//注册请求
    @RequestMapping(value = "/regist")
	public String insertstudent(long stuId, long password ,Model model){
		Boolean boo = stuService.isUserExist(stuId);
		if(boo=false){
			System.out.println("账号已存在");

		}else{
			stuService.insertstudent(stuId,password);
	}
	System.out.println("账号："+stuId+"密码："+password);
	return "redirect:/stu/login.action";
	}
	//退出登陆
	@RequestMapping(value="/logout")
	private String logout(HttpSession session){
		session.invalidate();
		return "redirect:/books/listBooks.action";
	}

}
