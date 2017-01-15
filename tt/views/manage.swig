<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{{ __('Edit travel order') }}</title>
  <link rel="stylesheet" href="/styles/manage.css">
  <script src="/js/manage.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
      <p><a href="#">{{user.username}}</a> | <a href="logout">Logout</a></p>
    </div>
  </div>
  <div class="row container">
    <div id="myModal" class="modal">
      <span class="close" onclick="closeModal()">&times;</span>
      <img class="modal-content" id="img01">
      <div id="caption"></div>
    </div>
    <div class="col-2 col-m-2">
      <ul>
        <li><a href="/">{{ __('Home') }}</a></li>
        <li>
          <a class="active" href="/overview">{{ __('Travel orders') }}</a>
          <ul>
            <li><a class="sub" href="/add">{{ __('New order') }}</a></li>
          </ul>
        </li>
        <li><a href="/contact">{{ __('Contact us') }}</a></li>
      </ul>
    </div>
    <div class="col-1 col-m-8 ">
    </div>
    <div class="col-6 col-m-8 overview">
      <h2>{{ __('Edit travel order') }}</h2>
      <form action="/overview" onsubmit="return checkTravel()" id="form" class="{{travel.travelid}}" method="get">
        <div class="row">
            <div>
              <p>{{ __('Departure') }}<input type="date"  name="departure" id="departure" value="{{travel.ddep}}"></p>
              <p>{{ __('Arrival') }}<input type="date"  name="arrival" id="arrival"value="{{travel.darr}}"></p>
              <p>{{ __('Destination') }}<input type="text"  name="destination" id="destination" value="{{travel.destination}}"></p>
              <p>{{ __('Country') }}<select id="countries"><option disabled selected value>Select a country</option></select></p>
              <p>{{ __('Status') }}<input type="text"  name="status" id="status"></p>
              <p><input type="checkbox" name="close" value="close" id="close">Close</p>
            </div>
        </div>
        <div class="row" id="control">
            <p><input type="submit" value="{{ __('Cancel') }}" class="cancel"></p>
            <p><input type="submit" value="{{ __('Submit') }}" class="submit"></p>
        </div>
      </form>
      <h2>{{ __('Expenses') }}</h2>
        <div class="row" id="acc">
          {% for expense in travel.expenses %}
            <form action="/saveExpense" onsubmit="return saveExpense('form#{{expense.expenseid}}')" id="form#{{expense.expenseid}}" class="expense#{{expense.expenseid}}" method="post" enctype="multipart/form-data">
              <button type="button" class="accordion #{{expense.expenseid}}" id="{{expense.expenseid}}">{{expense.name}}</button>
              <div class="panel {{expense.expenseid}}" style="margin-left: 1em; margin-right: 1em;">
                <p>{{ __('Name') }}<input type="text" onchange="edited({{expense.expenseid}}, this.value, this)" name="name" id="name" value="{{expense.name}}"></p>
                <p>{{ __('Amount') }}<input type="text" name="amount" id="amount" value="{{expense.amount}}"></p>
                <p>{{ __('Proof') }}<input type="file" accept="image/*"  name="file" id="file" value="{{expense.proofPathFd}}"></p>
                <p>{{ __('Uploaded') }}: {{expense.fileName}}<input type="text" name="travelid" id="travelid" value="{{travel.travelid}}" style="visibility: hidden"></p>
                <p><button type="button" class="remove" onclick="remove('expense#{{expense.expenseid}}')" style="margin-bottom: 5px;">{{ __('Remove') }}</button></p>
                <p><input type="submit" value="{{ __('Submit') }}" class="submit"></p>
                <p><button type="button" class="submit" onclick="viewProof({{expense.expenseid}})" style="margin-bottom: 5px;">{{ __('View') }}</button></p>
              </div>
            </form>
          {% endfor %}
        </div>
        <div class="row">
            <p><button type="button" class="add" id="add" onclick="addAccordium()">{{ __('Add') }}</button></p>
        </div>
    </div>
    <div class="col-2"></div>
    </div>
  </body>
</html>
