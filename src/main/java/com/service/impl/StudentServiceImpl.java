package com.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.StudentMapper;
import com.po.*;
import com.service.StudentService;

@Service
public class StudentServiceImpl implements StudentService{
	@Autowired
	private StudentMapper stuMapper;
	
	@Override
	public Student getStuById(long stuId) {
		return stuMapper.selectByPrimaryKey(stuId);
	}
	//注册
	@Override
	public int insertstudent(long stuId,long password) {
		Student student = new Student();
		student.setStudentId(stuId);
		student.setPassword(password);
		return stuMapper.insert(student);
	}
	//登录验证
	@Override
	public Boolean validateStu(long studentId, long password) {
		Student	stu = stuMapper.selectByPrimaryKey(studentId);
		if(stu!=null && stu.getPassword().equals(password)){
			return true;
		}
		return false;
	}
	//验证用户是否存在
	@Override
	public Boolean isUserExist(long stedentId) {
		if(stuMapper.selectByPrimaryKey(stedentId) == null){
			return false;
		}
		return  true;
	}
}
