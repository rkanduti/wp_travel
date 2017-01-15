<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{{ __('Index') }}</title>
  <link rel="stylesheet" href="styles/index.css">
</head>
<body onload="populatePage()">
  <div class="errors">
    {% for message in messages %}
      <p>{{ message }}</p>
    {% endfor %}
  </div>
  <div class="row header">
    <div class="col-2 col-m-2">
      <img src="images/logo2.svg" class="logo" alt="Logo"/>
    </div>
    <div class="col-8 col-m-8">
      <h1>Travel Tracker</h1>
    </div>
    <div class="col-2 col-m-2">
      <p><a href="#">{{user.username}}</a> | <a href="logout">{{ __('Logout') }}</a></p>
    </div>
  </div>
  <div class="row container">
    <div class="col-2 col-m-2">
      <ul>
        <li><a class="active" href="/">{{ __('Home') }}</a></li>
        <li>
          <a href="overview">{{ __('Travel orders') }}</a>
          <ul>
            <li><a class="sub" href="add">{{ __('New order') }}</a></li>
          </ul>
        </li>
        <li><a href="contact">{{ __('Contact us') }}</a></li>
      </ul>
    </div>
    <div class="col-8  col-m-10 overview">
      <div class="left_overview">
        <div class="row">
          <h3>{{ __('Profile') }}</h3>
          <div class="sum">
            <div class="info">
              <p>{{ __('Firstname') }}</p>
              <p>{{ __('Lastname') }}</p>
              <p>{{ __('Company') }}</p>
            </div>
            <div class="info info2">
              <p id="firstname">{{ user.firstname }}</p>
              <p id="lastname">{{ user.lastname }}</p>
              <p id="company">{{ company.name }}</p>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="info_left">
            <h3>{{ __('Last travel') }}</h3>
            <div class="sum">
              <div class="info">
                <p>{{ __('Departure') }}</p>
                <p>{{ __('Arrival') }}</p>
                <p>{{ __('Destination') }}</p>
              </div>
              <div class="info info2">
                {% if user.travels[0] %}
                  <p>{{ user.travels[0].ddep }}</p>
                  <p>{{ user.travels[0].darr }}</p>
                  <p>{{ user.travels[0].destination }}</p>
                {% endif %}
              </div>
            </div>
          </div>
          <div class="info_right">
            <form>
              <input value="{{ __('New') }}" formaction="add.html" title="New" name="New" type="submit" class="button">
              <input value="{{ __('Manage') }}" formaction="travel/{{user.travels[0].travelid}}" type="submit" class="button">
            </form>
          </div>
        </div>
      </div>
      <div class="right_overview">
          <h3>{{ __('Travels per month (past 6 months)') }}</h3>
          <div id="graph">
            <canvas id="canvas" height="300"></canvas>
          </div>
      </div>
    </div>
    <div class="col-2"></div>
  </div>
</body>
</html>
