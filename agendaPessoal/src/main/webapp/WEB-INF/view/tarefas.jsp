<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tasks</title>
</head>
<body>
	<a href = "/agendaPessoal/tarefas">Cadastrar Nova Tarefa</a>
	<table style="with: 80%">
		<tr>
			<th>Title</th>
			<th>Description</th>
			<th>Creation Date</th>
			<th>Due Date</th>
			<th>Status</th>
			<th>Edit</th>
		</tr>
		<c:forEach items="${requestScope.tarefas}" var="c">
			<tr>
				<td>${c.getTitulo()}</td>
				<td>${c.getDescricao()}</td>
				<td>${c.getDataCriacao()}</td>
				<td>${c.getDataConclusao()}</td>
				<td>${c.getStatus()}</td>
				<td><a href="editarTarefa?id=${c.getId()}">Editar</a></td>
				<td>
					<form method="post" action="excluirTarefa">
						<input type="hidden" name="id" value="${c.getId()}">
						<button type="submit">Delete</button>
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
	<a href="registrarTarefas?id=${id}" class="Botao1">New Task</a>
</body>
</html>