<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage travel order</title>

<spring:url value="/resources/core/css/manage.css" var="coreCss" />
<spring:url value="/resources/core/js/manage.js" var="coreJs" />
<spring:url value="/resources/core/pictures/logo2.svg" var="logo" />

<link href="${coreCss}" rel="stylesheet" />
<script src="${coreJs}"></script>
</head>
<body onload="sendRequest()">
	<div class="row header">
		<div class="col-2 col-m-2">
			<img src="${logo}" class="logo" alt="Logo" />
		</div>
		<div class="col-8 col-m-8">
			<h1>Travel tracker</h1>
		</div>
		<div class="col-2 col-m-2">
			<p>
				<a href="#">${user.username}</a> | <a
					href="${pageContext.request.contextPath}/login">Logout</a>
			</p>
		</div>
	</div>
	<div class="row container">
		<div class="col-2 col-m-2">
			<ul>
				<li><a href="${pageContext.request.contextPath}/">Home</a></li>
				<li><a href="${pageContext.request.contextPath}/overview">Travel orders</a>
					<ul>
						<li><a class="sub" href="${pageContext.request.contextPath}/add">New order</a></li>
					</ul></li>
				<li><a href="${pageContext.request.contextPath}/contact">Contact us</a></li>
			</ul>
		</div>
		<div class="col-1 col-m-8 "></div>
		<div class="col-6 col-m-8 overview">
			<h2>Edit travel order</h2>
			<form>
				<div class="row">
					<div>
						<p>
							Departure<input type="date" name="departure" id="departure" value="${travel.ddep}">
						</p>
						<p>
							Arrival<input type="date" name="arrival" id="arrival" value="${travel.darr}">
						</p>
						<p>
							Destination<input type="text" name="destination" id="destination" value="${travel.destination}">
						</p>
						<p>
							Status<input type="text" name="status" id="status" value="${travel.status}">
						</p>
						<p>
							<input type="checkbox" name="close" value="close" id="close">Close
						</p>
					</div>
				</div>
				<div class="row" id="acc"></div>
				<div class="row">
					<p>
						<button type="button" class="add" id="add"
							onclick="addAccordium()">Add</button>
					</p>
				</div>
				<div class="row" id="control">
					<p>
						<input type="submit" formaction="overview.html" value="Cancel"
							class="cancel">
					</p>
					<p>
						<button type="button" onclick="saveJSON()" class="submit">Submit</button>
					</p>
				</div>
			</form>
		</div>
		<div class="col-2"></div>
	</div>
</body>
</html>