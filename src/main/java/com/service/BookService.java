package com.service;

import java.util.List;

import com.po.Book;

public interface BookService {
	//根据id查询book
	Book getBookById(long bookId);
	
	//查询所有图书
	List<Book> getAllBooks();	
	
	//按name搜索图书
	List<Book> getBooksByName(String name);
	
	//预约或取消预约,图书数量对应减少或增加. 1表示预约,0表示取消预约
	int updateBookForAppoint(long bookId, int appoint);
	
}
