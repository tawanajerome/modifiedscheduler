<%--
  Created by IntelliJ IDEA.
  User: Tawana
  Date: 4/13/2018
  Time: 3:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <h4>Add Employee</h4>
</head>
<body>
<form action = "formhandler.jsp" method = "GET">
    First name:  <input type="text" name ="firstname">
    <br> <br> <br> <br>
    Last name:  <input type="text" name = "lastname">
    <br> <br> <br> <br>
    start time:  <input type = "time" name = "stime">
    <br> <br> <br> <br>
    end time:  <input type = "time" name = "etime">
    <br> <br> <br> <br>
    day:  <input type = "text"  name = "day">
    <br> <br> <input type = "submit" value = "Update">
</form>
</body>
</html>

