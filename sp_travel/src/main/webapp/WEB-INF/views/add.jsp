<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>New travel order</title>

<spring:url value="/resources/core/css/add.css" var="coreCss" />
<spring:url value="/resources/core/js/add.js" var="coreJs" />
<spring:url value="/resources/core/pictures/logo2.svg" var="logo" />

<link href="${coreCss}" rel="stylesheet" />
<script src="${coreJs}"></script>
<link href="data:image/x-icon;base64,AAABAAEAHyAAAAEAIAAoEAAAFgAAACgAAAAfAAAAQAAAAAEAIAAAAAAAgA8AANcNAADXDQAAAAAAAAAAAADNzc3/0NDQ/9DQ0P/Q0ND/0NDQ/9DQ0P/Q0ND/0NDQ/9DQ0P/Q0ND/0NDQ/9DQ0P/Q0ND/0NDQ/9DQ0P/Q0ND/0NDQ/9DQ0P/Q0ND/0NDQ/9DQ0P/Q0ND/0NDQ/9DQ0P/Q0ND/0NDQ/9DQ0P/Q0ND/0NDQ/9DQ0P/Nzc3/0NDQ/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9TU1P/U1NT/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9TU1P/U1NT/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/0NDQ/9DQ0P/T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9TU1P/FxcX/v7+//9TU1P/T09P/09PT/9PT0//T09P/09PT/9TU1P/CwsL/wsLC/9TU1P/T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9DQ0P/Q0ND/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//U1NT/vLy8/6enp//CwsL/1NTU/9PT0//T09P/09PT/9TU1P/ExMT/qKio/7i4uP/U1NT/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//Q0ND/0NDQ/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/1NTU/7+/v//BwcH/t7e3/8DAwP/U1NT/09PT/9TU1P/Dw8P/tbW1/8PDw/+7u7v/1NTU/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/0NDQ/9DQ0P/T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9TU1P++vr7/w8PD/9LS0v+2trb/wMDA/9TU1P/Dw8P/tLS0/9DQ0P/Hx8f/u7u7/9TU1P/T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9DQ0P/Q0ND/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//U1NT/vLy8/5qamv+hoaH/nZ2d/5aWlv/IyMj/mJiY/5ycnP+hoaH/mpqa/7e3t//U1NT/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//Q0ND/0NDQ/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/1NTU/729vf+0tLT/wsLC/8LCwv+xsbH/vr6+/6+vr//CwsL/wsLC/7e3t/+5ubn/1NTU/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/0NDQ/9DQ0P/T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9TU1P++vr7/xMTE/9XV1f/V1dX/vLy8/729vf+6urr/1dXV/9XV1f/IyMj/u7u7/9TU1P/T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9DQ0P/Q0ND/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//U1NT/vr6+/8PDw//U1NT/1NTU/7u7u/+9vb3/urq6/9TU1P/U1NT/x8fH/7u7u//U1NT/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//Q0ND/0NDQ/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/1NTU/76+vv/Dw8P/1NTU/9TU1P+7u7v/vb29/7q6uv/U1NT/1NTU/8fHx/+7u7v/1NTU/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/0NDQ/9DQ0P/T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9TU1P++vr7/w8PD/9TU1P/U1NT/u7u7/729vf+6urr/1NTU/9TU1P/Hx8f/u7u7/9TU1P/T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9DQ0P/Q0ND/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//U1NT/vr6+/8PDw//U1NT/1NTU/7u7u/+9vb3/urq6/9TU1P/U1NT/x8fH/7u7u//U1NT/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//Q0ND/0NDQ/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/1NTU/76+vv/Dw8P/1NTU/9TU1P+7u7v/vb29/7q6uv/U1NT/1NTU/8fHx/+7u7v/1NTU/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/0NDQ/9DQ0P/T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9TU1P++vr7/w8PD/9TU1P/U1NT/u7u7/729vf+6urr/1NTU/9TU1P/Hx8f/u7u7/9TU1P/T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9DQ0P/Q0ND/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//U1NT/vr6+/8PDw//U1NT/1NTU/7u7u/+9vb3/urq6/9TU1P/U1NT/x8fH/7u7u//U1NT/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//Q0ND/0NDQ/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/1NTU/76+vv/Dw8P/1NTU/9TU1P+7u7v/vb29/7q6uv/U1NT/1NTU/8fHx/+7u7v/1NTU/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/0NDQ/9DQ0P/T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9TU1P++vr7/w8PD/9TU1P/U1NT/u7u7/729vf+6urr/1NTU/9TU1P/Hx8f/u7u7/9TU1P/T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9DQ0P/Q0ND/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//U1NT/vr6+/8PDw//U1NT/1NTU/7u7u/+9vb3/urq6/9TU1P/U1NT/x8fH/7u7u//U1NT/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//Q0ND/0NDQ/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/1NTU/76+vv/Dw8P/1NTU/9TU1P+7u7v/vb29/7q6uv/U1NT/1NTU/8fHx/+7u7v/1NTU/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/0NDQ/9DQ0P/T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9TU1P++vr7/w8PD/9TU1P/U1NT/u7u7/729vf+6urr/1NTU/9TU1P/Hx8f/u7u7/9TU1P/T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9DQ0P/Q0ND/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//U1NT/vr6+/8PDw//U1NT/1NTU/7u7u/+9vb3/urq6/9TU1P/U1NT/x8fH/7u7u//U1NT/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//Q0ND/0NDQ/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/1NTU/76+vv/Dw8P/1NTU/9TU1P+7u7v/vb29/7q6uv/U1NT/1NTU/8fHx/+7u7v/1NTU/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/0NDQ/9DQ0P/T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9TU1P++vr7/xMTE/9XV1f/V1dX/vLy8/729vf+6urr/1dXV/9XV1f/IyMj/u7u7/9TU1P/T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9DQ0P/Q0ND/09PT/9PT0//T09P/09PT/9PT0//U1NT/0tLS/9HR0f/T09P/vLy8/7e3t//FxcX/xcXF/7Kysv+9vb3/sbGx/8XFxf/FxcX/urq6/7i4uP/T09P/0dHR/9LS0v/U1NT/09PT/9PT0//T09P/09PT/9PT0//Q0ND/0NDQ/9PT0//T09P/09PT/9TU1P/Nzc3/pqam/66urv+1tbX/tbW1/62trf+dnZ3/n5+f/5ycnP+Tk5P/xcXF/5WVlf+bm5v/n5+f/52dnf+rq6v/tra2/7W1tf+vr6//paWl/8zMzP/U1NT/09PT/9PT0//T09P/0NDQ/9DQ0P/T09P/09PT/9TU1P/Nzc3/s7Oz/5aWlv+7u7v/0tLS/9HR0f/R0dH/0tLS/9DQ0P+1tbX/v7+//9PT0//BwcH/tLS0/8/Pz//S0tL/0dHR/9HR0f/S0tL/vr6+/5WVlf+zs7P/zMzM/9TU1P/T09P/09PT/9DQ0P/Q0ND/09PT/9TU1P/Nzc3/s7Oz/8jIyP+jo6P/vb29/9TU1P/T09P/09PT/9HR0f+2trb/wMDA/9TU1P/T09P/1NTU/8LCwv+1tbX/0NDQ/9PT0//T09P/1NTU/8DAwP+hoaH/ycnJ/7Ozs//MzMz/1NTU/9PT0//Q0ND/0NDQ/9TU1P/Ly8v/r6+v/8TExP/R0dH/oKCg/7q6uv/R0dH/0NDQ/87Ozv+2trb/wMDA/9TU1P/T09P/09PT/9PT0//U1NT/wsLC/7W1tf/Nzc3/0NDQ/9HR0f+8vLz/np6e/9DQ0P/FxcX/r6+v/8rKyv/U1NT/0NDQ/9DQ0P/U1NT/vLy8/6urq/+2trb/tbW1/6mpqf+wsLD/tra2/7W1tf+0tLT/wsLC/9TU1P/T09P/09PT/9PT0//T09P/09PT/9TU1P/Dw8P/tLS0/7W1tf+2trb/sLCw/6ioqP+1tbX/tra2/6ysrP+6urr/1NTU/9DQ0P/Q0ND/09PT/9PT0//T09P/0tLS/9LS0v/T09P/09PT/9LS0v/S0tL/09PT/9TU1P/T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/1NTU/9PT0//S0tL/0tLS/9PT0//T09P/0tLS/9LS0v/T09P/09PT/9PT0//Q0ND/zMzM/8/Pz//Pz8//z8/P/8/Pz//Pz8//z8/P/8/Pz//Pz8//z8/P/8/Pz//Pz8//z8/P/8/Pz//Pz8//z8/P/8/Pz//Pz8//z8/P/8/Pz//Pz8//z8/P/8/Pz//Pz8//z8/P/8/Pz//Pz8//z8/P/8/Pz//Pz8//zMzM/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" rel="icon" type="image/x-icon" />

