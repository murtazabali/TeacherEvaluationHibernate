<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet"
	href="bootstrap/css/bootstrap.min.css">
<script
	src="webjars/jquery/3.2.1/dist/jquery.min.js"></script>
<script
	src="bootstrap/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Evaluation Result</title>
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
		</div>
		</nav>
		<ol class="breadcrumb">
			<li><a href="/Section">Sections</a></li>
			<li><a href="/Course?secid=${secid}">Courses</a></li>
			<li class="active">Evaluation Result</li>
		</ol>
	</div>
	<div class="container">
		<div>
			<h2>
				Evaluation Result <span class="glyphicon glyphicon-signal"></span>
			</h2>
		</div>

		<div class="table-responsive col-md-12">
			<table class="table table-bordered table-hover">
				<tr>
					<th class="active">S.No</th>
					<th class="active">Questions</th>
					<c:forEach var="grade" items="${grades}">
						<th class="active"><p class="text-center">${grade}</p></th>
					</c:forEach>
				</tr>

				<c:forEach var="quest" items="${questions}">
					<tr>
						<td class="text-center">${quest.qid}</td>
						<td>${quest.question}</td>
						<c:forEach var="grade" items="${grades}">
							<td style="text-align: center;"><c:if test="${grade == 'A'}">
									<c:forEach var="evala" items="${evalcounta}">
										<c:if test="${evala[1] == quest.qid}">
							${evala[0]}
						</c:if>
									</c:forEach>
								</c:if> <c:if test="${grade == 'B'}">
									<c:forEach var="evalb" items="${evalcountb}">
										<c:if test="${evalb[1] == quest.qid}">
							${evalb[0]}
						</c:if>
									</c:forEach>
								</c:if> <c:if test="${grade == 'C'}">
									<c:forEach var="evalc" items="${evalcountc}">
										<c:if test="${evalc[1] == quest.qid}">
							${evalc[0]}
						</c:if>
									</c:forEach>
								</c:if> <c:if test="${grade == 'D'}">
									<c:forEach var="evald" items="${evalcountd}">
										<c:if test="${evald[1] == quest.qid}">
							${evald[0]}
						</c:if>
									</c:forEach>
								</c:if></td>
						</c:forEach>
					</tr>
				</c:forEach>

				<tr class="active">
					<td></td>
					<td><h4 class="text-center">
							<strong>Total</strong>
						</h4></td>
					<c:forEach var="grade" items="${grades}">
						<td><c:if test="${grade == 'A'}">
								<h4 class="text-center">${totala}</h4>
							</c:if> <c:if test="${grade == 'B'}">
								<h4 class="text-center">${totalb }</h4>
							</c:if> <c:if test="${grade == 'C'}">
								<h4 class="text-center">${totalc }</h4>
							</c:if> <c:if test="${grade == 'D'}">
								<h4 class="text-center">${totald }</h4>
							</c:if></td>
					</c:forEach>
				</tr>
				<tr class="active">
					<td></td>
					<td><h4 class="text-center">
							<strong>Percentage</strong>
						</h4></td>
					<c:forEach var="grade" items="${grades}">
						<c:if test="${totala+totalb+totalc+totald == 0}">
							<td><h4 class="text-center">0</h4></td>
							<td><h4 class="text-center">0</h4></td>
							<td><h4 class="text-center">0</h4></td>
							<td><h4 class="text-center">0</h4></td>
						</c:if>
						
						<td><c:if test="${grade == 'A'}">
								<h4 class="text-center">
									<fmt:formatNumber maxFractionDigits="1">${(totala)/(totala+totalb+totalc+totald) * 100}</fmt:formatNumber>
								</h4>
							</c:if> <c:if test="${grade == 'B'}">
								<h4 class="text-center">
									<fmt:formatNumber maxFractionDigits="1">${totalb/(totala+totalb+totalc+totald) * 100}</fmt:formatNumber>
								</h4>
							</c:if> <c:if test="${grade == 'C'}">
								<h4 class="text-center">
									<fmt:formatNumber maxFractionDigits="1">${totalc/(totala+totalb+totalc+totald) * 100}</fmt:formatNumber>
								</h4>
							</c:if> <c:if test="${grade == 'D'}">
								<h4 class="text-center">
									<fmt:formatNumber maxFractionDigits="1">${totald/(totala+totalb+totalc+totald) * 100 }</fmt:formatNumber>
								</h4>
							</c:if></td>
					</c:forEach>
				</tr>
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