package com.controller;

import java.util.*;
import javax.servlet.http.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.po.*;
import com.service.*;

@Controller
@RequestMapping("/books")
public class BookController {
	@Autowired
	private BookService bookService;

	//获取图书列表
	@RequestMapping(value="/listBooks")
	private String listBooks(Model model){
		List<Book> list = bookService.getAllBooks();
		model.addAttribute("booksList", list);
		return "booksList";
	}
	
	//查询图书详细信息
	@RequestMapping(value="bookDetails")
	private ModelAndView bookDetails(ModelAndView modelAndView, long bookId){
		Book book = bookService.getBookById(bookId);
		modelAndView.addObject("book",book);
		modelAndView.setViewName("bookDetails");
		return modelAndView;
	}
	
	//根据name查询图书
	@RequestMapping(value="searchBooks")
	private ModelAndView searchBooks(HttpServletRequest request, ModelAndView modelAndView){
		String bookName = request.getParameter("bookName").trim();
		if(bookName.equals("请输入关键字")){
			bookName="";
		}
		List<Book> list = bookService.getBooksByName("%"+bookName+"%");
		modelAndView.addObject("booksList",list);
		modelAndView.setViewName("booksList");
		return modelAndView;
	}	
}
