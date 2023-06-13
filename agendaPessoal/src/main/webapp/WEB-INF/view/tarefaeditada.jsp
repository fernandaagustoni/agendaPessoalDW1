<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Successfully edited task</title>
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

.left-login > h1 {
    font-size: 3vw;
    color: #6ffc92;
}

.left-login-image{
    width: 35vw;
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

</style>
</head>
<body>
       <div class="main-login">
        <div class="right-login">
            <div class="card-login">
				<h1>Successfully edited task!</h1>
            </div>
        </div>
    </div>
</body>
</html>