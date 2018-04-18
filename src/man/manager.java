package man;

import com.util.*;
//import javax.xml.transform.Result;
import java.sql.*;
import java.util.*;

public class manager{

    //// ADDS a new EMPLOYEE TO THE employee table
    public ArrayList<employee> addEmployee(employee e)
    {
        ArrayList<employee> list = new ArrayList<employee>();
        employee emp = new employee();
        try {
            Connection conn = dbconnection.getMySQLConnection();
          if(conn != null)
          { Statement stmt = conn.createStatement();

            String sql = "INSERT INTO employees VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pstm = conn.prepareStatement(sql);

            pstm.setInt(1, e.getSSN());
            pstm.setString(2, e.getFirstname());
            pstm.setString(3, e.getLastname());
            pstm.setInt(4, e.getJid());
            pstm.setInt(5, e.getWage());
            pstm.setString(6, e.getPhone());
            pstm.setString(7, e.getEmail());
            pstm.setInt(8, e.getLid());

            pstm.executeUpdate();

            sql = "Select SSN, firstname, lastname, jid, wage, phone, email, lid from employees";     //RETURNS FULL EMPLOYEE TABLE
            ResultSet rs = stmt.executeQuery(sql);      ///rs points to the result set and the loop parses through every row
            while(rs.next())
            {
                emp.setSSN(rs.getInt(1));
                emp.setFirstname(rs.getString(2));
                emp.setLastname(rs.getString(3));
                emp.setJid(rs.getInt(4));
                emp.setWage(rs.getInt(5));
                emp.setPhone(rs.getString(6));
                emp.setEmail(rs.getString(7));
                emp.setLid(rs.getInt(8));

                list.add(emp);
            }
            pstm.close();
            stmt.close();}
        }
        catch (SQLException x) {
            x.printStackTrace();}
        return list;
    }

    public ArrayList<schedule> UpdateSchedule(schedule s)    //updates the employee schedule
    {
        ArrayList<schedule> list = new ArrayList<schedule>();
        try {
            Connection conn = dbconnection.getMySQLConnection();
           if(conn != null)
           {Statement stmt = conn.createStatement();
            PreparedStatement pstm;
            String sql;
            ResultSet rs2;

            System.out.println(s.getStime() + " " + s.getEtime());
            sql = "SELECT * FROM availability as A where A.eid = ? and " +
                    "A.day = ? and A.stime <= ? and A.etime >= ?";                  ////check the availability of employee

            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, s.getEid());
            pstm.setString(2, s.getDay());
            pstm.setTime(3, s.getStime());
            pstm.setTime(4, s.getEtime());

            ResultSet rs = pstm.executeQuery();

            if(!rs.isBeforeFirst())      //if this employee is available, the query will return true otherwise they wont be added
                System.out.println("Employee is not available to work at this time");
            else
            {
                                                //checks if the employee is already on schedule for this day
                sql = "select s.eid from schedule as s where s.eid = ? and s.day=?";
                pstm = conn.prepareStatement(sql);
                pstm.setInt(1, s.getEid());
                pstm.setString(2, s.getDay());
                rs2 = pstm.executeQuery();

                if(rs2.wasNull())     //employee hasn't been scheduled for this particular day
                {
                    sql = "INSERT into schedule(eid,day,stime,etime) values(?,?,?,?)";
                    pstm = conn.prepareStatement(sql);
                    pstm.setInt(1, s.getEid());
                    pstm.setString(2, s.getDay());
                    pstm.setTime(3, s.getStime());
                    pstm.setTime(4, s.getEtime());
                    pstm.executeUpdate();
                }
                else                    //employee has already been scheduled for this day and instead we want to UPDATE
                {
                    sql = "UPDATE schedule SET day = ?, stime = ?, etime = ? WHERE eid = ?";
                    pstm = conn.prepareStatement(sql);
                    pstm.setString(1, s.getDay());
                    pstm.setTime(2, s.getStime());
                    pstm.setTime(3, s.getEtime());
                    pstm.setInt(4, s.getEid());
                    pstm.executeUpdate();
                }
            }

            list = displaySchedule();
            pstm.close();
            stmt.close();}
        }
        catch (SQLException e) {
            e.printStackTrace();}
        return list;
    }

    public ArrayList<schedule> displaySchedule()
    {  ArrayList<schedule> list = new ArrayList<schedule>();
        schedule newsh = new schedule();
        try
        {
            Connection conn = dbconnection.getMySQLConnection();
            if(conn != null)
            {Statement stmt = conn.createStatement();
            ResultSet rs;
            String sql;

            sql = "Select eid, day, stime, etime from schedule";
            rs = stmt.executeQuery(sql);
            while(rs.next())
            {
                newsh.setEid(rs.getInt(1));
                System.out.println(newsh.getEid());
                newsh.setDay(rs.getString(2));
                newsh.setEtime(rs.getTime(4));
                newsh.setStime(rs.getTime(3));
                list.add(newsh);
            }
            stmt.close();}

        }
        catch (SQLException e) {
            e.printStackTrace();}

        return list;
    }}


