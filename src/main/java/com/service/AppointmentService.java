package com.service;

import java.util.List;
import com.po.AppointmentCustom;

public interface AppointmentService {
	//预约图书
	public String updateAppoint(long stuId, long bookId);
	
	//查看某个学生的预约
	public List<AppointmentCustom> getAppointsByStu(long stuId);
	
	//取消预约
	public int deleteAppoint(long stuId, long bookId);
}
