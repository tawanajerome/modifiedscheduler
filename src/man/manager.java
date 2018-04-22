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

            pstm.setInt(1, e.getssn());
            pstm.setString(2, e.getfirstname());
            pstm.setString(3, e.getlastname());
            pstm.setInt(4, e.getjid());
            pstm.setInt(5, e.getwage());
            pstm.setString(6, e.getphone());
            pstm.setString(7, e.getemail());
            pstm.setInt(8, e.getlid());

            pstm.executeUpdate();

            sql = "Select SSN, firstname, lastname, jid, wage, phone, email, lid from employees";     //RETURNS FULL EMPLOYEE TABLE
            ResultSet rs = stmt.executeQuery(sql);      ///rs points to the result set and the loop parses through every row
            while(rs.next())
            {
                emp.setssn(rs.getInt(1));
                emp.setfirstname(rs.getString(2));
                emp.setlastname(rs.getString(3));
                emp.setjid(rs.getInt(4));
                emp.setwage(rs.getInt(5));
                emp.setphone(rs.getString(6));
                emp.setemail(rs.getString(7));
                emp.setlid(rs.getInt(8));

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

            System.out.println(s.getstime() + " " + s.getetime());
            sql = "SELECT * FROM availability as A where A.eid = ? and " +
                    "A.day = ? and A.stime <= ? and A.etime >= ?";                  ////check the availability of employee

            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, s.geteid());
            pstm.setString(2, s.getday());
            pstm.setTime(3, s.getstime());
            pstm.setTime(4, s.getetime());

            ResultSet rs = pstm.executeQuery();

            if(!rs.isBeforeFirst())      //if this employee is available, the query will return true otherwise they wont be added
                System.out.println("Employee is not available to work at this time");
            else
            {
                                                //checks if the employee is already on schedule for this day
                sql = "select s.eid from schedule as s where s.eid = ? and s.day=?";
                pstm = conn.prepareStatement(sql);
                pstm.setInt(1, s.geteid());
                pstm.setString(2, s.getday());
                rs2 = pstm.executeQuery();

                if(rs2.wasNull())     //employee hasn't been scheduled for this particular day
                {
                    sql = "INSERT into schedule(eid,day,stime,etime) values(?,?,?,?)";
                    pstm = conn.prepareStatement(sql);
                    pstm.setInt(1, s.geteid());
                    pstm.setString(2, s.getday());
                    pstm.setTime(3, s.getstime());
                    pstm.setTime(4, s.getetime());
                    pstm.executeUpdate();
                }
                else                    //employee has already been scheduled for this day and instead we want to UPDATE
                {
                    sql = "UPDATE schedule SET day = ?, stime = ?, etime = ? WHERE eid = ?";
                    pstm = conn.prepareStatement(sql);
                    pstm.setString(1, s.getday());
                    pstm.setTime(2, s.getstime());
                    pstm.setTime(3, s.getetime());
                    pstm.setInt(4, s.geteid());
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
                newsh.seteid(rs.getInt(1));
                System.out.println(newsh.geteid());
                newsh.setday(rs.getString(2));
                newsh.setetime(rs.getTime(4));
                newsh.setstime(rs.getTime(3));
                list.add(newsh);
            }
            stmt.close();}

        }
        catch (SQLException e) {
            e.printStackTrace();}

        return list;
    }}


