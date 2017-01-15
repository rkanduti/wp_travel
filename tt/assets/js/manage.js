var trav;

function enableAcc() {
  var acc = document.getElementsByClassName("accordion");
  var i;

  for (i = 0; i < acc.length; i++) {
    acc[i].onclick = function(){
      this.classList.toggle("active");
      this.nextElementSibling.classList.toggle("show");
    }
  }
}

function parseCountries(event) {
    var countries = JSON.parse(this.responseText);
    countries = countries["countries"];

    var select = document.getElementById("countries");

    for(var i in countries) {
        if(trav.countryID == countries[i].id)
            select.innerHTML += '<option value="'+countries[i].id+'" selected>'+countries[i].name+'</option>';
        else
            select.innerHTML += '<option value="'+countries[i].id+'">'+countries[i].name+'</option>';
    }
}
var next = 3;
function addAccordium() {
    next++;

    var id = "panel#"+next;
    var text = document.createElement('div');
    text.innerHTML += '<form action="/saveExpense" onsubmit="return saveExpense(\'form#"'+next+'"\')" id="form#'+next+'" class="expense#'+next+'" method="post" enctype="multipart/form-data">'+
                      ' <button type="button" class="accordion #'+next+'" id="'+next+'"></button>'+
                      ' <div class="panel '+next+' newExpense" style="margin-left: 1em; margin-right: 1em;">'+
                      '    <p>Name<input type="text" onchange="edited('+next+', this.value, this)" name="name" id="name" value=""></p>'+
                      '    <p>Amount (&euro;)<input type="text" name="amount" id="amount"></p>'+
                      '    <p>Proof<input type="file" accept="image/*" name="file" id="file" ></p>'+
                      '    <p>Uploaded: <input type="text" name="travelid" id="travelid" value="1" style="visibility: hidden"></p>'+
                      '    <p><button type="button" class="remove" onclick="remove(\'expense#'+next+'\')" name="status" id="status" style="margin-bottom: 5px;">Remove</button></p>'+
                      '    <p><input type="submit" value="Submit" class="submit"></p>'+
                      '    <p><button type="button" class="submit" style="margin-bottom: 5px;">View</button></p>'+
                      ' </div>'+
                      '</form>';

    document.getElementById("acc").appendChild(text);

    var acc = document.getElementsByClassName("accordion #"+next);

    setTimeout(function() {acc[0].click(); document.getElementById("name").focus();}, 100);
    var i;
    for (i = 0; i < acc.length; i++) {
        acc[i].onclick = function(){
            this.classList.toggle("active");
            this.nextElementSibling.classList.toggle("show");
      }
    }
}

function edited(id, val, input) {
    document.getElementById(id).innerHTML = val;
    input.innerHTML = val;
}

function remove(id) {
    var toRemove = document.getElementsByClassName(id);
    console.log(toRemove);
    toRemove[0].remove();
}

function saveJSON() {
    var acc = document.getElementById("acc");
    console.log(acc);
}

class Expense {
  constructor(name, amount) {
    this.name = name;
    this.amount = amount;
  }
}

function checkTravel() {

}

function saveExpense(form) {
    var name = document.forms[form]["name"].value;
    var amount = document.forms[form]["amount"].value;
    var file = document.forms[form]["file"];

    console.log(file);

    console.log(name + " " + amount + " " + file);

    return true;
}


function viewProof(id) {
  var modal = document.getElementById('myModal');
  var modalImg = document.getElementById("img01");
  $.ajax({
    type: "GET",
    url: "/viewProof/" + id,
    success: function(data) {
      console.log(data.constructor.name);
      modal.style.display = "block";
      modalImg.src = data;
    }
  });
}

function closeModal() {
  var modal = document.getElementById('myModal');
  modal.style.display = "none";
}
