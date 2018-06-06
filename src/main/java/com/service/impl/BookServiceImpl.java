package com.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.*;
import com.po.*;
import com.po.BookExample.Criteria;
import com.service.BookService;

@Service
public class BookServiceImpl implements BookService{
	@Autowired
	private BookMapper bookMapper;
	
	@Override
	public Book getBookById(long bookId) {
		return bookMapper.selectByPrimaryKey(bookId);
	}

	@Override
	public List<Book> getAllBooks() {
		return bookMapper.selectByExample(null);
	}	

	@Override
	public List<Book> getBooksByName(String name) {
		BookExample example = new BookExample();
		Criteria criteria = example.createCriteria();
		criteria.andBookNameLike(name);
		return bookMapper.selectByExample(example);
	}

	@Override
	public int updateBookForAppoint(long bookId, int appoint) {
		Book record = bookMapper.selectByPrimaryKey(bookId);
		if(appoint == 1){
			record.setNumber(record.getNumber() - 1);
		}else{
			record.setNumber(record.getNumber() + 1);
		}		
		return bookMapper.updateByPrimaryKeySelective(record);
	}
}
