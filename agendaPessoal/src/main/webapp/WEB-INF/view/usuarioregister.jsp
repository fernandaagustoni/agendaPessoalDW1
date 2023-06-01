<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New User</title>
</head>
<body>
<div align="center">
<h1>Register New User</h1>
  <form action="<%= request.getContextPath() %>/registerUsuario" method="post">
   <table style="with: 80%">
    <tr>
     <td>Login</td>
     <td><input type="text" name="login" /></td>
    </tr>
    <tr>
     <td>Password</td>
     <td><input type="password" name="password" /></td>
    </tr>
    <tr>
     <td>Name</td>
     <td><input type="text" name="nome" /></td>
    </tr>
    <tr>
     <td>Email</td>
     <td><input type="text" name="email" /></td>
    </tr>
   </table>
   <br>
   <input type="submit" value="Submit" />
  </form>
 </div>
</body>
</html>