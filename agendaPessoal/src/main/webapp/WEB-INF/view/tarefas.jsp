<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All tasks</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap');

body {
    margin: 0;
    font-family: 'Noto Sans', sans-serif;
}

body * {
    box-sizing: border-box;
}

.main-login{
    width: 100vw;
    height: 100vh;
    display: flex;
    justify-content: center;
 
}

.btn {
    width: 100%;
    padding: 10px;
    margin: 25px;
    border: none;
    border-radius: 8px;
    font-size: 15px;
    color: #2b134b;
    background: #8e7cc3;
    cursor: pointer;
    box-shadow: 0px 10px 40px -12px #674ea7;
}

.card-login {
    width: 60%;
    display: flex;
    flex-direction: column;
    padding: 30px 35px ;
    background: #343746;
    border-radius: 20px;
    box-shadow: 0px 10px 40px #191a21;
}

.card-login > h1 {
    color: #8e7cc3;
    font-weight: 800;
    margin: 0;
}

@media only screen and (max-width: 950px){
    .card-login{
        width: 85%;
    }
}

@media only screen and (max-width: 600px){
    .main-login{
        flex-direction: column;
    }

    .card-login {
        width: 90%;
    }
}

.menu{
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #020024;
    top: 0;
    text-align: center;
}

.menu li {
    text-align: center;
}

.header{
    background: #282a36;
    padding: 10px 10px;
}

table, tr, td, th {
	border: 2px collapse #020024;
	margin: 0 auto;
	text-align: center;
	border-radius: 10px;
}

td, th {
	padding: 15px 15px;
	font-weight: 800;
	color: #8e7cc3;
	font-size: 20px;
}

.header li a {
    display: block;
    text-align: right;
    padding: 20px 20px;
    text-decoration: none;
    color: #8e7cc3;
    font-weight: 800;
    background: #282a36;
    box-shadow: 0px 10px 40px -12px #b4a7d6;
    text-transform: uppercase;
    font-size: 20px;
}
</style>
</head>
<body>

<div class="header">
        <ul class="menu">
            <li>
                <a href = "/agendaPessoal/registrarTarefas">Add New Task</a>
            </li>
        </ul>
</div>
<div class="main-login">
<div class="right-login">
<div>
<form action="<%=request.getContextPath()%>/tarefas" method="post">
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Task" %>

<table>
	<tr>
		<th>ID</th>
		<th>Title</th>
		<th>Description</th>
		<th>Creation Date</th>
		<th>Due Date</th>
		<th>Status</th>
		<th>Edit Task</th>
		<th>Delete Task</th>
	</tr>
	
	<c:forEach items="${requestScope.lista_tarefas}" var="c">
		<tr>
			<td>
				${c.id}
			</td>
			<td>
				${c.titulo}
			</td>
			<td>
				${c.descricao}
			</td>
			<td>
				${c.data_criacao}
			</td>
			<td>
				${c.data_conclusao}
			</td>
			<td>
				${c.status}
			</td>
			<td>
				<a class="btn" href="/agendaPessoal/editarTarefa?id_tarefa=${c.id}">Edit</a>
			</td>
			<td>
				<input type="hidden" name="id_excluir" value="${c.id}" />
				<input class="btn" type="submit" value="Delete" />
			</td>
		</tr>
	</c:forEach>
</table>

</form>
</div>
</div>
</div>
</body>
</html>