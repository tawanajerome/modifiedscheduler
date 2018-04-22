package com.util;
import java.sql.*;


public class schedule {
    int eid;
    String day;
    Time stime;
    Time etime;

    public void setday(String day) {
        this.day = day;
    }

    public void seteid(int eid) {
        this.eid = eid;
    }

    public void setstime(Time stime) {
        this.stime = stime;
    }

    public void setetime(Time etime) {
        this.etime = etime;
    }

    public String getday() {
        return day;
    }

    public int geteid() {
        return eid;
    }

    public Time getetime() {
        return etime;
    }

    public Time getstime() {
        return stime;
    }
}
