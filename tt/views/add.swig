<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{{ __('New travel order') }}</title>
  <link rel="stylesheet" href="/styles/add.css">
  <script src="js/add.js"></script>
</head>
<body>
  <div class="row header">
    <div class="col-2 col-m-2">
      <img src="/images/logo2.svg" class="logo" alt="Logo"/>
    </div>
    <div class="col-8 col-m-8">
      <h1>Travel tracker</h1>
    </div>
    <div class="col-2 col-m-2">
      <p><a href="#">{{user.username}}</a> | <a href="logout">{{ __('Logout') }}</a></p>
    </div>
  </div>
  <div class="row container">
    <div class="col-2 col-m-2">
      <ul>
        <li><a href="/">{{ __('Home') }}</a></li>
        <li>
          <a href="overview">{{ __('Travel orders') }}</a>
          <ul>
            <li><a class="sub active" href="add">{{ __('New order') }}</a></li>
          </ul>
        </li>
        <li><a href="contact">{{ __('Contact us') }}</a></li>
      </ul>
    </div>
    <div class="col-1 col-m-8 ">
    </div>
    <div class="col-6 col-m-8 overview">
      <h2>{{ __('New travel order') }}</h2>
      <form action="new" onsubmit="return validateForm()" id="from" method="post">
        <p>{{ __('Date of Departure') }}<input type="date"  name="departure" id="departure"></p>
        <p>{{ __('Date of Return') }}<input type="date"  name="arrival" id="arrival"></p>
        <p>{{ __('Destination') }}<input type="text"  name="destination" id="destination"></p>
        <p>{{ __('Country') }}<select id="countries"><option disabled selected value>Select a country</option></select></p>
      </form>
    </div>
    <div class="col-2"></div>
    </div>
  </body>
</html>
