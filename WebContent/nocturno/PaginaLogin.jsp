<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="aplicacion.vista.Tag"%>
<%!String error; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="css/styleNocturno.css">
</head>
<body>
	<%
	error = (String) request.getParameter("error");
	String err1 = "El correo o la contraseña no son correctos";
	String err2 = "Esta cuenta aún no ha sido validada";
	if (error != null) {
		if (error.equals("1")) {
			error = err1;
		} else if (error.equals("2")) {
			error = err2;
		}
	}
	%>
	<h1>Iniciar sesión</h1>
	<form method="POST" action="Login">
		<p>Correo</p>
		<input name="correo" type="email">
		<p>Contraseña</p>
		<input name="paswd" type="password">
		<input type="hidden" name="modo" value="nocturno">
		<input type="submit" value="Iniciar sesión">
	</form>
	<%
	if(error != null){
		Tag pista = new Tag("p",error,true,true);
		pista.prepararAtributos();
		pista.addAtributo("class", "error");
		out.print(pista.toString());
	}
	%>
	<ul id="navegacion">
		<li>
			<a id="logo" href="Principal?modo=nocturno">
				<img src="imgs/logo.png">
			</a>
		</li>
	</ul>
	<a href="Login?modo=diurno">Modo diurno</a>
</body>
</html>