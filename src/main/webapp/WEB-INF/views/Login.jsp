<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script src="webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Teacher Evaluation System</title>
</head>
<body>


	<div class="container">
		<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand text-center" href="#">Teacher Evaluation</a>
			</div>
		</div>
		</nav>
		
			<h2>
				Welcome to Teacher Evaluation <span
					class="glyphicon glyphicon-education"></span>
			</h2>
		

		<div class="row text-center">

			<a href="/"> <img class="img-responsive"
				src="bootstrap/zab-logo.png"
				title="SZABIST" alt="SZABIST Logo" width=70% />

			</a>

		</div>


		<form method="Post" id="frmlogin">

			<div class="form-group col-xs-12">

				<h4>Username :</h4>
				<input type="text" name="regno" id="regno" class="form-control"
					required="true" placeholder="Registration"><br>


				<h4>Password :</h4>
				<input type="password" name="password" id="password"
					class="form-control" required="true" placeholder="Password"><br>
				<span>${message}</span> <span>${msg}</span><br>
				<button type="submit" class="btn btn-info">
					<span class="glyphicon glyphicon-education"></span> Login
				</button>
			</div>

		</form>
		<br>
		<hr>
		<footer> <br>
		<p>© 2017 - SZABIST Teacher Evaluation</p>
		</footer>
	</div>
</body>
</html>