</head>
<body onload="populateCountries()">
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
						<li><a class="active" class="sub" href="${pageContext.request.contextPath}/add">New order</a></li>
					</ul></li>
				<li><a href="${pageContext.request.contextPath}/contact">Contact us</a></li>
			</ul>
		</div>
		<div class="col-1 col-m-8 "></div>
		<div class="col-6 col-m-8 overview">
			<h2>New travel order</h2>
			<form action="add" id="from" method="post">
				<p>
					Date of Departure<input type="date" name="departure" id="departure">
				</p>
				<p>
					Date of Return<input type="date" name="arrival" id="arrival">
				</p>
				<p>
					Destination<input type="text" name="destination" id="destination">
				</p>
				<p>
					Country<select id="countries"><option disabled selected
							value>Select a country</option></select>
				</p>
				<h3>Estimated expenses</h3>
				<p>
					<input type="checkbox" onclick="check()" name="notReq"
						value="notReq" id="notReq">Reimbursement not required
				</p>
				<p>
					<input type="radio" onclick="checkRadios(this)" name="type"
						value="comCar" id="comCar" class="radios"> Travel with
					company car
				</p>
				<p>
					<input type="radio" onclick="checkRadios(this)" name="type"
						value="perCar" id="perCar" class="radios"> Travel with
					personal car
				</p>
				<p>
					<input type="radio" onclick="checkRadios(this)" name="type"
						value="other" id="other" class="radios"> Other
				</p>
				<p>
					<input type="radio" name="comm" value="bus" id="bus" class="others"
						style="margin-left: 2em;"> Bus
				</p>
				<p>
					<input type="radio" name="comm" value="train" id="train"
						class="others" style="margin-left: 2em;"> Train
				</p>
				<p>
					<input type="submit" value="Submit" />
				</p>
				<p>
					Total estimation <input type="text" name="user" id="total"
						style="width: 30% !important; float: none !important;"> €
				</p>
			</form>
		</div>
		<div class="col-2"></div>
	</div>
</body>
</html>