package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.AppointmentMapper;
import com.po.*;
import com.service.AppointmentService;
import com.service.BookService;

@Service
public class AppointmentServiceImpl implements AppointmentService{
	@Autowired
	private BookService bookService;
	@Autowired
	private AppointmentMapper appointMapper;

	@Override
	public String updateAppoint(long stuId, long bookId) {
		Book book = bookService.getBookById(bookId);
		if(book==null || book.getNumber()==0){
			return "此书已无库存";
		}else{
			Appointment appoint = new Appointment();
			appoint.setBookId(bookId);
			appoint.setStudentId(stuId);
			Appointment appointDone = appointMapper.selectByPrimaryKey(appoint);
			if(appointDone!=null){
				return "请勿重复预约";
			}else{
				if(appointMapper.insert(appoint)>0 && bookService.updateBookForAppoint(bookId, 1)>0){					
					return "恭喜预约成功";
				}else{
					return "预约失败";
				}				
			}
		}		
	}

	@Override
	public List<AppointmentCustom> getAppointsByStu(long stuId) {
		return appointMapper.selectAppointsOfStu(stuId);
	}

	@Override
	public int deleteAppoint(long stuId, long bookId) {
		AppointmentKey key = new AppointmentKey();
		key.setBookId(bookId);
		key.setStudentId(stuId);
		int res = appointMapper.deleteByPrimaryKey(key);
		if(res > 0 && bookService.updateBookForAppoint(bookId, 0) > 0){
			return res;
		}
		return 0;		
	}	
}
