<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>

<spring:url value="/resources/core/pictures/logo.svg" var="logo" />
<spring:url value="/resources/core/pictures/favicon.ico" var="icon" />
<spring:url value="/resources/core/css/login.css" var="coreCss" />
<link href="${coreCss}" rel="stylesheet" />
<link href="data:image/x-icon;base64,AAABAAEAHyAAAAEAIAAoEAAAFgAAACgAAAAfAAAAQAAAAAEAIAAAAAAAgA8AANcNAADXDQAAAAAAAAAAAADNzc3/0NDQ/9DQ0P/Q0ND/0NDQ/9DQ0P/Q0ND/0NDQ/9DQ0P/Q0ND/0NDQ/9DQ0P/Q0ND/0NDQ/9DQ0P/Q0ND/0NDQ/9DQ0P/Q0ND/0NDQ/9DQ0P/Q0ND/0NDQ/9DQ0P/Q0ND/0NDQ/9DQ0P/Q0ND/0NDQ/9DQ0P/Nzc3/0NDQ/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9TU1P/U1NT/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9TU1P/U1NT/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/0NDQ/9DQ0P/T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9TU1P/FxcX/v7+//9TU1P/T09P/09PT/9PT0//T09P/09PT/9TU1P/CwsL/wsLC/9TU1P/T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9DQ0P/Q0ND/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//U1NT/vLy8/6enp//CwsL/1NTU/9PT0//T09P/09PT/9TU1P/ExMT/qKio/7i4uP/U1NT/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//Q0ND/0NDQ/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/1NTU/7+/v//BwcH/t7e3/8DAwP/U1NT/09PT/9TU1P/Dw8P/tbW1/8PDw/+7u7v/1NTU/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/0NDQ/9DQ0P/T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9TU1P++vr7/w8PD/9LS0v+2trb/wMDA/9TU1P/Dw8P/tLS0/9DQ0P/Hx8f/u7u7/9TU1P/T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9DQ0P/Q0ND/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//U1NT/vLy8/5qamv+hoaH/nZ2d/5aWlv/IyMj/mJiY/5ycnP+hoaH/mpqa/7e3t//U1NT/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//Q0ND/0NDQ/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/1NTU/729vf+0tLT/wsLC/8LCwv+xsbH/vr6+/6+vr//CwsL/wsLC/7e3t/+5ubn/1NTU/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/0NDQ/9DQ0P/T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9TU1P++vr7/xMTE/9XV1f/V1dX/vLy8/729vf+6urr/1dXV/9XV1f/IyMj/u7u7/9TU1P/T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9DQ0P/Q0ND/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//U1NT/vr6+/8PDw//U1NT/1NTU/7u7u/+9vb3/urq6/9TU1P/U1NT/x8fH/7u7u//U1NT/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//Q0ND/0NDQ/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/1NTU/76+vv/Dw8P/1NTU/9TU1P+7u7v/vb29/7q6uv/U1NT/1NTU/8fHx/+7u7v/1NTU/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/0NDQ/9DQ0P/T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9TU1P++vr7/w8PD/9TU1P/U1NT/u7u7/729vf+6urr/1NTU/9TU1P/Hx8f/u7u7/9TU1P/T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9DQ0P/Q0ND/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//U1NT/vr6+/8PDw//U1NT/1NTU/7u7u/+9vb3/urq6/9TU1P/U1NT/x8fH/7u7u//U1NT/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//Q0ND/0NDQ/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/1NTU/76+vv/Dw8P/1NTU/9TU1P+7u7v/vb29/7q6uv/U1NT/1NTU/8fHx/+7u7v/1NTU/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/0NDQ/9DQ0P/T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9TU1P++vr7/w8PD/9TU1P/U1NT/u7u7/729vf+6urr/1NTU/9TU1P/Hx8f/u7u7/9TU1P/T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9DQ0P/Q0ND/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//U1NT/vr6+/8PDw//U1NT/1NTU/7u7u/+9vb3/urq6/9TU1P/U1NT/x8fH/7u7u//U1NT/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//Q0ND/0NDQ/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/1NTU/76+vv/Dw8P/1NTU/9TU1P+7u7v/vb29/7q6uv/U1NT/1NTU/8fHx/+7u7v/1NTU/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/0NDQ/9DQ0P/T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9TU1P++vr7/w8PD/9TU1P/U1NT/u7u7/729vf+6urr/1NTU/9TU1P/Hx8f/u7u7/9TU1P/T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9DQ0P/Q0ND/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//U1NT/vr6+/8PDw//U1NT/1NTU/7u7u/+9vb3/urq6/9TU1P/U1NT/x8fH/7u7u//U1NT/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//Q0ND/0NDQ/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/1NTU/76+vv/Dw8P/1NTU/9TU1P+7u7v/vb29/7q6uv/U1NT/1NTU/8fHx/+7u7v/1NTU/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/0NDQ/9DQ0P/T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9TU1P++vr7/w8PD/9TU1P/U1NT/u7u7/729vf+6urr/1NTU/9TU1P/Hx8f/u7u7/9TU1P/T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9DQ0P/Q0ND/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//U1NT/vr6+/8PDw//U1NT/1NTU/7u7u/+9vb3/urq6/9TU1P/U1NT/x8fH/7u7u//U1NT/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//Q0ND/0NDQ/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/1NTU/76+vv/Dw8P/1NTU/9TU1P+7u7v/vb29/7q6uv/U1NT/1NTU/8fHx/+7u7v/1NTU/9PT0//T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/0NDQ/9DQ0P/T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9TU1P++vr7/xMTE/9XV1f/V1dX/vLy8/729vf+6urr/1dXV/9XV1f/IyMj/u7u7/9TU1P/T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/09PT/9DQ0P/Q0ND/09PT/9PT0//T09P/09PT/9PT0//U1NT/0tLS/9HR0f/T09P/vLy8/7e3t//FxcX/xcXF/7Kysv+9vb3/sbGx/8XFxf/FxcX/urq6/7i4uP/T09P/0dHR/9LS0v/U1NT/09PT/9PT0//T09P/09PT/9PT0//Q0ND/0NDQ/9PT0//T09P/09PT/9TU1P/Nzc3/pqam/66urv+1tbX/tbW1/62trf+dnZ3/n5+f/5ycnP+Tk5P/xcXF/5WVlf+bm5v/n5+f/52dnf+rq6v/tra2/7W1tf+vr6//paWl/8zMzP/U1NT/09PT/9PT0//T09P/0NDQ/9DQ0P/T09P/09PT/9TU1P/Nzc3/s7Oz/5aWlv+7u7v/0tLS/9HR0f/R0dH/0tLS/9DQ0P+1tbX/v7+//9PT0//BwcH/tLS0/8/Pz//S0tL/0dHR/9HR0f/S0tL/vr6+/5WVlf+zs7P/zMzM/9TU1P/T09P/09PT/9DQ0P/Q0ND/09PT/9TU1P/Nzc3/s7Oz/8jIyP+jo6P/vb29/9TU1P/T09P/09PT/9HR0f+2trb/wMDA/9TU1P/T09P/1NTU/8LCwv+1tbX/0NDQ/9PT0//T09P/1NTU/8DAwP+hoaH/ycnJ/7Ozs//MzMz/1NTU/9PT0//Q0ND/0NDQ/9TU1P/Ly8v/r6+v/8TExP/R0dH/oKCg/7q6uv/R0dH/0NDQ/87Ozv+2trb/wMDA/9TU1P/T09P/09PT/9PT0//U1NT/wsLC/7W1tf/Nzc3/0NDQ/9HR0f+8vLz/np6e/9DQ0P/FxcX/r6+v/8rKyv/U1NT/0NDQ/9DQ0P/U1NT/vLy8/6urq/+2trb/tbW1/6mpqf+wsLD/tra2/7W1tf+0tLT/wsLC/9TU1P/T09P/09PT/9PT0//T09P/09PT/9TU1P/Dw8P/tLS0/7W1tf+2trb/sLCw/6ioqP+1tbX/tra2/6ysrP+6urr/1NTU/9DQ0P/Q0ND/09PT/9PT0//T09P/0tLS/9LS0v/T09P/09PT/9LS0v/S0tL/09PT/9TU1P/T09P/09PT/9PT0//T09P/09PT/9PT0//T09P/1NTU/9PT0//S0tL/0tLS/9PT0//T09P/0tLS/9LS0v/T09P/09PT/9PT0//Q0ND/zMzM/8/Pz//Pz8//z8/P/8/Pz//Pz8//z8/P/8/Pz//Pz8//z8/P/8/Pz//Pz8//z8/P/8/Pz//Pz8//z8/P/8/Pz//Pz8//z8/P/8/Pz//Pz8//z8/P/8/Pz//Pz8//z8/P/8/Pz//Pz8//z8/P/8/Pz//Pz8//zMzM/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" rel="icon" type="image/x-icon" />

</head>
<body>
	<div class="row login_div">
		<div class="col-4 col-m-2 col-s-2 col-xs-2"></div>
		<div class="col-4 col-m-6 col-s-8 col-xs-8 login_holder">
			<img src="${logo}" alt="logo" class="logo_pic">
			<div id="login_form">
				<h3>TravelTracker</h3>
				<form name="login_form" action="login" method="post">
					<input type="text" required name="user"
						placeholder="Username or Email"><br> <input
						type="password" required name="pass" placeholder="Password"><br>
					<c:if test="${not empty welcomeMessage}">
						<p>${welcomeMessage}</p>
					</c:if>
					<input type="submit" value="Log in"><br>
				</form>
				<form action="contact.html" id="from">
					<input type="submit" value="No account? Contact us!" />
				</form>
			</div>
		</div>
	</div>
</body>
</html>