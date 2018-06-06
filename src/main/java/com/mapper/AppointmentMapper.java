package com.mapper;

import com.po.Appointment;
import com.po.AppointmentCustom;
import com.po.AppointmentExample;
import com.po.AppointmentKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AppointmentMapper {
    int countByExample(AppointmentExample example);

    int deleteByExample(AppointmentExample example);

    int deleteByPrimaryKey(AppointmentKey key);

    int insert(Appointment record);

    int insertSelective(Appointment record);

    List<Appointment> selectByExample(AppointmentExample example);

    Appointment selectByPrimaryKey(AppointmentKey key);

    int updateByExampleSelective(@Param("record") Appointment record, @Param("example") AppointmentExample example);

    int updateByExample(@Param("record") Appointment record, @Param("example") AppointmentExample example);

    int updateByPrimaryKeySelective(Appointment record);

    int updateByPrimaryKey(Appointment record);

   //自定义的查询某个学生的预约(包含book)的信息
   List<AppointmentCustom> selectAppointsOfStu(long stuId);
}