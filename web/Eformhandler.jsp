<%@ page import="com.util.employee" %>
<%@ page import="man.manager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.util.dbconnection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: Tawana
  Date: 4/17/2018
  Time: 10:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee Display</title>
</head>
<body>
<%
    employee newemp = new employee();
    manager man = new manager();
    try
    {
        newemp.setSSN(Integer.parseInt(request.getParameter("SSN")));
        newemp.setFirstname(request.getParameter("firstname"));
        newemp.setLastname(request.getParameter("lastname"));
        newemp.setEmail(request.getParameter("email"));
        newemp.setJid(Integer.parseInt(request.getParameter("jid")));
        newemp.setLid(Integer.parseInt(request.getParameter("lid")));
        newemp.setPhone(request.getParameter("phone"));
        newemp.setWage(Integer.parseInt(request.getParameter("wage")));

        man.addEmployee(newemp);

    }

    catch(NumberFormatException e)
    {e.getStackTrace();}


%>
<b> Current Employees</b> <br>
<table border = "1" cellpadding = "5" cellspacing = "5">
    <tr>
        <th> Name</th>
        <th> SSN </th>
        <th> Wage</th>
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
         sql = "Select e.firstname,e.lastname,e.SSN,e.wage from employees as e";
         rs = stmt.executeQuery(sql);
         while(rs.next())
         { out.println("<tr><td>" + rs.getString(1) + " " + rs.getString(2) + "</td><td>"+ rs.getInt(3) + "</td><td>"
                + rs.getInt(4) +"</td></tr>");
         }
         stmt.close(); }

     }
     catch (SQLException e) {
         e.printStackTrace();}
 %>
</table>  <br><br><button onclick = "location.href= 'index.jsp';" > Home </button>

</body>
</html>
