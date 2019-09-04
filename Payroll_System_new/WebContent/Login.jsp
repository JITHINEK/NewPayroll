<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<style type="text/css">
body {
	background-image: url("logo8.jpg");
	background-repeat: no-repeat;
	background-size: 100%;
}

.form {
	font-weight: bold;
	font-size: 20px;
}
</style>
<script>
	function validate() {
		var username = document.form.username.value;
		var password = document.form.password.value;
		var role = document.form.role.value;
		if (username == null || username == "") {
			alert("Username cannot be blank.....!");
			return false;
		} else if (password == null || password == "") {
			alert("Password cannot be blank.....!");
			return false;
		} else if (role ==null || role == ""){
			alert("role cannot be blank....!");
			return false;
		}
	}
</script>
</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div style="text-align: center">
		<h1>Login</h1>
	</div>
	<br>
	<div class="form">
		<form name="form" action="LoginServlet" method="post"
			onsubmit="return validate()">
			<table align="center">
				<tr>
					<td>Login as :</td>
					<td><input type="radio" name="role" value="1">Employee
						<input type="radio" name="role" value="0">Admin</td>
				</tr>
				<tr>
					<td>User Name</td>
					<td><input type="text" name="uname" /></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="passwd" /></td>
				</tr>
				<tr>
					<td><span style="color: red"><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></span></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="Login"></input> <input
						type="reset" value="Reset"></input></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>