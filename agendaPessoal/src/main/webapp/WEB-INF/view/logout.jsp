<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logout</title>
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
</style>
</head>
<body>
	<nav>
      <a class="menu" href = "/agendaPessoal/registerUser">SIGN UP</a>  
      <div id="indicator"></div>
    </nav>
    <div class="main-login">
        <div class="right-login">
            <div class="card-login">
				<h1>Successfully logout!</h1>
            </div>
        </div>
    </div>
</body>
</html>