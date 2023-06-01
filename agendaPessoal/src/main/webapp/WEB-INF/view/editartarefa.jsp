<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="model.Task"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Task</title>
</head>
<body>
	<div align="center">
	<form method="post">
		<table>
		<tr>
			<td>Title</td>
			<td><input type="text" name="titulo" value=<%= request.getAttribute("titulo") %> /></td>
		</tr>
		<tr>
			<td>Description</td>
			<td><input type="text" name="descricao" value=<%= request.getAttribute("descricao") %> /></td>
		</tr>
		<tr>
			<td>Creation Date</td>
			<td><input type="date" name="data_criacao" value=<%= request.getAttribute("data_criacao") %> /></td>
		</tr>
		<tr>
			<td>Due Date</td>
			<td><input type="date" name="data_conclusao" value=<%= request.getAttribute("data_conclusao") %> /></td>
		</tr>
		<tr>
			<td>Status</td>
			<td><input type="text" name="status" value=<%= request.getAttribute("status") %>  /></td>
		</tr>
	</table>
	<br>
	<input type="submit" value="Enviar" />
	</form>
	</div>
</body>
</html>