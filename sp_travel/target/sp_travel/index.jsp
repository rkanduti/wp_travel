<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
	<spring:url value="/resources/core/css/login.css" var="loginCSS" />
	<link href="${loginCSS}" rel="stylesheet" />
  </head>
  <body>
    <div class="row login_div">
      <div class="col-4 col-m-2 col-s-2 col-xs-2"></div>
      <div class="col-4 col-m-6 col-s-8 col-xs-8 login_holder">
          <div id="login_form">
            <h3>TravelTracker</h3>
            <form name="login_form" action="first.html" onsubmit="return validateForm()">
              <input type="text" required name="user" placeholder="Username or Email"><br> 
              <input type="password"  name="pass" placeholder="Password"><br>
              <input type="submit" value="Log in"><br>
            </form>
            <form action="contact.html" id="from">
              <input type="submit" value="No account? Contact us!"/>
            </form>
          </div>
      </div>
    </div>
  </body>
</html>