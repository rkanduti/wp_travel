<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{{ __('Overview') }}</title>
  <link rel="stylesheet" href="styles/overview.css">
</head>
<body onload="populateTable()">
  <div class="row header">
    <div class="col-2 col-m-2">
      <img src="images/logo2.svg" class="logo" alt="Logo"/>
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
          <a class="active" href="overview">{{ __('Travel orders') }}</a>
          <ul>
            <li><a class="sub" href="add">{{ __('New order') }}</a></li>
          </ul>
        </li>
        <li><a href="contact">{{ __('Contact us') }}</a></li>
      </ul>
    </div>
    <div class="col-1 col-m-1 ">
    </div>
    <div class="col-6 col-m-8 overview">
      <h2>{{ __('All travel orders') }}</h2>
      <table id="table">
        <thead>
          <tr>
            <th>{{ __('Destination') }}</th>
            <th>{{ __('Arrival') }}</th>
            <th>{{ __('Status') }}</th>
            <th>{{ __('View') }}</th>
          </tr>
        </thead>
        <tbody>
          {% for travel in travels %}
            <tr>
              <td>{{ travel.destination }}</td>
              <td>{{ travel.darr }}</td>
              <td>{{ travel.status }}</td>
              <td><a href="travel/{{travel.travelid}}">View</a></td>
            </tr>
          {% endfor %}
        </tbody>
      </table>
    </div>
    <div class="col-2"></div>
    </div>
  </body>
  </html>
