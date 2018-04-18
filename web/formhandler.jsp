<%--
  Created by IntelliJ IDEA.
  User: Tawana
  Date: 4/13/2018
  Time: 3:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import= "man.manager" %>
<%@ page import ="com.util.*" %>
<%@ page import ="java.util.*"%>
<%@ page import ="java.sql.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
<%! ArrayList<schedule> list = new ArrayList();%>
<html>
<head>
    <title>Schedule</title>
</head>
<body>

    <br><b>Current Schedule</b>
    <br>
    <table border = "1" cellpadding = "5" cellspacing = "5">
        <tr>
            <th>Employee Name</th>
            <th> Day Scheduled </th>
            <th>Time In</th>
            <th>Time out</th>
        </tr>

<%
    try {
        Connection conn = dbconnection.getMySQLConnection();
        PreparedStatement stmt = null;
        ResultSet rs;
        String sql, temp;
        manager m1 = new manager();
        Date date;
        Time time;
        String stime;

        if(conn != null)
        {
            sql = "select e.ssn from employees as e where e.firstname=? and e.lastname=?";
            stmt = conn.prepareStatement(sql);
            temp =  request.getParameter("firstname");

            stmt.setString(1, temp);     //GETS first name of the employese and queris the database
            temp = request.getParameter("lastname");
            stmt.setString(2, temp);     // to get the empoyees EID
            rs = stmt.executeQuery();

            schedule s = new schedule();
          if(rs.next())
                 s.setEid(rs.getInt(1));                  //once the eid is found, a schuedule object is created to pass to the
                                                 // update schedule function in the manager class
            stime = request.getParameter("stime");

       try {
            date = new SimpleDateFormat("hh:mm").parse(stime);      /// the request object returns strings --> must convert to
            time = new Time(date.getTime());                        /// time since stime is of type time

            s.setStime(time);
            stime = request.getParameter("etime");

            date = new SimpleDateFormat("hh:mm").parse(stime);
            time = new Time(date.getTime());

            s.setDay(request.getParameter("day"));
            s.setEtime(time);
        }
        catch(ParseException e){                      // throws an exception for the time conversion
            e.printStackTrace();
        }
        list = m1.UpdateSchedule(s);      //CALLS the updateschedule function to add the employee to the current schedule

        String x;
        sql = "select e.firstname, e.lastname, s.stime, s.etime, s.day from schedule as s, employees as e where e.SSN = s.eid";

        rs = stmt.executeQuery(sql);
        while(rs.next())
        {
            out.println("<tr><td>" + rs.getString(1) + " " + rs.getString(2) + "</td><td>"+ rs.getString(5) + "</td><td>"+
                    rs.getTime(3) +"</td><td>" + rs.getTime(4)+"</td></tr>");
        }
        stmt.close();
    }}
    catch(SQLException s)
    {s.printStackTrace();}

%>
</table>
    <br><br><button onclick = "location.href= 'index.jsp';" > Home </button>
</body>
</html>