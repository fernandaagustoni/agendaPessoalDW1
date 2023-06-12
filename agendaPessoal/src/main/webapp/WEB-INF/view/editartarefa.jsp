<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="model.Task"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Task</title>
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
    align-items: center;
}

.left-login{
    width: 50vw;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

.right-login {
    width: 50vw;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

.card-login {
    width: 60%;
    display: flex;
    justify-content: center;
    align-items: center;
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

.textfield {
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    justify-content: center;
    margin: 10px 0px;
}

.textfield > input {
    width: 100%;
    border: none;
    border-radius: 10px;
    padding: 15px;
    background: #424450;
    color: #f8f8f2;
    font-size: 12pt;
    box-shadow: 0px 10px 40px #191a21;
    outline: none;
    box-sizing: border-box;
}

.textfield > label {
    color: #f8f8f2;
    margin-bottom: 10px;
}

.btn-login {
    width: 100%;
    padding: 16px 0px;
    margin: 25px;
    border: none;
    border-radius: 8px;
    outline: none;
    text-transform: uppercase;
    font-weight: 800;
    letter-spacing: 2px;
    color: #2b134b;
    background: #8e7cc3;
    cursor: pointer;
    box-shadow: 0px 10px 40px -12px #b4a7d6;
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

    .right-login {
        width: 100%;
        height: auto;
    }
    .left-login-image {
        width: 50vw;
    }
    .card-login {
        width: 90%;
    }
}
</style>
</head>
<body>
	<form method="post">
	   <div class="main-login">
        	<div class="right-login">
            	<div class="card-login">

		            <div class="textfield">
                    	<label for="titulo">Title</label>
                    	<input type="text" name="titulo" value=<%= request.getAttribute("titulo") %>/>
                	</div>
                	<div class="textfield">
                    	<label for="titulo">Description</label>
                    	<input type="text" name="descricao" value=<%= request.getAttribute("descricao") %> />
                	</div>
                	<div class="textfield">
                    	<label for="titulo">Creation Date</label>
                    	<input type="date" name="data_criacao" value=<%= request.getAttribute("data_criacao") %> />
                	</div>
                	<div class="textfield">
                    	<label for="titulo">Due Date</label>
                    	<input type="date" name="data_conclusao" value=<%= request.getAttribute("data_conclusao") %> />
                	</div>
                	<div class="textfield">
                    	<label for="titulo">Status</label>
                    	<input type="text" name="status" value=<%= request.getAttribute("status") %> />
                	</div>
					<br>
	<input type="submit" class="btn-login" value="Enviar" />
	        </div>
        </div>
    </div>
	</form>
</body>
</html>