<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="styles/login.css">
    <script src="js/login.js"></script>
  </head>
  <body onload="populateUsers()">
    <div class="row login_div">
      <div class="col-4 col-m-2 col-s-2 col-xs-2"></div>
      <div class="col-4 col-m-6 col-s-8 col-xs-8 login_holder">
          <img src="images/logo.svg" alt="logo" class="logo_pic">
          <div id="login_form">
            <h3>TravelTracker</h3>
            <form name="login_form" method="post" action="user">
              <input type="text" required name="username" placeholder="Username"><br>
              <input type="text" required name="mail" placeholder="Email"><br>
              <input type="text" required name="firstname" placeholder="Firstname"><br>
              <input type="text" required name="lastname" placeholder="Lastname"><br>
              <input type="text" required name="companyid" placeholder="Company"><br>
              <input type="password"  name="password" placeholder="Password"><br>
              <input type="submit" value="Sign up"><br>
            </form>
          </div>
      </div>
    </div>
  </body>
</html>
