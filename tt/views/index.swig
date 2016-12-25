<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Index</title>
  <link rel="stylesheet" href="styles/index.css">
  <script src="js/first.js"></script>
</head>
<body onload="populatePage()">
  <div class="row header">
    <div class="col-2 col-m-2">
      <img src="images/logo2.svg" class="logo" alt="Logo"/>
    </div>
    <div class="col-8 col-m-8">
      <h1>Travel Tracker</h1>
    </div>
    <div class="col-2 col-m-2">
      <p><a href="#">rkanduti</a> | <a href="logout">Logout</a></p>
    </div>
  </div>
  <div class="row container">
    <div class="col-2 col-m-2">
      <ul>
        <li><a class="active" href="first.html">Home</a></li>
        <li>
          <a href="overview.html">Travel orders</a>
          <ul>
            <li><a class="sub" href="add.html">New order</a></li>
          </ul>
        </li>
        <li><a href="contact.html">Contact us</a></li>
      </ul>
    </div>
    <div class="col-8  col-m-10 overview">
      <div class="left_overview">
        <div class="row">
          <h3>Profile</h3>
          <div class="sum">
            <div class="info">
              <p>Firstname</p>
              <p>Lastname</p>
              <p>Company</p>
            </div>
            <div class="info info2">
              <p id="firstname">Rok</p>
              <p id="lastname">Kanduti</p>
              <p id="company1">ŠPICA</p>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="info_left">
            <h3>Last travel</h3>
            <div class="sum">
              <div class="info">
                <p>Departure</p>
                <p>Arrival</p>
                <p>Destination</p>
              </div>
              <div class="info info2">
                <p>20.11.2016</p>
                <p>25.11.2016</p>
                <p>Bahami</p>
              </div>
            </div>
          </div>
          <div class="info_right">
            <form>
              <input value="New" formaction="add.html" title="New" name="New" type="submit" class="button">
              <input value="Manage" formaction="overview.html" title="Manage" name="Manage" type="submit" class="button">
            </form>
          </div>
        </div>
      </div>
      <div class="right_overview">
          <h3>Travels per month (past 6 months)</h3>
          <div id="graph">
            <canvas id="canvas" height="300"></canvas>
          </div>
      </div>
    </div>
    <div class="col-2"></div>
  </div>
</body>
</html>
