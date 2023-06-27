<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Tasks</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap');

body {
    margin: 0;
    font-family: 'Noto Sans', sans-serif;
}

body * {
    box-sizing: border-box;
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

table, tr, td{
	border: 2px collapse #020024;
	margin: 0 auto;
	text-align: center;
	border-radius: 10px;
}

table{
	width: 50%;
}

td {
	padding: 0px 50px;
	font-weight: 600;
	color: #8e7cc3;
	font-size: 20px;
}

th {
	width: 100%;
    padding: 10px 40px;
    border: none;
    border-radius: 8px;
    font-size: 15px;
    color: #2b134b;
    background: #8e7cc3;
    cursor: pointer;
    box-shadow: 0px 10px 40px -12px #674ea7;
    justify-content: center;
    margin: 10px 0px;
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
nav {
  position: absolute;
  top: 5%;
  right: 0;
  width: 319px;
  display: table;
  margin: 0 auto;
  transform: translateY(-50%);
}

nav a {
  position: relative;
  width: 33.333%;
  display: table-cell;
  text-align: center;
  color: #2b134b;
  text-decoration: none;
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  font-weight: bold;
  padding: 10px 20px;
  transition: 0.2s ease color;
}

nav a:before,
nav a:after {
  content: "";
  position: absolute;
  border-radius: 50%;
  transform: scale(0);
  transition: 0.2s ease transform;
}

nav a:before {
  top: 0;
  left: 10px;
  width: 6px;
  height: 6px;
}

nav a:after {
  top: 5px;
  left: 18px;
  width: 4px;
  height: 4px;
}

nav a:nth-child(1):before {
  background-color: yellow;
}

nav a:nth-child(1):after {
  background-color: red;
}

nav a:nth-child(2):before {
  background-color: #2b134b;
}

nav a:nth-child(2):after {
  background-color: #89ff00;
}

nav a:nth-child(3):before {
  background-color: purple;
}

nav a:nth-child(3):after {
  background-color: palevioletred;
}

#indicator {
  position: absolute;
  left: 5%;
  bottom: 0;
  width: 30px;
  height: 3px;
  background-color: #2b134b;
  border-radius: 5px;
  transition: 0.2s ease left;
}

nav a:hover {
  color: #2b134b;
}

nav a:hover:before,
nav a:hover:after {
  transform: scale(1);
}

nav a:nth-child(1):hover ~ #indicator {
  background: linear-gradient(130deg, yellow, red);
}

nav a:nth-child(2):hover ~ #indicator {
  left: 34%;
  background: linear-gradient(130deg, #00e2ff, #89ff00);
}

nav a:nth-child(3):hover ~ #indicator {
  left: 70%;
  background: linear-gradient(130deg, purple, palevioletred);
}
.margin{
	margin-top: 6%;
}
.card-login {
    width: 90%;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    padding: 30px 35px ;
    background: #343746;
    border-radius: 20px;
    box-shadow: 0px 10px 40px #191a21;
}
.main-login{
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
}
</style>
</head>
<body>
	<div class="margin">
	<nav>
      <a href = "/agendaPessoal/registrarTarefas">NEW</a>
      <a href = "/agendaPessoal/LogoutServlet">LOGOUT</a>
      <div id="indicator"></div>
    </nav>
    </div>
<div class="main-login">
<div class="card-login">
<form action="<%=request.getContextPath()%>/tarefas" method="post">
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Task" %>

<table>
	<tr>
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
					<c:choose>
				   <c:when test="${c.status == 'nao_iniciada'}">To do</c:when> 
				   <c:when test="${c.status == 'em_andamento'}">Working in Progress</c:when> 
				   <c:when test="${c.status == 'concluida'}">Done </c:when>
				</c:choose>
			</td>
			<td>
				<a class = "btn" href="/agendaPessoal/editarTarefa?id_tarefa=${c.id}">Edit</a>
			</td>
			<td>
				<input type="hidden" name="id_excluir" value="${c.id}" />
				<input class = "btn" type="submit" value="Delete" />
			</td>
		</tr>
	</c:forEach>
</table>

</form>
</div>
</div>
</body>
</html>