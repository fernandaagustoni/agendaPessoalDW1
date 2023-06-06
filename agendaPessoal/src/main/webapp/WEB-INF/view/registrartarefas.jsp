<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Task</title>
</head>
<body>
<form action="<%=request.getContextPath()%>/registrarTarefas" method="post">
<main>
	<h1>New Task</h1>
	<form method="post">
	<section>
			<table>
		<tr>
			<td>Title</td>
			<td><input type="text" name="titulo" /></td>
		</tr>
		<tr>
			<td>Description</td>
			<td><input type="text" name="descricao" /></td>
		</tr>
		<tr>
			<td>Creation Date</td>
			<td><input type="date" name="data_criacao" /></td>
		</tr>
		<tr>
			<td>Due Date</td>
			<td><input type="date" name="data_conclusao" /></td>
		</tr>
		<tr>
			<td>Status</td>
			<td><input type="text" name="status" /></td>
		</tr>
	</table>
	<br>
	<input type="submit" value="Submit" />
	</section>
	</form>

</main>
</form>
</body>
</html>