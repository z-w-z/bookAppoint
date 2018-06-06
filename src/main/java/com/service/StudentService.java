package com.service;

import com.po.Student;

public interface StudentService {	
	//查看个人信息
	Student getStuById(long stuId);
	//注册账号
	int insertstudent(long stuId,long password);
	//学生登陆图书系统
	Boolean validateStu(long studentId, long password);
    //判断用户是否存在
    Boolean isUserExist(long stedentId);
}
