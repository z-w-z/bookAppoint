package com.po;

import java.util.Date;

public class Appointment extends AppointmentKey {
    private Date appointTime;

    private Integer appointNum;

    public Date getAppointTime() {
        return appointTime;
    }

    public void setAppointTime(Date appointTime) {
        this.appointTime = appointTime;
    }

    public Integer getAppointNum() {
        return appointNum;
    }

    public void setAppointNum(Integer appointNum) {
        this.appointNum = appointNum;
    }
}