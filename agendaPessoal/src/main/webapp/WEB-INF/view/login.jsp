<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<style>
* {
	font-family: Arial, Helvetica, sans-serif;
}

main {
    background-color: #DCDCDC;
    padding: 20px;
    margin: 20px 0;
    border-radius: 5px;
}

section {
    color: black;
    background-color: #D3D3D3;
    padding: 4%;
    margin: 20px 0;
    border-radius: 5px;
    position: relative;
}

h1 {
	color: #DC143C;
	text-align: center;
	margin-top: 10;
	margin-left: 5%;
	font-size: 40px;
}

table {
	width: 80%;
}

td {
	height: 40px; 
	font-size : 20px;
	color: white;
}

input[type="text"], input[type="password"] {
	width: 100%;
	padding: 1px;
	height: 30px; 
	border: 1px solid #ccc;
	border-radius: 3px;
	color: white;
}

input[type="submit"] {
	width: 20%;
	padding: 2px;
	height: 30px; 
	margin-left: 45%;
	background-color: #DC143C;
	color: white;
	border: none;
	border-radius: 3px;
	cursor: pointer;
	border-radius: 3px;
}

form {
	width: 50%;
	margin-left: 25%;
	margin-right: 25%;
	margin-top: 10%;
}

</style>
</head>
<body>

<form action="<%= request.getContextPath() %>/login" method="post">
<main>
<h1>Login</h1>
	<section>
   <table style="with: 80%">
    <tr>
     <td>Login: </td>
     <td><input type="text" name="login" /></td>
    </tr>
    <tr>
     <td>Password: </td>
     <td><input type="password" name="senha" /></td>
    </tr>
   </table>
   <br>
   <input type="submit" value="Submit" />
  </section>
</main>
</form>
</body>
</html>