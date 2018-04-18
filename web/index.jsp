<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.util.dbconnection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: Tawana
  Date: 4/11/2018
  Time: 11:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <title>Welcome</title>
</head>
<body><br><br>
<b> Current Employees</b> <br>
<table border = "1" cellpadding = "5" cellspacing = "5">
  <tr>
    <th> Name</th>
    <th> Wage </th>
  </tr>
    <%
     ///////////OUTPUTS a table of all the employees and their wages
     try
     {
         Connection conn = dbconnection.getMySQLConnection();
         Statement stmt;
         if (conn != null)
           {  stmt = conn.createStatement();
         ResultSet rs;
         String sql;
         sql = "Select e.firstname,e.lastname,e.wage from employees as e";
         rs = stmt.executeQuery(sql);
         while(rs.next())
         { out.println("<tr><td>" + rs.getString(1) + " " + rs.getString(2) + "</td><td>"+ rs.getInt(3) + "</td></tr>");
         }
         stmt.close(); }

     }
     catch (SQLException e) {
         e.printStackTrace();}
 %>
</table>
<br><br> <button onclick = "location.href= 'employee-form.jsp';" > add new employee </button>

    <% //OUTPUT THE SCHEDULE AND HAVE IT SO THAT THE MANAGER CAN ADD AN EMPLOYEE %>
   <br><br>
  <br><b>Current Schedule</b><br>
  <table border = "1" cellpadding = "5" cellspacing = "5">
    <tr>
      <th>Employee Name</th>
      <th> Day Scheduled </th>
      <th>Time In</th>
      <th>Time out</th>
    </tr>

    <%
      try{
        Connection conn = dbconnection.getMySQLConnection();
        if(conn != null)
        { Statement stmt = conn.createStatement();
        ResultSet rs;
        String sql;
        sql = "select e.firstname, e.lastname, s.stime, s.etime, s.day from schedule as s, employees as e where e.SSN = s.eid";
        rs = stmt.executeQuery(sql);
        while(rs.next())
        {
          out.println("<tr><td>" + rs.getString(1) + " " + rs.getString(2) + "</td><td>"+ rs.getString(5) + "</td><td>"+
                  rs.getTime(3) +"</td><td>" + rs.getTime(4)+"</td></tr>");

        }
        stmt.close();
      }}
      catch(SQLException s){
        s.printStackTrace();
      }
    %>
  </table>
    <br><br> <button onclick = "location.href= 'schedule-form.jsp';" > Update Schedule </button>

</body>
</html>
