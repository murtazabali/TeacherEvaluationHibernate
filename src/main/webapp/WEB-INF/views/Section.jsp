<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script src="webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sections</title>
</head>
<body>

	<div class="container-fluid">
		<nav class="navbar navbar-inverse">
		<div class="container">
			<div class="navbar-header">

				<a class="navbar-brand text-center" href="#">Teacher Evaluation</a>
			</div>
			<div class="pull-right col-md-2">
				<a href="/" class="btn btn-info btn-lg"> <span
					class="glyphicon glyphicon-log-out "></span> Log out
				</a> 
			</div>
				<br>



			

		</div>

		</nav>
		<ol class="breadcrumb">

			<li class="active">Section</li>
		</ol>
	</div>
	<div class="container">
		<div class="row text-center">

			<a href="/"> <img class="img-responsive"
				src="bootstrap/zab-logo.png" title="SZABIST" alt="SZABIST Logo"
				width=70% />

			</a>

		</div>
		<div>
			<h2>
				Sections <span class="glyphicon glyphicon-search"></span>
			</h2>
		</div>

		<div class="table-responsive col-md-6">
			<table class="table table-bordered table-hover">


				<c:forEach items="${sections}" var="section">
					<tr>

						<td><a href="/Course?secid=${section.sid}">
								${section.section}</a></td>
					</tr>

				</c:forEach>

			</table>
		</div>



		<div class="row col-md-12">
			<hr>
			<footer>
			<p>© 2017 - SZABIST Teacher Evaluation</p>
			</footer>
		</div>
	</div>
</body>
</html>