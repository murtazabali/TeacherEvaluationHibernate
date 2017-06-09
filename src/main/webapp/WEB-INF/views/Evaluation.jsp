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


<title>Questions</title>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand text-center" href="#">Teacher Evaluation</a>
			</div>
		</div>
		</nav>
	</div>
	<div class="container">

		<div class="table-responsive">
			<form action="/Save" method="post">
				<table class="table table-bordered table-hover">
					<tr>
						<th class="active">S.No</th>
						<th class="active">Questions</th>
						<c:forEach var="course" items="${courses}">
							<c:forEach var="teacher" items="${teachers}">
								<c:if test="${course.tid == teacher.tid}">
									<th class="active">${teacher.name}</th>
								</c:if>
							</c:forEach>
						</c:forEach>
					</tr>
					<tr class="active">
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<c:forEach var="course" items="${courses}">
							<th class="active">${course.title}</th>
						</c:forEach>
					</tr>
					<c:forEach var="quest" items="${questions}">

						<tr>
							<td>${quest.qid}</td>
							<td>${quest.question}</td>
							<c:forEach var="crs" items="${courses}">
								<td><select name="evaluation">
										<c:forEach var="grade" items="${grades}">
											<option value="${crs.cid}-${quest.qid}-${grade}">${grade}</option>
										</c:forEach>
								</select></td>

							</c:forEach>
					</c:forEach>
					<tr>
				</table>

				<button type="submit" class="btn btn-info">
					<span class="glyphicon glyphicon-ok"></span> Submit
				</button>
				<span>${exception}</span><br>

			</form>

			<hr>
			<footer>
			<p>© 2017 - SZABIST Teacher Evaluation</p>
			</footer>
		</div>
	</div>

</body>
</html>