package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.po.AppointmentCustom;
import com.service.AppointmentService;

@Controller
@RequestMapping(value="/appoint")
public class AppointmentController {
	@Autowired
	private AppointmentService appointService;
	
	//预约请求
	@RequestMapping("bookAppoint")
	public void bookAppoint(HttpServletResponse response, long stuId, long bookId)throws Exception{ 
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String res = appointService.updateAppoint(stuId, bookId);
		out.println(res);
	}
	
	//查看某个学生的所有图书预约
	@RequestMapping("/stuAppoint")
	public ModelAndView stuAppoint(long stuId, ModelAndView modelAndView){
		List<AppointmentCustom> appointsList = appointService.getAppointsByStu(stuId);
		modelAndView.addObject("appointsList",appointsList);
		modelAndView.setViewName("stuAppoint");		
		return modelAndView;
	}
	
	//取消预约
	@RequestMapping("/cancelAppoint")
	public void cancelAppoint(HttpServletResponse response, long stuId, long bookId) throws IOException{
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		int num = appointService.deleteAppoint(stuId, bookId);
		if(num > 0){
			out.println("成功取消预约");
		}else{
			out.println("取消预约失败");
		}
	}
}
