<%@ page import="com.util.employee" %>
<%@ page import="man.manager" %><%--
  Created by IntelliJ IDEA.
  User: Tawana
  Date: 4/17/2018
  Time: 1:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>New Employee</title>
</head>
<body>
<form action = "Eformhandler.jsp" method = "GET">
    First name:  <input type="text" name ="firstname">
    <br>  <br>
    Last name:  <input type="text" name = "lastname">
    <br> <br>
    JobID:  <input type = "number" name = "jid">
    <br> <br>
    wage:  <input type = "number" name = "wage">
    <br> <br>
    SSN:  <input type = "number"  name = "SSN">
    <br> <br>
    E-mail: <input type = "email"  name = "email">
    <br> <br>
    Phone:  <input type = "text"  name = "phone">
    <br><br>
    Location ID:  <input type = "number"  name = "lid">
    <br> <br> <input type = "submit" value = "Update">
</form>
<button type="button" name="back" onclick="history.back()">back</button>

</body>
</html>
